# Installing Magnolia #
## Get Java ##
1. JRE is needed
	1. `java -version`
2. If not
	1. Download and install Oracle JDK
	2. Set `JAVA_HOME`

## Download Magnolia ##
1. [magnolia-community-demo-bundle.zip](https://nexus.magnolia-cms.com/content/repositories/magnolia.public.releases//info/magnolia/bundle/magnolia-community-demo-bundle/6.0/magnolia-community-demo-bundle-6.0-tomcat-bundle.zip)
2. Extract the zip
3. Structure

		magnolia-x.y/
			add-ons/
			apache-tomcat-x.y/
				bin/
				conf/
				lib/
				logs/
				temp/
				webapps/
					magnoliaAuthor/
					magnoliaPublic/
					ROOT/
				work/

	1. Put it in `C:\Users\<username>\magnolia`
	2. Put it in `/home/<your account>/` or `/opt`
4. Start Magnolia
	1. Go to `magnolia-x.y/apache-tomcat-x.y/bin`
		1. `./magnolia_control.sh start`
			1. If error run as follows:

					./magnolia_control.sh start --ignore-open-files-limit

## Install Magnolia ##
1. Open a browser and go to `http://localhost:8080`
2. Click on **Run the Web update on the author instance**, then **Start installation**
3. Click on **Run the Web update on the public instance**, then **Start installation**
4. Click **Start up Magnolia** on both

## Log in ##
1. Go to `http://localhost:8080/magnoliaAuthor` and sign in
	1. username: `superuser` (sys admin account)
	2. password: `superuser`		

## Troubleshooting ##