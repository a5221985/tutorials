# Introduciton #
## Quick Overview ##
1. `<settings>` element:
	1. It has elements to configure Maven execution (like in `pom.xml`) which must not be bundled to any project and must not be distributed to audience
		1. Values:
			1. Local repository location
			2. Alternate remote repository servers
			3. Authentication information
2. Locations of `settings.xml`
	1. `${maven.home}/conf/settings.xml`: has global settings
	2. `${user.home}/.m2/settings.xml`: has user settings
		1. Dominant over global settings (if conflict exists)
		2. Global settings are merged into it (if global `settings.xml` exists)
3. Top elements:

		<settings xmlns=...
			xmlns:xsi=...
			xsi:schemaLocation=...
		>
			<localRepository/>
			<interactiveMode/>
			<usePluginRegistry/>
			<offline/>
			<pluginGroups/>
			<servers/>
			<mirrors/>
			<proxies/>
			<profiles/>
			<activeProfiles/>
		</settings>

## Settings Details ##
### Simple Values ###

		<settings ...
		>
			<localRepository>${user.home}/.m2/repository</localRepository>
			<interactiveMode>true</interactiveMode>
			<usePluginRegistry>false</usePluginRegistry>
			<offline>false</offline>
			...
		</settings>

1. `localRepository`: path of the build system's local repository
2. `interactiveMode`:
	1. `true`: maven should interact with user for input
	2. `false`: maven should not interact
3. `usePluginRegistry`:
	1. `true`: maven will use `${user.home}/.m2/plugin-registry.xml` to manage plugin versions (dormant for maven 2.0)
4. `offline`:
	1. `true`: if the build system should operate in offline mode (for servers which cannot connect to remote repository)

### Plugin Groups ###
1. `<pluginGroups>` contains `<pluginGroup>` elements:
	1. `<pluginGroup>` contains groupId
		1. If group id is not provided in commandline, the `<pluginGroups>` list is searched for the `groupId`
		2. automatically contains `org.apache.maven.plugins` and `org.codehaus.mojo`

				<pluginGroups>
					<pluginGroup>org.mortbay.jetty</pluginGroup>
				</pluginGroups>

		3. Example:

				mvn jetty:run # truncated version of org.mortbay.jetty:jetty-maven-plugin:run

### Servers ###
1. Contains settings such as `username` and `password` which should not be distributed along with `pom.xml`

		<servers>
			<server>
				<id>server001</id>
				<username>my_login</username>
				<password>my_password</password>
				<privateKey>${user.home}/.ssh/id_dsa</privateKey>
				<passphrase>some_passphrase</passphrase>
				<filePermissions>664</filePermissions>
				<directoryPermissions>775</directoryPermissions>
				<configuration></configuration>
			</server>
		</servers>

	1. `id`: ID of server that matches `id` of repository/mirror that Maven tries to connect to
	2. `username`, `password`: credentials required to authenticate to the server
	3. `privateKey`, `passphrase`: path to private key and a passphrase.
	4. `filePermissions`, `directoryPermissions`: permissions to use when file or directory is created on deployment
2. Password encryption has been added

### Mirrors ###
1. Example:

		<mirrors>
			<mirror>
				<id>planetmirror.com</id>
				<name>PlanetMirror Australia</name>
				<url>http://downloads.planetmirror.com/pub/maven2</url>
				<mirrorOf>central</mirrorOf>
			</mirror>
		</mirrors>

	1. `id`, `name`: unique id and user friendly name for the mirror.
		1. `id`: used to pick corresponding credentials from `<servers>`
	2. `url`: base URL of the mirror
		1. Build system will use the URL to connect to a repository rather than original repository URL 
	3. `mirrorOf`: it is the id of the repository that this mirror is a mirror of.
		1. example: to point to a mirror of Maven `central` repository, set it to `central` (must not be mirror `id`)
		2. Repositories can be declared inside a project

				<project>
					...
					<repositories>
						<repository>
							<id>my-internal-site</id>
							<url>http://myserver/repo</url>
						</repository>
					</repositories>
					...
				</project>

			1. Authentication information can be provided in `settings.xml` under `<servers>` element
		3. Useful when an alternative mirror for a particular repository needs to be used without changing the project files.
			1. Why?
				1. geaographically closer synchronized mirror
				2. Replace repository with own internal repository
				3. provide local cache to a mirror
		4. Example: To use European Central instance instead of Central US repository, configure a mirror as follows:

				<settings>
					...
					<mirrors>
						<mirror>
							<id>UK</id>
							<name>UK Central</name>
							<url>http://uk.maven.org/maven2</url>
							<mirrorOf>central</mirrorOf>
						</mirror>
					</mirrors>
					...
				</settings>

### Proxies ###
1. Example:
	
			<proxies>
				<proxy>
					<id>myproxy</id>
					<active>true</active>
					<protocol>http</protocol>
					<host>proxy.somewhere.com</host>
					<port>8080</port>
					<username>proxyuser</username>
					<password>somepassword</password>
					<nonProxyHosts>*.google.com|ibiblio.org</nonProxyHosts>
				</proxy>
			</proxies>

	1. `id`: unique id for proxy. (only a differentiator)
	2. `active`:
		1. `true`: proxy is active (useful when set of proxies are declared but only one may be active)
	3. `protocol`, `host`, `port`: `protocol://host:port` of proxy
	4. `username`, `password`: login and password to authenticate to proxy server
	5. `nonProxyHosts`: list of hosts which must not be proxied.
		1. Delimiter type: depends on expected type of proxy server
2. Required if company has set up a firewall and HTTP proxy server is set up to stop user connecting directly to the internet, then Maven will fail to download dependencies.
	1. When proxy is set up, Maven will be able to connect to the internet through the proxy server

### Profiles ###
1. `<profile>` element in `settings.xml` is a truncated version of `pom.xml` `<profile>` element.
	1. Elements:
		1. `<activation>`
		2. `<repositories>`
		3. `<pluginRepositories>`
		4. `<properties>`
2. If a profile is active in `settings.xml`, its values will override those ID'd profiles in POM or `profiles.xml`

#### Activation ####
1. Profile modifies some values only under certain circumstances
2. `<activation>`: specifies the conditions under which certain values will be modified
3. Example:

		<profiles>
			<profile>
				<id>test</id>
				<activation>
					<activeByDefault>false</activeByDefault>
					<jdk>1.5</jdk>
					<os>
						<name>Windows XP</name>
						<family>Windows</family>
						<arch>x86</arch>
						<version>5.1.2600</version>
					</os>
					<property>
						<name>mavenVersion</name>
						<value>2.0.3</value>
					</property>
					<file>
						<exists>${basedir}/file2.properties</exists>
						<missing>${basedir}/file1.properties</missing>
					</file>
				</activation>
				...
			</profile>
		</profiles>

	1. `jdk`: this will get activated if test is run under jdk version number that matches the given prefix in `<jdk>` element (`1.5.0_06` will match)
	2. `os`: operating system specific properties
	3. `property`: profile will get activated if a value which can be dereferenced from `${name}` gets detected of the given `name=value` pair
	4. `file`: profile gets activated if the file specified exists or if it is missing
4. Another way of activating a profile is using `-P` option

#### Properties ####
1. `<properties>` are placeholders for values
	1. Values are accessible using `${X}` syntax where `X` is a property
	2. Types:
		1. `env.X`: returns shell's environment variable
		2. `project.X`: returns 1.0 from `<project><X>1.0</X></project>`
		3. `settings.x`: returns false from `<settings><x>false</x><settings>`
		4. `${java.home}` returns those accessible via `java.lang.System.getProperties()`
		5. `x`: set within `<properties/>` element in `settings.xml`

				<profiles>
					<profile>
						...	
						<properties>
							<user.install>${user.home}/our-project</user.install>
						</properties>
						...
					</profile>
				</profiles>

#### Repositories ####
1. Used to define remote repositories which maven uses to populate the build system's local repository (since maven calls the plugins and dependencies from the local repository after download them)
2. Repositories specified in active profile may be searched for release or snapshot artifacts

		<profiles>
			<profile>
				...
				<repositories>
					<repository>
						<id>codehausSnapshots</id>
						<name>Codehaus Snapshots</name>
						<releases>
							<enabled>flase</enabled>
							<updatePolicy>always</udpatePolicy>
							<checksumPolicy>warn</checksumPolicy>
						</releases>
						<snapshots>
							<enabled>true</enabled>
							<updatePolicy>never</updatePolicy>
							<checksumPolicy>fail</checksumPolicy>
						</snapshots>
						<url>http://snapshots.maven.codehaus.org/maven2</url>
						<layout>default</layout>
					</repository>
				</repositories>
				<pluginRepositories>
					...
				</pluginRepositories>
				...
			</profile>
		</profiles>

	1. `releases`, `snapshots`: specifies policies for each type of artifact (release/ snapshot)
		1. `enabled`: whether repository is enabled or disabled for the particular type (release or snapshot)
		2. `updatePolicy`: how often should updates occur.
			1. maven compares local POM's timestamp with remote POM's.
			2. Choices:
				1. `always`
				2. `daily`
				3. `interval:X` (X is integer in minutes)
				4. `never`
		3. `checksumPolicy`: maven deploys corresponding checksum files when it deploys files.
			1. `ignore`,`fail`, `warn`: when checksum is missing or incorrect
		4. `layout`: specifies default layout of maven 2 or legacy layout of maven 1.x for the repository description

#### Plugin Repositories ####
1. Plugins are second types of artifacts (first type are dependencies of other artifacts).
2. Plugin repositories can be separated from the other repositories by specifying `pluginRepositories` (similar to `repositories`)
	1. We can specify remote repositories where maven can find plugins

### Active Profiles
1. Example:

		<activeProfiles>
			<activeProfile>env-test</activeProfile>
		</activeProfiles>

	1. `<activeProfile>`: specifies a profile id.
		1. a matching profile with matching `id` in `pom.xml` or `profile.xml` will be activated (if not found normal execution is continue) 