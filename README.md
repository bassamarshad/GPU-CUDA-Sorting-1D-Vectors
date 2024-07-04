# GPU-CUDA-Sorting-1D-Vectors
C++ CUDA Sorting 1d integer and float vectors along with running time comparision

#Integer Vector

![Alt text](/thrust_cuda_sort3.png?raw=true "CUDA Sort - Integer Vector - Analysis (GPU vs CPU Running Time)")

#Float Vector

![Alt text](/cuda_sort_float.png?raw=true "CUDA Sort - Float Vector - Analysis (GPU vs CPU Running Time)")

#Compile on Linux:

CUDA/Thrust dependencies on g++-10
sudo apt install g++-10

Compile using nvcc:
nvcc -ccbin g++-10 kernel.cu -o sort_cuda

