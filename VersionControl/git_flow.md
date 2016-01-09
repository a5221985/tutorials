# Git Flow #
## Introduction ##
1. Defines strict branching model designed around project release
	1. It is robust for large projects
2. Good for scheduled release cycle
3. Assigns specific roles to branches and defines how and when they should interact
	1. Feature branches
	2. Release branches: preparation, maintenance and releases
4. [git-flow toolset](https://github.com/nvie/gitflow): Integrates with git
	1. Gitflow Git command line tool extensions

### Getting Started ###
1. Gitflow: Abstract idea of Git workflow
	1. What branches to setup and how to merge them
2. Installation:
	1. OSX: `brew install git-flow`
	2. Windows: [download and install git-flow](https://git-scm.com/download/win)
3. Usage: `git flow init` (extension of `git init`) - initiates branches
	1. It is a wrapper around Git

### How it works ###

![git_flow_how_it_works](git_flow_how_it_works.svg)

## Develop and Master Branches ##
1. Two branches are used to record history: 
	1. **master**: Official release history
		1. We can tag commits in master with a version number
	2. **develop**: Integration branch for features
2. Empty **develop** branch

		git branch develop
		git push -u origin develop

	1. **develop**: contains complete history of the project
	2. **master**: contains abridged history of the project
3. Using git-flow:

		git flow init

	1. The following branch is created
		1. **develop**

### Feature Branches ###
1. Each feature resides in its own branch
	1. It must be pushed to central repo for backup/collaboration
2. **feature** branches are from **develop** (parent)
	1. When it completes, it gets merged into **develop**
	2. They never interact directly with **master**

	![git_flow_feature_branches](git_flow_feature_branches.svg)

	1. Usually created off of latest **develop** branch 

## Building a feature branch ##
1. Without git-flow:

		git checkout develop
		git checkout -b feature_branch

2. Using git-flow

		git flow feature start feature_branch

	1. Continue using it like normal git

## Finishing a feature branch ##
1. After development, merge **feature_branch** into **develop**
2. Without git-flow

		git checkout develop
		git merge feature_branch

3. Using git-flow

		git flow feature finish feature_branch

### Release Branches ###

![git_flow_release_branches](git_flow_release_branches.svg)

1. Created when
	1. Enough features for a release are merged into **develop**
	2. Predetermined release date is approaching
2. Release branch is forked out of **develop**
	1. Starts next release cycle
	2. No new features can be added after this point
	3. Only bug fixes, documentation generation, other release oriented tasks can go into this branch
	4. When release branch is ready to ship, it is merged into **master** and tagged with version number
		1. It is also merged into **develop**
			1. Helps one team polish the release and other team to work on development
			2. Helps recognize version in the structure of the repository
3. Without git-flow:

		git checkout develop
		git checkout -b release/0.1.0

4. Using git-flow:

		git flow release start 0.1.0

5. Once release is ready to ship it gets merged into master and develop and release branch gets deleted
	1. Send pull request for code review
6. Finishing release branch:
	1. Without git-flow:

			git checkout develop
			git merge release/0.1.0

	2. Using git-flow:

			git checkout master
			git checkout merge release/0.1.0
			git flow release finish '0.1.0'

### Hotfix Branches ###

![git_flow_hotfix_branches](git_flow_hotfix_branches.svg)

1. Hotfix branch: used to quickly patch production releases
	1. Similar to release and feature branches but branched out of **master**
	2. After fix it must be merged into **master** and **develop** (or current **release** branch)
	3. **master** should be tagged with updated version number
2. Allows team to address issues without affecting rest of the workflow or waiting for next release cycle
	1. They are like ad hoc release branches but work directly with **master**
3. Without git-flow:

		git checkout master
		git checkout -b hotfix_branch

4. Using git-flow:

		git flow hotfix start hotfix_branch

5. Finishing a hotfix branch:
	1. Without git-flow:

			git checkout master
			git merge hotfix_branch
			git checkout develop
			git merge hotfix_branch
			git branch -D hotfix_branch

	2. Using git-flow:

			git flow hotfix finish hotfix_branch

### Example ###
1. Complete feature branch flow:

		git checkout master
		git checkout -b develop
		git checkout -b feature_branch
		# work happens on feature branch
		git checkout develop
		git merge feature_branch
		git checkout master
		git merge develop
		git branch -d feature_branch

2. Hotfix example:

		git checkout master
		git checkout -b hotfix_branch
		# work is done commits are added to the hotfix_branch
		git checkout develop
		git merge hotfix_branch
		git checkout master
		git merge hotfix_branch
		# can merge to release branch as well

## Summary ##
1. Git flows is one of the styles of git workflows:
	1. Good for release based software workflow
	2. Offers dedicated channel for hotfixes to production
2. Overall flow:
	1. **develop** branch is created from **master**
	2. **release** branch is created from **develop**
	3. **feature** branches are created from **develop**
	4. When **release** branch is done, it is merged into **develop** and **master**
	5. If an issue in **master** is detected, **hotfix** branch is created from **master**
	6. Once **hotfix** is completed, it is merged to both **develop** and **master** (optionally to **release** branch)
3. [Forking Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow)
4. [Workflow comparison page](https://www.atlassian.com/git/tutorials/comparing-workflows)
