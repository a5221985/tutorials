# GPU Computing #
1. Graphics pipeline
	1. Setting object models
	2. Transform into camera space (perspective)
2. GPU: consists of multiple smaller more efficient cores
	1. Matrix operations for deep learning can be parallelized
		1. Parameters can be trained
	2. Frameworks
		1. OpenACC
		2. OpenCL
		3. NVIDIA CUDA
			1. Compute Unified Device Architecture
			2. Extension of C
				1. Has its own programming model
			3. cuDNN: Library of primitives for deep learning
				1. Used by frameworks (Tensorflow, PyTorch)
3. CUDA:
	1. Kernel function is marked with `__global__` keyword

			__global__ void kernel(float *in, float *out) 
			{
				int tid = blockIdx.x * blockDim.x + threadIdx.x;
				out[tid] = in[tid];
			}

		1. Kernel is a function that can be executed in parallel in a GPU
			1. Executed by an array of CUDA threads
				1. All threads run the same code
				2. Each thread has an ID
					1. ID can be used to compute memory addresses and make control decisions
						1. threadID - Thread Block i, ID j (0 <= j <= 7)
				3. CUDA organizes the threads into a grid (hierarchy)
					1. Thread BLock 0, 0
						1. Thread 0, 0
						2. Thread 1, 0
						3. Thread 2, 0
						4. ...
						5. Thread 5, 1
					2. Thread Block 1, 0
					3. ...
		2. Grid is a group of thread blocks that can be processed on the device in parallel
			1. Each thread block is a set of concurrent threads that can cooperate among themselves and access a shared memory space private to the block
				1. Programmer has to specify the grid-block organization on each kernel call
					1. It can be different and has limits set by GPU
	2. Example:

			#include <iostream>
			#include <math.h>

			// function to add the elements of two arrays
			void add(int n, float *x, float *y)
			{
				for (int i = 0; i < n; i++)
					y[i] = x[i] + y[i];
			}

			int main(void)
			{
				int N = 1<<20 // 1M elements

				float *x = new float[N];
				float *y = new float[N];

				// initialize x and y arrays on the host
				for (int i = 0; i < N; i++)
				{
					x[i] = 1.0f;
					y[i] = 2.0f;
				}

				// Run kernel on 1M elements on the CPU
				add(N, x, y);

				// Free memory
				delete [] x;
				delete [] y;

				return 0;
			}

	3. Example with GPU: add.cu

			#include <iostream>
			#include <math.h>

			// function to add the elements of two arrays
			__global__
			void add(int n, float *x, float *y)
			{
				int index = threadIdx.x; // thread id of current thread
				int stride = blockDim.x; // block size
				for (int i = index; i < n; i += stride)
					y[i] = x[i] + y[i];
			}

			int main(void)
			{
				int N = 1<<20 // 1M elements

				float *x, float *y; // this must be accessible from both CPU and GPU

				// Allocate Unified Memory - accessible from CPU or GPU
				cudaMallocManaged(&x, N*sizeof(float));
				cudaMallocManaged(&y, N*sizeof(float));

				// initialize x and y arrays on the host
				for (int i = 0; i < N; i++)
				{
					x[i] = 1.0f;
					y[i] = 2.0f;
				}

				// Run kernel on 1M elements on the CPU
				add<<<1, 1>>>(N, x, y); // parameter one is blocks, parameter two is number of threads in the block (must be multiple of 32)

				// Wait for GPU to finish before accessing on host
				cudaDeviceSynchronize(); // blocks this program

				// Free memory
				cudaFree(x);
				cudaFree(y);

				return 0;
			}

		1. `nvcc add.cu -o add_cuda`
		2. `nvprof ./add_cuda`
			1. GPU profiler
	4. Newer version of library uses (CUDA 6+) unified memory architecture which lets us access allocated data from CPU or GPU code
4. Pre-requisites
	1. [Microsoft Build Tools 2015](https://www.microsoft.com/en-in/download/confirmation.aspx?id=48159)