# Nexus #
## Introduction ##

## Concepts ##
### Introduction ###
### The Basics - Components, Repositories and Repository Formats ###
### An Example - Maven Repository Format ###
### Repository Management ###
### Software Supply Chain Automation ###

## Installation and Running ##
### Introduction ###
### Downloading ###
### Java Runtime Environment ###
### Installing and Running with the Distribution Archive ###
### Installing with Docker ###
### Configuring as a Service ###
#### Setting up as a Service on Linux ####
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
#### Updating Memory Allocation and other JVM Parameters ####
#### Changing the HTTP Port ####
#### Changing the Context path ####
#### Configuring the Data Directory ####
### Uninstalling ###

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
### Maven Repository Format ###
### Proxying Maven Repositories ###
#### Proxying the Oracle Maven Repository ####
### Hosting Maven Repositories ###
### Grouping Maven Repositories ###
### Browsing and Searching Maven Repositories ###
### Configuring Apache Maven ###
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
