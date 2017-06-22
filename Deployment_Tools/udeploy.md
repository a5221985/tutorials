# Urban Code Deploy #
## Tutorials ##
### Creation of a simple helloWorld deployment ###
#### Introduction ####
1. Simple app with IBM UrbanCode Deploy
2. Plugins for creation of component and defining app that deploys component to an environment

#### Learning Objectives ####
1. Creation of a component and adding a user-defined property to it
2. Import artifacts to creation of a component version

### Deploying a simple web application ###
#### Introduction ####
1. Deployment of a web app
2. Creation of components, an app that contains the components
3. Deploy the component to an environment
4. Creation of an app and app process
5. Configure environment with resources and apply a user-defined tag to it
6. Run the app process to deploy the component

#### Introduction ####
1. Deployment is done by moving some files on local file system to another location on file system.

#### Prerequisites ####
1. Installation of IBM UrbanCode Deploy server
2. Installation of agent
	1. [Installing IBM UrbanCode Deploy](https://www.ibm.com/support/knowledgecenter/SS4GSP_6.2.4/com.ibm.udeploy.install.doc/topics/install_ch.html?view=kc)
		1. From server, click **Resources** > **Agents**
		2. Click **Install New Agent**
			1. Click **Install Agent** for discoverable agent (has **Installable** status)
		3. Select **SSH** (Not for disovered agent)
		4. Enter IP address of system where you want to install agent in **Target Hosts** field
			1. Type multiple entires in separate lines
		5. Specify:
			1. SSH port address of target system in **SSH Port** field
			2. Select **Use Public Key Authentication** check box to use public key authentication instead of password
			3. Enter agent name in **Agent Name** field
 
### Creation of and deploying snapshots ###
#### Introduction ####
1. Deployment of web app to new environment
2. Generate snapshot of components and deploy