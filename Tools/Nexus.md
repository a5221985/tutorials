# Nexus #
## Introduction ##
1. Concepts of repository management, software supply chain management, component management.
2. Nexus Repository Manager Pro, Nexus Repository Manager OSS.
3. Setup and running Repository manager

## Concepts ##
### Introduction ###
1. Component?
2. Repository?
3. Repository format?
4. ...

### The Basics - Components, Repositories and Repository Formats ###
1. What are components?
	1. resource like library or framework used as part of software app at runtime, integration or unit test execution time or is part of build process
		1. image
		2. other app
	2. Examples:
		1. Java byte code in class files
		2. C object files
		3. text files eg. properties files, XML files, JavaScript code, HTML, CSS
		4. Binary files: images, PDF files, sound, music files
		5. ...
2. Formats of archives:
	1. Java JAR, WAR, EAR, ...
	2. Plain ZIP or .tar.gz
	3. Package formats NuGet, Ruby gems, NPM packages
	4. Executables .exe, .sh, Android APK, installer formats...
3. They can be composed of nested components
	1. Java web app package as war
		1. It can have a jar and number of JavaScript libraries
		2. Standalone components included as part of war component
4. Components are building blocks for building powerful apps by assembing them.
	1. They are also called artifact, package, bundle, archive, ...

### An Example - Maven Repository Format ###
### Repository Management ###
### Software Supply Chain Automation ###

## Installation and Running ##
### Introduction ###
1. Nexus repository manager is a Java app and requires Java Runtime Environment.
2. App runs with Eclipse Jetty servlet container and Apache Karaf OSGI-container

### Downloading ###
1. [Sonatype](http://www.sonatype.com/nexus-repository-oss)
2. Download plain archives for OS.

### Java Runtime Environment ###
1. Java 8 Runtime Environment (JRE) from Oracle.
2. Confirm installation: `java -version`
3. To set path for specific Java version:
	1. Open `bin/nexus` script
	2. Change as following: `INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/java-8-oracle`
		1. `bin/java` is checked
		2. major and minor version of runtime are checked
		3. `JAVA_HOME` is checked

### Installing and Running with the Distribution Archive ###
1. Unpack the archive

		tar xvfz nexus-<version>-uniz.tar.gz
		
2. Put it in `/opt`
	1. Two directories get created
		1. App directory
		2. Work directory (contains data directory)
3. `bin` contains startup scripts
4. To start repository manager:

		`./nexus run` (runs in current shell)

### Installing with Docker ###
1. [the Sonatype nexus3 Docker Hub image](https://hub.docker.com/r/sonatype/nexus3/)

### Configuring as a Service ###
#### Setting up as a Service on Linux ####
1. Change `NEXUS_HOME` to absolute folder location in `.bashrc`

		NEXUS_HOME="/opt/nexus"
		
2. In `bin/nexus.rc` assign user in line below

		run_as_user="nexus"
		
3. If using `init.d` symlink `$NEXUS_HOME/bin/nexus` to `/etc/init.d/nexus`

		sudo ln -s $NEXUS_HOME/bin/nexus /etc/init.d/nexus
		
4. `update-rc.d`

		cd /etc/init.d
		sudo update-rc.d nexus defaults
		sudo service nexus start

#### Running as a Service on Windows ####
### Running Behind a Reverse Proxy ###
#### Example: Reverse Proxy on Restricted Ports ####
#### Example: Reverse Proxy Virtual Host at Custom Context Path ####
#### Example: Reverse Proxy SSL Termination at Base path ####
### Accessing the User Interface ###
### Directories ###
#### Installation Directory ####
#### Data Directory ####
### Configuring the Runtime Environment ###
1. `$install-dir/bin/nexus.vmoptions`

#### Updating Memory Allocation and other JVM Parameters ####
1. `$install-dir/bin/nexus.vmoptions`:

		-Xms1500M
		-Xmx2G
		
2. GC algorithm can also be configured in the same file

#### Changing the HTTP Port ####
1. Defualt: `8081`
2. Open `$data-dir/etc/nexus.properties` and locate `application-port=8081`. Change it.

#### Changing the Context path ####
1. In `$data-dir/etc/nexus.properties`, locate `nexus-context-path=/`. Change it to:

		nexus-context-path=/components/
		
2. Exposed URL is:

		http://localhost:9081/components/

#### Configuring the Data Directory ####
1. In `$install-dir/bin/nexus.vmoptions`
	1. Change the following to absolute path:
		1. `-Dkaraf.data`
		2. `-DJava.io.tmpdir`
		3. `-XX:LogFile`
2. Example:

		-Dkaraf.data=/opt/sonatype-work/nexus3
		-Djava.io.tmpdir=/opt/sonatype-work/nexus3/tmp
		-XX:LogFile=/opt/sonatype-work/nexus3/log/jvm.log

### Uninstalling ###
1. Remove service config
2. Remove the directory

## Using the User Interface ##
### Introduction ###
### User Interface Overview ###
### Searching for Components ###
#### Search Criteria and Component Attributes ####
#### Search Results ####
#### Preconfigured Searches ####
#### Example Use Case - SHA-1 Search ####
### Browsing Repositories and Repository Groups ###
### Viewing Component Information ###
### Working with Your User Profile ###
#### Changing Your Password ####

## Configuration ##
### Introduction ###
### System Configuration ###
#### Bundles ####
#### Accessing and Configuring Capabilities ####
#### Email Server ####
#### Nodes ####
#### Base URL Creation ####
#### HTTP and HTTPS Request and Proxy Settings ####
#### Configuring and Executing Tasks ####

## Repository Management ##
### Blob Stores ###
### Proxy Repository ###
### Hosted Repository ###
### Repository Group ###
### Managing Repositories and Repository Groups ###
### Repository Management Example ###
### Content Selectors ###

## Backing Up and Restoring Nexus Repository Manager ##
### Introduction ###
### Preparing a Backup for Nexus Repository Manager ###
### Configuring and Running an Export configuration & metadata for backup Task ###
### Restoring Exported Databases ###

## Security ##
### Introduction ###
### Realms ###
### Privileges ###
#### Actions ####
### Roles ###
### Users ###
### Anonymous Access ###
### LDAP ###
#### Introduction ####
#### Enabling the LDAP Authentication Realm ####
#### LDAP Connection and Authentication ####
#### User and Group Mapping ####
### Security Setup and User Tokens ###
#### Introduction ####
#### Enabling and Resetting User Tokens ####
#### Accessing User Tokens in Realms ####
#### Accessing and Using Your User Token ####
### Authentication via Remote User Token ###
### Configuring SSL ###
#### Outbound SSL - Trusting SSL Certificates of Remote Repositories ####
#### Outbound SSL - Trusting SSL Certificates Globally ####
#### Outbound SSL - Trusting SSL Certificates Using Keytool ####
#### Inbound SSL - Configuring to Serve Content via HTTPS ####

## Atlassian Crowd Support ##
### Prepare Atlassian Crowd ###
#### Compatibility ####
#### Add New Application to the Atlassian Crowd Server ####
### Configure Nexus Repository Manager Pro Crowd Integration ###
#### Enable the Crowd Capability ####
#### Configure Nexus Repository Manager Pro to Trust Crowd's Secure URL (Optional) ####
### Configure Nexus Repository Manger Pro Crowd Security ###
#### Mapping a Crowd Group to Roles ####
#### Mapping a Crowd User to Roles ####

## Maven Repositories with Apache Maven and Other Tools ##
### Introduction ###
1. Default configuration in Nexus Repo Manager Pro and OSS
2. Instructions for creation of further Maven Repos
3. Searching and browsing repos
4. Build tool configuration for Apache Maven [Ant, Gradle, ...]

### Maven Repository Format ###
1. Version policy:
	1. Release: can be configured for release components with Release version policy. (Central repo uses release policy)
	2. Snapshot: Continuous development is done with snapshot versions which can be supported with Snapshot version policy.
		1. Version has to end with `SNAPSHOT` in POM
		2. Allows repeated uploads where number is composed of date/timestamp
		3. Repo manager and client tools manage metadata files that manage translation from snapshot to timestamp value
	3. Mixed:
		1. Allows supporting both approaches within one repo
2. Layout policy:
	1. Permissive:
		1. Allows configuring layout policy to allow assets in repo to violate default format
	2. Strict:
		1. Default value
		2. Publishing and accessing tools must follow Apache Maven conventions
3. Strict Content Type validation:
	1. Maven repos can be configured to validate any new components to see if MIME-type corresponds to content of the file by enabling this setting. Files with mismatch are rejected.

### Proxying Maven Repositories ###
1. Default installation includes a proxy repository configured to access Central Repository via HTTPS using URL `https://repo1.maven.org/maven2/`
	1. Reduces duplicate downloads
	2. Improves download speeds
2. Proxy other remote repositories as well.
3. How to construct a proxy repository:
	1. [Section 4.3, Repository Management](https://books.sonatype.com/nexus-book/reference3/admin.html#admin-repositories)
	2. Minimal configuration:
		1. Define Name
		2. Define URL for Remote storage (https://repo1.maven.org/maven2/)
		3. Select a Blob store for Storage
	3. A repository gets created with Release version policy and strict layout policy.
	4. Set version policy to mixed if remote repo contains release and snapshot versions

#### Proxying the Oracle Maven Repository ####
1. `https://maven.oracle.com` requires special HTTP options for maven2 (proxy) recipe.
2. Register for an account to access the external repo.
3. Additional steps:
	1. Add `https://maven.oracle.com` to Remote storage field
	2. Check authentication, in HTTP section. Username should be automatically selected under Authentication type
	3. Enter username and password from Oracle account
	4. Check HTTP request settings
	5. Check Enable circular redirects
	6. Check Enable cookies
4. Data requests will be redirected to a queue of different URLs (most involved with authentication)
5. The above options enable maintaining authentication state in a cookie (sent with each request)
	1. Eliminates need for auth related redirects
	2. Avoids timeouts

### Hosting Maven Repositories ###
1. Used to host our own and third party components.
2. Default installation includes two hosted Maven repos.
	1. maven-releases (uses release version policy)
	2. maven-snapshots (uses snapshot version policy)
3. For another hosted Maven repo [Section 4.3, Repository Management](https://books.sonatype.com/nexus-book/reference3/admin.html#admin-repositories)
4. Minimal config steps:
	1. Define Name
	2. Select Blog store for Storage

### Grouping Maven Repositories ###
1. Repository group: recommended way to expose Maven repos from repo manager to users (without any client side config)
2. Allows exposing aggregated content of multiple proxy and hosted repositories as well as other repository groups with one URL for tool config.
3. A new repository be built.
	1. Min config:
		1. Define Name
		2. Select Blob store for Storage
		3. Add Maven repositories to the Members list in the desired order
4. Example: maven-public-group (configured by default)
	1. Aggregates maven-central proxy repo with maven-releases and maven-snapshots hosted repo.
	2. URL of repo group gives access to packages in all three repositories
		1. New component or repo added to group will be available

### Browsing and Searching Maven Repositories ###
1. [Section 3.4, "Browsing Repositories and Repository Groups"](https://books.sonatype.com/nexus-book/reference3/using.html#browse-browse)
2. [Section 3.3, "Searching for Components"](https://books.sonatype.com/nexus-book/reference3/using.html#search-components)

### Configuring Apache Maven ###
1. Add a mirror and override default configuration for central repository in `~/.m2/settings.xml`

		<settings>
			<mirrors>
				<mirror>
					<!-- This sends everything else to /public -->
					<id>nexus</id>
					<mirrorOf>*<mirrorOf>
					<url>http://localhost:9081/repository/maven-public/</url>
				</mirror>
			</mirrors>
			<profiles>
				<profile>
					<id>nexus</id>
					<!-- Enable snapshots for the built in central repo to direct -->
					<!-- all requests to nexus via the mirror -->
					<repositories>
						<repository>
							<id>central</id>
							<url>http://central</url>
							<releases>
								<enabled>true</enabled>
							</releases>
							<snapshots>
								<enabled>true</enabled>
							</snapshots>
						</repository>
					</repositories>
					<pluginRepositories>
						<pluginRepository>
							<id>central</id>
							<url>http://central</url>
							<releases>
								<enabled>true</enabled>
							</releases>
							<snapshots>
								<enabled>true</enabled>
							</snapshots>
						</pluginRepository>
					</pluginRepositories>
				</profile>
			</profiles>
			<activeProfiles>
				<!-- make the profile active all the time -->
				<activeProfile>nexus</activeProfile>
			</activeProfiles>
		</settings>
		
	1. profile: configures repository and pluginRepoitory with id central that overrides same repositories in super pom.
		1. Why? we change repositories by enabling snapshots and replacing URL with bogus URL.
			1. Bogus URL? It is overridden by mirror in same settings.xml
				1. Makes repository contain both release and snapshot components
	2. `mirrorOf`: `*` - all repository requests will be redirected to mirror and to single repository group (`public`)
		1. `external:*`: matches all repositories except those using `localhost` or file based repos
			1. For integration testing: we dont want to redirect repositories defined for integration testing
	3. `activeProfile`: `nexus` profile is defined as active
2. Configure deployment to a repository in pom.xml

		<project>
			...
			<distributionManagement>
				<repository>
					<id>nexus</id>
					<name>Releases</name>
					<url>http://localhost:9081/repository/maven-releases</url>
				</repository>
				<snapshotRepository>
					<id>nexus</id>
					<name>Snapshot</name>
					<url>http://localhost:9081/repository/maven-snapshots</url>
				</snapshotRepository>
			</distributionManagement>
			...
			
3. Credentials for deployment are looked from `server` section in settings.xml using `nexus` in `id`

		<settings>
			...
			<servers>
				<server>
					<id>nexus</id>
					<username>admin</username>
					<password>admin123</password>
				</server>
			</servers>
			
4. [Full example](https://github.com/sonatype/nexus-book-examples)
5. `mvn clean deploy`: build, download dependencies, upload build output to repository manager

### Configuring Apache Ant and Apache Ivy ###
### Configuring Apache Ant and Eclipse Aether ###
### Configuring Gradle ###
### SBT ###
### Leiningen ###

## .NET Package Repositories with NuGet ##

## Private Registry for Docker ##
### Introduction ###
### SSL and Repository Connector Configuration ###
#### Tips for SSL Certificate Usage ####
### Support for Docker Registry API ###
### Hosted Repository for Docker (Private Registry for Docker) ###
### Repository Groups for Docker ###
### Authentication ###
### Accessing Repositories ###
### Searching ###
### Pulling Images ###
### Pushing Images ###

## Node Packaged Modules and npm Registries ##
### Introduction ###
### Proxying npm Registries ###
### Private npm Registries ###
### Grouping npm Registries ###
### Browsing npm Registries and Searching Modules ###
### Configuring npm ###
### npm Security ###
#### Authentication Using Realm and Login ####
#### Authentication Using Basic Auth ####
### Publishing npm Packages ###
### Deprecating npm Packages ###

## Bower Repositories ##
## PyPI Repositories ##

## Ruby, RubyGems and Gem Repositories ##
### Introduction ###
### Proxying Gem Repositories ###
### Private Hosted Gem Repositories ###
### Grouping Gem Repositories ###
### Using Gem Repositories ###
### Pushing Gems ###

## Raw Repositories, Maven Sites and More ##

## Git LFS Repositories ##

## REST and Integration API ##
### Introduction ###
### Writing Scripts ###
### Managing and Running Scripts ###
### Examples ###

## Bundle Development ##

## Webhooks ##
### Introduction ###
### Using Webhooks ###
### Enabling A Global Webhook Capability ###
### Enabling A Repository Webhook Capability ###
### Working With HMAC Payloads ###
### Example Headers And Payloads ###
#### Example Audit Payload ####
#### Example Repository Payload ####
#### Example Repository Asset Payload ####
#### Example Repository Component Payload ####

## Upgrading ##
