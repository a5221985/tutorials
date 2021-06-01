# Secrets #
1. [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)

## Using Secrets as environment variables ##
1. To use secrets as environment variables in a pod
	1. Construct a secret or use an existing one
		1. Multiple pods can reference the same secret
	2. Modify Pod definition in each container that we wish to consume value of a secret key to add an environment variable for each secret key we wish to consume
		1. The environment variable that consumes secret key should populate secret's name and key in `env[].valueFrom.secretKeyRef`
	3. Modify image and/or command line so that program looks for values in specified environment variables