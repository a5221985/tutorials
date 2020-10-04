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
4. Example:

		pipe()
		
		P1 <- fd[0] (read end) -  P2
		P1 - fd[1] (write end) -> P2
		
	1. fork() - (if parent writes to fd[1] then child will read using fd[0] & vice versa)
		1. Child will get both file descriptors
		2. Suppose we close fd0 in parent
		3. Suppose we close fd1 in child
			1. Parent writes data and child reads the data
5. Example:

		#include <unistd.h>
		#include <sys/types.h> <!-- types -->
		#include <errno.h> <!-- perror, str value for errors -->
		#include <stdio.h> <!-- printf, scanf -->
		#include <stdlib.h> <!-- standard library malloc, calloc ... ->
		#include <string.h> <!-- string support -->
		
		int main()
		{
			int pipe_fd[2];
			pid_t pid;
			char buffer[100];
			int r_num;
			memset(buffer, 0, sizeof(buffer));
			char *data = "Hello There";
			
			if (pipe(pipe_fd) < 0)
			{
				print("pipe construct error\n");
				return -1;
			}
			
			if ((pid = fork()) == 0)
			{
				// Child process
				// pipe_fd[0] and pipe_fd[1] are available here
				// pipe_fd[0] is read end of pipe
				
				printf("Pid of child_process=%d= pid_of_childs_parents=%d\n", getpid(), getppid());
				close(pipe_fd[1]);
				
				if ((r_num = read(pipe_fd[0], buffer, sizeof(buffer))) > 0)
				{
					printf("Data read from the child using pipe is = %s\n", buffer);
				}
				
				sleep(1);
				close(pipe_fd[0]);
				exit(0);
			} 
			else if (pid > 0)
			{
				// pipe_fd[0] and pipe_fd[1] are available here
				// pipe_fd[1] is write end of pipe
				printf("Pid of Parent_process = %d= pid_of_Parents_parent= %d\n", getpid(), getppid());
				close(pipe_fd[0]);
				
				sleep(1);
				if (write(pipe_fd[1], data, strlen(data)) != -1)
					printf("Parent Wrote the data = %s\n", data);
				sleep(1);
				close(pipe_fd[1]);
				exit(0);
			}
		}
		
	1. Run the program

### popen IPC ###
1. IPC - popen is an IPC mechanism
	1. popen - pipe stream to or from a process (non-named pipe)

			FILE *popen(const char *command, const char *type)
			
		1. It is a unidirectional pipe
			1. `command` - could be binary or executable file or command
			2. `type` - read or write
			3. `P1 | P2` - only P1 can send data to P2 and not the other way
		2. Shell pipe

				vi text.txt
				
						Hi there
						
				cat text.txt
				cat text.txt | wc -w # pipe to next command
				
		3. C version:

				#include <unistd.h> <!-- unix standard header file -->
				#include <stdlib.h>
				#include <stdio.h>
				#include <string.h> <!-- string manipulation -->
				
				int main()
				{
					FILE *read_fp; // file pointer
					char buffer[BUFSIZ + 1]; // BIFSIZ - 8192 in Linux
					int chars_read; // num of chars read
					
					memset(buffer, '\0', sizeof(buffer)); // makes all 0s
					
					read_fp = popen("./hello", "r"); // opens pipe to the process, we can also run `ls -l`
					
					if (read_fp != NULL)
					{
						chars_read = fread(buffer, sizeof(char), BUFSIZ, read_fp); // file stream pointer is used, number of bytes, buffer
						if (chars_read > 0)
						{
							printf("Data received is:-\n%s\n", buffer);
						}
						
						pclose(read_fp);
						exit(EXIT_SUCCESS);
					}
					exit(EXIT_FAILURE);
				}
				
			1. `file <file-name>` **(M)**

## Section 3: Lab Setup and Virtualization ##
### Introduction to Virtualization ###
1. What is Virtualization?
	1. Virtualization is a means using which we run one operating system inside other to have the benefit of two or more operating systems running in the same physical device
	2. Constructs a mechanism to emulate a hardware so that multiple Operating systems can be used in the same physical machine, each of the virtual machines or guests see exclusive access to underlying hardware
2. What is Hypervisor?
	1. Hypervisor is a piece of software which makes virtualization possible by abstracting guest machine from the physical hardware
		1. Shares hardware
			1. Authority to ensure sharing
	2. Hypervisor abstracts or constructs a layer to separate or share resoruces like CPU, RAM, Disk, Keyboard and Peripherals or devices like USB stick, microphone etc
3. OS talks to physical hardware directly usually
	1. OS can talk to Hypervisor and Hypervisor can talk to Hardware (Type 2)
4. Need for Hypervisor or Virtualization
	1. Helps to develop and test solutions for multiple platforms from the same physical device
	2. We can have the advantage of Windows GUI along with Linux's kernel and Shell access for better productivity
	3. Helps in managing multiple OSs easily within the same physical hardware
	4. Can be used for Malware detection as isolated network
		1. Want to understand how malware behaves
			1. May do anything to the machine (file creation, deletion, corruption, hijack system ...)
	5. State can be maintained with snapshot for experiment. Like testing incompatible sets of packages with apt-get, or yum or python's pip
5. Type 1: VMWare ESXI (different from workstation (desktop))
	1. Directly runs on physical hardware and manages gues OSs
		1. Enterprise solution
6. Host versus Guest Machine
	1. Host machines are the ones which directly interface with the hardware and guest machiens are the ones which interface with hibervisor (serves its request)
	2. Hypervisor may send the request to kernel using Hyper-calls (Equivalent of system call as in Xen) or it interfaces with kernel directly as in KVM
		1. It depends on whether hypervisor is of Type-I or Type-II
7. Xen: Guest OS sets trap and hypercall is called based on trap

### Hypervisor and Its Type ###
1. Types of Hypervisors
	1. There are two types of Hypervisors namely Type-I and Type-II
2. Type-I
	1. A bare metal hypervisor isntalled directly on the physical hardware is called as Type-I hypervisor
	2. Type-I hypervisors are more suitable for enterprise due to licensing cost and physical hardware requirement (no open source alternatives? **KVM** is free but has no user interface - may need own wrappers (spawing VM, refreshing VM, ... - library - libvert) - need KVM internals knowledge)
	3. Some Type-I hypervisors like ESXi or Microsoft Hyper-V can only be installed on Specific hardware
	4. Type-I hypervisor is more performance centric
	5. Drawback for type-I is they are mostly not free
	6. Type-I hypervisor usually supports more RAM, CPU Cores and Disk
		1. Example: 512 GB of RAM
			1. Type-II may not support this huge ram
	7. Examples: Oracle VM, Microsoft Hyper-V, VMWare ESXi, VMWare VSphere
3. Type-2 Hypervisor
	1. Type-2 Hypervisors are also called hosted hypervisor
	2. Some of the type-2 hypervisors like Oracle's virtual box and Xen are free
	3. More Suitable for Desktop and PC environments
	4. Supports fewer physical resources. For example it may or may not support 512 GB RAM
	5. Less performant than type-I hypervisor due to hosted OS acting in between, but still very good for Lab, students and development purpose
		1. All calls go through host OS
4. Architecturally they are different
5. Example: VMware ESXI, KVM(Free) (need to have a know how, libvert), Microsoft Hyper-V (Free but subject to Windoes Licensing cost), Citrix Hypervisor, Oracle VirtualBox (Previously owned by Sun Microsystems) Free, VMware Workstation (For Windows and Linux), VMWare Fusion (For Mac Only), Parallels Desktop (For Mac Only)
	1. KVM GUI?