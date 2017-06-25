# Maven Deploy to Nexus #
## Overview ##
1. Nexus is mature option for hosting third party artifacts for bigger projects + reusing internal artifacts across development streams.

## Nexus Requirements in the pom.xml ##
1. Defining repository info where packaged artifacts will be deployed.

		<distributionManagement>
			<snapshotRepository>
				<id>nexus-snapshots</id>
				<url>http://localhost:9081/repository/maven-snapshots/</url>
			</snapshotRepository>
		</distributionManagement>
	
	1. Public snapshots repository comes out of box on Nexus
	2. URL can be obtained from repository in Nexus Summary (URL) tab

## Plugins ##
1. Mapping `maven-deploy-plugin` to deployment phase of default Maven lifecycle

		<plugin>
			<artifactId>maven-deploy-plugin</artifactId>
			<version>2.8.1</version>
			<executions>
				<execution>
					<id>default-deploy</id>
					<phase>deploy</phase>
					<goals>
						<goal>deploy</goal>
					</goals>
				</execution>
			</executions>
		</plugin>
		
	1. Generic plugin does not take advantage of features offered by Nexus.
	2. Sonatype has built Nexus specific plugin `nexus-staging-maven-plugin` (staging functionality of Nexus (?))
	3. Generic plugin can be used for Nexus alternatives like Artifactory
2. Defining a different plugin

		<plugin>
			<groupId>org.sonatype.plugins</groupId>
			<artifactId>maven-deploy-plugin</artifactId>
			<version>${maven-deploy-plugin.version}</version>
			<configuration>
				<skipt>true</skip>
			</configuration>
		</plugin>
		
		<plugin>
			<groupId>org.sonatype.plugins</groupId>
			<artifactId>nexus-staging-maven-plugin</artifactId>
			<version>1.5.1</version>
			<executions>
				<execution>
					<id>defuault-deploy</id>
					<phase>deploy</phase>
					<goals>
						<goal>deploy</goal>
					</goals>
				</execution>
			</executions>
			<configuration>
				<serverId>nexus</serverId>
				<nexusUrl>http://localhost:9081/nexus/</nexusUrl>
				<skipStaging>true</skipStaging>
			</configuration>
		</plugin>
		
	1. `skipStaging`: skipping staging functionality in simple deployment

## The Global settings.xml ##
1. Deployment is secured process and a user exists for it out of the box.
2. Configure maven with credentials of deployment user
3. Define credentials in global settings.xml

		<servers>
			<server>
				<id>nexus-snapshots</id>
				<username>deployment</username>
				<password>the_pass_for_the_deployment_user</password>
			</server>
		</servers>
		
	1. We can define key based security instead of plain text credentials

## The Deployment Process ##
1. `mvn clean deploy -Dmaven.test.skip=true`
	1. skipping tests is okay because this should be the last job in deployment pipeline
	2. If Jenkins used, previous jobs in the pipeline should run all test suites.
2. If running only single command (in a single job)

		mvn clean deploy

## Conclusion ##
1. Simple effective solution