# Git Commands #
## Fetching Large Repositories ##

		git config --global core.compression 0
		git clone --depth 1 <repo_URI>
		cd <cloned-dir>
		git fetch --unshallow
		git pull --all