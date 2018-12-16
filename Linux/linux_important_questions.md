# Linux Questions #
1. `apt-get update` vs `apt-get upgrade`
	1. update: updates list of available packages and their versions
	2. upgrade: actually installs newer versions of packages that you have
2. How to make a user sudo?
	1. `usermod -aG sudo username` **(M)**
		1. -a: append: add user to supplementary group(s)
		2. -G: groups: list of supplementary groups which the user is a member of
3. What are major and minor device numbers?
	1. Major device number: identifies the driver
	2. Minor device number: identifies the specific device
