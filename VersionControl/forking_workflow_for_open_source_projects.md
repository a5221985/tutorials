# Forking Workflow (For Open Source Projects) #
## Introduction ##
1. It is different from traditional workflows
2. Every developer can have their own server-side repository
	1. Each contributor can have two repositories
		1. Private local one
		2. Public server-side one
3. Most often used in public open source projects
4. Advantage: We can integrate contributions without pushing to single central repository
	1. Only project maintainer can push to offical repository (without giving write access to official codebase)
5. Follows branching model based on **Gitflow Workflow**
	1. Feature branches are meant to merge into original project maintainer's repository
		1. Distributed workflow
		2. For large organic teams (including untrusted third parties) to collaborate securely
		3. Ideal for open source projects

### How it works ###
1. Begins with official public repository stored on server
2. When new developer wants to work on the project, they don't clone the official repository
	1. They fork official repository to produce a copy of it on server
	2. The new copy is personal public repository (no other developers are allowed to push to it but they can pull changes from it)
	3. Developer clones the personal copy into local machine (private development environment)
	4. Local commit it pushed to own public repository (not official one)
	5. Developer sends a pull request to main repository (project maintainer gets notified that an update is ready to be integrated)
		1. It serves as convenient discussion thread if there are issues with code
3. Step by step example:
	1. Developer 'forks' an 'official' server-side repository (Own server side copy is created)
	2. Server side copy is cloned to local system
	3. Git remote path for 'official' repository is added to local clone
	4. New local feature branch is created
	5. Developer makes changes to new branch
	6. New commits are created for changes
	7. Branch is pushed to own server-side copy
	8. Developer opens pull request from new branch to 'official' repository
	9. Pull request if approved, merged to official server-side repository
4. Maintainer workflow:
	1. Maintainer pulls contributor's changes into local repository
	2. Checks to make sure it doesn't break the project
	3. Merges it into their local master branch
	4. Pushes master branch to official repository on server
		1. Contribution is now part of the project
	5. Other developers should pull from official repository to sync their local repositories
5. Official repository is just the public repository of the maintainer (another developer)

### Forking vs cloning ###
1. Forks are created using `git clone`
	1. forked repositories are server side clones (usually managed and hosted by 3rd party Git service like Bitbucket)
		1. Clone is a copy of the repository and its history

## Branching in the Forking Workflow ##
1. Just a convenient way to share branches with other developers
2. Developer should use branches to isolate individual features

## Fork a repository ##
1. Possible to SSH into server and run `git clone`
2. Git hosting services offer repo forking features

## Clone your fork ##
1. `git clone`
2. Have own bitbucket account
3. Run the following:

		git clone https://user@bitbucket.org/user/repo.git

## Adding a remote ##
1. Origin: remote for forked repository
2. Upstream: official repository

		git remote add upstream https://bitbucket.org/maintainer/repo

	1. If upstream needs authentication (not open source), supply username
			
			git remote add upstream https://user@bitbucket.org/maintainer/repo

		1. Pass password

## Working in a branch: making & pushing changes ##
1. In local copy:
	1. Edit code
	2. Commit changes
	3. Branch (just like other git workflows)

			git checkout -b some-feature
			# Edit some code
			git commit -a -m "Add first draft of some feature"
			git push #push to public repository

2. If official project has moved:
	1. Access new commits using the following:

			git pull upstream master # results in fast forward merge

## Making a Pull Request ##
1. First push to public repository (to make it accessible to other developers)

		git push origin feature-branch

2. Notify project maintainer that they want to merge the feature into official codebase
	1. Pull request
		1. Specify branch: feature branch

## Summary ##
1. Example:
	1. I want to contribute to an open source library hosted at bitbucket.org/userA/open-project
	2. Fork the repo to bitbucket.org/YourName/open-project
	3. Execute `git clone` on local system from `https://bitbucket.org/YourName/open-project` to get local copy of repo
	4. Branch out a feature branch locally
	5. Work on feature branch and commit using `git commit`
	6. Push feature branch to new forked repo
	7. Open pull request for new branch against the original repo at bitbucket.org/userA/open-project
2. Advantages:
	1. Maintainer does not have to manage authorization settings for each individual contributor
		1. "pull" style workflow
	2. Can be used for:
		1. Open source projects
		2. Private business that have more authoritative control over what is merged into release
		3. Teams with deploy managers or strict release cycles