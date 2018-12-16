# Maven Deploy to Tomcat #
## Tomcat Authentication ##
1. Add `manager-gui` and `manager-script` user roles in `$TOMCAT9_PATH/conf/tomcat-users.xml`

		<?xml version='1.0' encoding='utf-8'?>
		<tomcat-users>
			<role rolename="manager-gui"/>
			<role rolename="manager-script"/>
			<user username="admin" password="password" roles=manager-gui,manager-script"/>
		</tomcat-users>
		
## Maven Authentication ##
1. Add Tomcat's user in Maven setting file `$MAVEN_PATH/conf/settings.xml`

		<?xml version="1.0" encoding="UTF-8"?>
		<settings ...>
			<servers>
				<server>
					<id>TomcatServer</id>
					<username>admin</username>
					<password>password</password>
				</server>
			</servers>
		</settings>

## Tomcat 9 Maven Plugin ##

		<plugin>
			<groupId>org.apache.tomcat.maven</groupId>
			<artifactId>tomcat7-maven-plugin</artifactId>
			<version>2.2</version>
			<configuration>
				<url>http://localhost:8080/manager/text</url>
				<server>TomcatServer</server>
				<path>/simplewebproject</path>
			</configuration>
		</plugin>
		
	1. `http://localhost:8080/manager/text`: deployment is done via the URL
	2. `path`: Context path of the web application
	3. `server`: TomcatServer server setting defined in `settings.xml` is used for authentication purposes

## Deploying to Tomcat ##

		mvn tomcat7:deploy
		mvn tomcat7:undeploy
		mvn tomcat7:redeploy