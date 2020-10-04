# Linux System Programming using C and C++ #
## Section 1: Introduction and Important System Call Demo ##
### Fork Internals and Open File Descriptor Inheritance Demo ###
1. Fork system calls
	1. The child process is an exact duplicate of the parent process except for the following points:
		1. The child has its own unique process ID
		2. Child's CPU usage counter are reset to zero, so that it can have a separate usage counter (injustice if it simply inherits)
		3. Child's set of Pending signals are empty (if parent has signals, child need not process signals - signals are ment to specific process which are inended for the process)
		4. The child does not inherit directory change notifications (open dir - if directory change notifications, child doesn't inherit the notifications)
	2. Child inherits the following:
		1. The child inherits the parent's set of open File descriptors (handles provided by open call given to user space)
		2. The child inherits copies of the parent's set of open message queue descriptors (child can manipulate those file descriptors)
		3. The child inherits copies of the parent's set of open directory streams (see opendir)
			1. Not directory change notifications but the opened directories are inherited (descriptors are inherited)
2. Read `man fork`
3. Example:

		#include <stdio.h>
		#include <unistd.h>
		#include <fcntl.h>
		#include <errno.h>
		#include <string.h>
		
		int main()
		{
		    char *data = "This data is from parent";
		    int fd;
		
		    fd = open("./test.txt", O_RDWR | O_CREAT | O_TRUNC, 0777);
		    if (fd == -1)
		        perror("Error in opening the file");
		    pid_t pid = fork();
		    if (pid > 0) // Parent process
		    {
		        if (fd != -1)
		        {
		            printf("Value of the fd from parent process is <%d>\n", fd);
		            write(fd, data, strlen(data));
		        }
		        sleep(2);
		    }
		    else
		    {
		        char buffer[100] = {0};
		        sleep(1);
		        printf("Value of the fd from child process is <%d>\n", fd);
		        lseek(fd, 0, SEEK_SET);
		
		        read(fd, buffer, sizeof(buffer));
		        printf("Data read from the child process is <%s>\n", buffer);
		    }
		    return 0;
		}
		
	1. Same fd is accessible to child as well
	2. `O_TRUNC` - clears file for writing
	3. `lseek` - resets pointer to start in this case
		1. `man 2 lseek` # developers manual
			1. SEEK_SET - offset is set to offest bytes from the beginning of the file
			2. SEEK_CUR - current postion + indicated bytes
			3. SEEK_END - size of file + offset

## Section 2: Interprocess Communication in Linux (IPC) ##
### IPC Using fork and pipe fd ###
1. Fork and pipe

		int fd = open(filename, flag) // unbuffered - directly goes to kernel (may do its own buffering, firmware buffering is possible)
		FILE *fptr = fopen(pathname, mode); // associated with file descriptor which kernel maintains, buffered data (on application side), linux kernel can do buffering and disk can also do
	1. Kernel uses algorithms to flush data and where to write the data
2. Fork constructs new process
	1. If parent has fds, then child will inherit (IPC trick)
	2. Other types of IPCs
		1. Shared memory
		2. Semaphores
		3. Sockets
		4. Netlinks
3. `man 2 pipe`

		int pipe(int pipefd[2]);
		
	1. Kernel internally opens a file and returns a fd
		1. pipefd[0] will have the actual file descriptor (not returned as output)
		2. 

### popen IPC ###