# POM #
## What is POM? ##
## Quick Overview ##

## Basics ##
1. scope: limits transitivity of dependency (refers to classpath of a task)
	1. `compile`: dependencies are available in all classpaths (dependencies are also propagated to dependent projects)
	2. `provided`: the dependency is expected to be provided by JDK or container at runtime. (dependency available only on compilation classpath and test classpath and not transitive)
	3. `runtime`: dependency is not required for compilation but only for execution. (dependency is in the runtime and test classpaths but not in compile classpath)
	4. `test`: dependency is not required for normal use of app (dependency is available only for test compilation and test execution phases)
	5. `system`: similar to provided but the JAR has to be provided explicitly (not looked up in repository)

### Dependency Version Requirement Specification ###
1. `version` element defines the version requirement of the dependency.
2. Synatx:
	1. `1.0`: "Soft" requirement on 1.0 (recommendation)
	2. `[1.0]`: "Hard" requirement (it must be `1.0`)
	3. `(,1.0]`: `x` <= `1.0`
	4. `[1.2,1.3]`: `1.2` <= x <= `1.3`
	5. `[1.0,2.0)`: `1.0` <= x < `2.0`
	6. `[1.5,)`: `x` >= `1.5`
	7. `(,1.0],[2.0,)`: `x` <= `1.0` or `x` >= `2.0`
	8. `(,1.1),(1.1,)`: `x` != `1.1`

### Exclusions ###
1. tells maven not to include specified project that is a dependency of this dependency (transitive dependency)
	1. `maven-embedder` requires `maven-core` (this can be excluded using `<exclusion>` element)

			<dependencies>
				<dependency>
					<groupId>org.apache.maven</groupId>
					<artifactId>maven-embedder</artifactId>
					<version>2.0</version>
					<exclusions>
						<exclusion>
							<groupId>org.apache.maven</groupId>
							<artifactId>maven-core</artifactId>
						</exclusion>
					</exclusions>
				</dependency>
				...
			</dependencies>

	2. Exclude all transitive dependencies of a dependency

			<dependencies>
				<dependency>
					<groupId>org.apache.maven</groupId>
					<artifactId>maven-embedder</artifactId>
					<version>3.1.0</version>
					<exclusions>
						<exclusion>
							<groupId>*</groupId>
							<artifactId>*</artifactId>
						</exclusion>
					</exclusions>
				</dependency>
			</dependencies>

		1. `<exclusions>`: element that contains one or more `<exclusion>` elements
			1. `<exclusion>`: contains `<groupId>` and `<artifactId>` of the dependency that must be excluded (dependency is removed from the dependency tree)

### Inheritance ###
1. Project inheritance: can be defined using POM

		<project ...
		>
			<modelVersion>4.0.0</modelVersion>

			<groupId>org.codehaus.mojo</groupId>
			<artifactId>my-parent</artifactId>
			<version>2.0</version>
			<packaging>pom</packaging>
		</project>

	1. `<packaging>`: specified as `pom` for parent/aggregation (multi-module) projects
		1. Type of the package defines binding of goals to certain lifecycle stages.
			1. Example: if `<packaging>jar</packaging>`, `package` phase will execute `jar:jar` goal
			2. Example: if `<packaging>pom</packaging>`, `package` phase will execute `site:attach-descriptor` goal.
				1. `site:attach-descriptor`: adds the site descriptor (`site.xml`) to the list of files to be installed/deployed. Provides common site descriptor for sub modules
					1. `site.xml`
						1. Example: [http://svn.apache.org/repos/asf/maven/plugins/trunk/maven-site-plugin/src/site/site.xml](http://svn.apache.org/repos/asf/maven/plugins/trunk/maven-site-plugin/src/site/site.xml)
		2. Makes children many elements from parent POM
			1. `<groupId>`
			2. `<version>`
			3. `<description>`
			4. `<url>`
			5. `<inceptionYear>`
			6. ...
		3. Elements which are not inherited:
			1. `artifactId`
			2. `name`
			4. `prerequisites`

### Super POM ###
1. All POMs inherit from base Super POM (like object in Java inherit from `java.lang.Object`)

### Dependency Management ###
1. This is an element used to configure values for Child POMs and transitive dependencies.
	1. `dependencyManagement`: define dependency information across all of its children.
		1. Advantages: definition can be given in central location which is propagated to inheriting POMs
		2. Example:
			1. If `my-parent` project uses `<dependencyManagement>` to define dependency on `junit:junit:4.0`, then all the POMs inheriting from the `my-parent` POM can simply set their dependency as `<groupId>junit</groupId>` and `<artifactId>junit</artifactId>` and maven will automatically fill `<version>` that is set by parent.
		3. If a project needs `dep1` and `dep2` but `dep2` already has dependency on atleast some minimum version of `dep1`. If we specify an older version for `dep1`, `dep2` will be forced to use older version of `dep1` and will fail.
			1. Solution: `mvn dependency:tree`: study the entire dependency tree

### Aggregation (Multi-Module) ###
1. Aggregator project? project with multiple modules
	1. Modules are listed in the project's POM

			<project ...
			>
				<modelVersion>4.0.0</modelVersion>

				<groupId>org.codehaus.mojo</groupId>
				<artifactId>my-parent</artifactId>
				<version>2.0</version>
				<packaging>pom</packaging>

				<modules>
					<module>my-project</module>
					<module>another-project</module>
				</modules>
			</project>

		1. Inter-module dependencies (one module with another) are not considered. (order in POM is not important)
			1. Maven topologically sorts modules (maintaining the dependency order) and buids dependencies first

### Properties ###
1. Property is a placeholder to be used later on.
2. How to access? `${X}`
3. 5 different types:
	1. `env.X`: shell's environemnt variable
	2. `project.x`: example: `${project.version}` in `<project><version>1.0</version></project>`
	3. `settings.x`: example: `${settings.offline}` in `<settings><offline>false</offline></settings>` from `settings.xml`
	4. Java system properties: example: `${java.home}`
	5. `x`: value set in `<properties/>`: example: `${someVar}` in `<properties><someVar>value</someVar></properties>`

## Build Settings ##
1. `<build>`: element that declares project's 
	1. directory structure
	2. manages plugins
2. `<reporting>` mostly mirrors `<build>` element

### Build ###
1. `BaseBuild`: contains elements common to top level `<build>` element and `<build>` element in `<profiles>`
2. Project build and profile build:

		<project ...
		>
			...
			<build>...</build>
			
			<profiles>
				<profile>
					<!-- "Profile Build" contains a subset of "Project Build"s elements -->
					<build>...</build>
				</profile>
			</profiles>
		</project> 

#### The BaseBuild Element Set ####
1. Example:

		<build>
			<defaultGoal>install</defaultGoal>
			<directory>${basedir}/target</directory>
			<finalName>${artifactId}-${version}</finalName>
			<filters>
				<filter>filters/filter1.properties</filter>
			</filters>
			...
		</build>

	1. `defaultGoal`: if no goal/phase is specified `mvn`, this is the goal/phase that will be executed (ex: `jar:jar`)
	2. `directory`: directory where build will dump it's files (build target)
		1. `${basedir}/target`: default
	3. `finalName`: name of final bundled project after it is built (`my-project-1.0.jar`)
		1. `${artifactId}-${version}` is default
	4. `filter`: `*.properties` files that contain list of properties that apply to resources
		1. `name=value` pairs in filter files replace `${name}` strings in resources on build.

##### Resources #####
1. Specifies where resources exist in the project (not code and are not compiled but are bundled with the project)
	1. Example: Plexus requires `configuration.xml` (defines component configurations to container) to live in `META-INF/plexus` directory

			<build>
				...
				<resources>
					<resource>
						<targetPath>META-INF/plexus</targetPath>
						<filtering>false</filtering>
						<directory>${basedir}/src/main/plexus</directory>
						<includes>
							<include>configuration.xml</include>
						</includes>
						<excludes>
							<exclude>**/*.properties</exclude>
						</excludes>
					</resource>
				</resources>
				<testResources>
					...
				</testResources>
				...
			</build>

		1. `resources`: list of `<resource>` elements
		2. `targetPath`: directory structure where to place the resource(s)
			1. Default: base directory
			2. common target path: `META-INF`
		3. `filtering`: `true` - should filtering be enabled for the resource.
		4. `directory`: where are the resources to be found.
			1. Default: `${basedir}/src/main/resources`
		5. `includes`: pattern that specifies the files to be included
		6. `excludes`: pattern that specifies the files which must be ignored
		7. `testResources`: specifies `resource` elements for resources which must be used during test phases.
			1. Default: `${basedir}/src/test/resources`

##### Plugins #####
1. Example:

		<build>
			...
			<plugins>
				<plugin>
					<groupId>org.apache.maven.plugin</groupId>
					<artifactId>maven-jar-plugin</artifactId>
					<version>2.6</version>
					<extensions>false</extensions>
					<inherited>true</inherited>
					<configuration>
						<classifier>test</classifier>
					</configuration>
					<dependencies>...</dependencies>
					<executions>...</executions>
				</plugin>
			</plugins>
		</build>

	1. `extensions`: `true` or `false` - whether to load extensions of the plugin (?)
	2. `inherited`: `true` or `false` - should the plugin configuration of this plugin be applied to POMs which inherit from this one?
	3. `configuration`:
		1. Getters and setters in Java Mojo bean can be specified here
			1. `clasifier` property is set to `test` in `maven-jar-plugin`'s Mojo (it is a mechanism to pass values to a plugin)
	4. ...
	5. `dependencies`: same purpose as those in base build.
		1. These are applied as dependencies of the plugin
		2. `exclusions` can be used to remove unused runtime dependency
	6. `executions`: Used to configure `execution` of a plugin's goal
		1. Example: bind `antrun:run` goal to `verify` phase
	7. Example:

				<plugins>
					<plugin>
						<artifactId>maven-antrun-plugin</artifactId>
						<version>1.1</version>
						<executions>
							<execution>
								<id>echodir</id>
								<goals>
									<goal>run</goal>
								</goals>
								<phase>verify</phase>
								<inherited>false</inherited>
								<configuration>
									<tasks>
										<echo>Build Dir: ${project.build.directory}</echo>
									</tasks>
								</configuration>
							</execution>
						</executions>
						...
					</plugin>
				</plugins>

			1. `id`: specifies execution block
			2. `goals`: list of `<goal>`s
			3. `phase`: phase in which the list of `<goal>`s will execute in. (Alters the default behavior of maven)
			4. `inherited`: `false` suppresses maven from passing this execution to it's children (only if the current POM is a parent)
			5. `configuration`: confines the configuration to the specific list of goals
 
##### Plugin Management #####
1. It is similar to `<plugins>` but it is intended to configure project builds that inherit from this one.
	1. Configures plugins referenced in plugin's element of children (but children can override the pluginManagement)
	2. This POM and all inheriting POMs that add `maven-jar-plugin` to the build will get `pre-process-classes` execution (avoids including the plugin in every child)

#### The Build Element Set ####
##### Directories #####
##### Extensions #####

### Reporting ###
1. Elements for `site` generation phase
	1. Example for generating reports like Javadoc

#### Report Sets ####

### Repositories ###
1. If a project has dependency upon an artifact, maven first attempts to use local copy of the artifact. If the artifact does not exist, it will attempt to download from remote repository.
	1. `<repository>` elements specify the alternate repositories to search

### Plugin Repositories ###
1. Specifies remote location where maven can find plugins

### Distribution Management ###
1. Manages distribution of artifact (and supporting files) generated during build process.
2. Example:

		<project ...>
		
			<distributionManagement>
				...
				<downloadUrl>http://mojo.codehaus.org/my-project</downloadUrl>
				<status>deployed</status>
			</distributionManagement>
			...
		</project>
		
	1. `downloadUrl`: url of repo from where another POM may point to in order to grab this POM's artifact
		1. POM uploads it and public can download from this link
	2. `status`: do not change (status of project is set when it is transported to repo)
		1. Valid types:
			1. `none`: default (no special status)
			2. `converted`: Manager of repo converted this POM from earlier version of Maven to Maven 2
			3. `partner`: synched. artifact is synched with partner repo
			4. `deployed`: common status. artifact is deployed from a Maven 2 or Maven 3 instance (when deployed from commandline)
			5. `verified`: project is verified (finalized)

#### Repository ####
1. Where and how project will get to remote repository when artifact is deployed.
	1. `repository`: used for snapshot distribution if `snapshotRepository` is not defined
2. Example:

		<distributionManagement>
			<repository>
				<uniqueVersion>false</uniqueVersion>
				<id>corp1</id>
				<name>Corporate Repository</name>
				<url>scp://repo/maven2</url>
				<layout>default</layout>
			</repository>
			<snapshotRepository>
				<uniqueVersion>true</uniqueVersion>
				<id>propSnap</id>
				<name>Propellors Snapshots</name>
				<url>sftp://propellers.net/maven</url>
				<layout>legacy</layout>
			</snapshotRepository>
			...
		</distributionManagement>
		...
		
	1. `id`, `name`: `id` uniquely identifies repository. `name` is human readable form
	2. `uniqueVersion`: `true` - artifact generated gets unique version number. `false`: artifact does not get a unique version number (uses version number defined as part of address)
	3. `url`: location and transport protocol used to transfer built artifact (+ POM file + checksum data) to repo.
	4. `layout`: `default` or `legacy`

#### Site Distribution ####
1. To define how to deploy project's site and documentation
1. Example:

		<distributionManagement>
			...
			<site>
				<id>mojo.website</id>
				<name>Mojo Website</name>
				<url>scp://beaver.codehaus.org/home/projects/mojo/public_html/</url>
			</site>
			...
		</distributionManagement>
		
	1. `id`, `name`, `url`: similar to above
	
#### Relocation ####
1. Example:

		<distributionManagement>
			...
			<relocation>
				<groupId>org.apache</groupId>
				<artifactId>my-project</artifactId>
				<version>1.0</version>
				<message>We have moved the Project under Apache</message>
			</relocation>
			...
		</distributionManagement>
		
	1. As projects grow they are forced to move to suitable quarters. (a successful project moving under Apache umbrella). Users are given information that project is being renamed to `org.apache:my-project:1.0` and a message explaining the reason

### Profiles ###
1. Used for changing settings based on the environment in which it is built.
	1. Activation: triggers the profile
	2. Set of changes to be made to POM if profile is triggered
2. Examples:
	1. project built for test environment may point to a different database
	2. Dependencies may be pulled from a different repository for a particular version of JDK

#### Activation ####
##### The BaseBuild Element Set #####

## Maven Dependency Search Sequence [https://www.tutorialspoint.com/maven/maven_repositories.htm](https://www.tutorialspoint.com/maven/maven_repositories.htm) ##
1. Step 1: Search dependencies in local repository, if not found, move to step 2
2. Step 2: Search dependencies in central repository, if not found and if remote repository/repositories is/are mentioned then move to setp 4, if found, then downloaded to local repository for future reference
3. Step 3: If a remote repository has not been mentioned, maven simply stops the processing and throws error (unable to find dependency)
4. Step 4: Search dependency in remote repository/repositories. If found, downloaded to local respository for future reference. If not found, maven throws an error (unable to find dependency)