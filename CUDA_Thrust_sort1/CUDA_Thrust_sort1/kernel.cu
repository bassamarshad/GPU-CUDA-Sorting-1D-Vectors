#include<time.h>
#include<chrono>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/sort.h>
#include <iostream>
#include<algorithm>
#include<random>

using namespace std;
using namespace std::chrono;

int Random(){

	return rand();
}


float get_random_float()
{
	static std::default_random_engine e;
	static std::uniform_real_distribution<> dis(0.0, 11000.0); // range 0 - 1
	return dis(e);
}



void sortGPU(int size);
void sortCPU(int size);
void sortGPUFloat(int size);
void sortCPUFloat(int size);



int main()
{
	int n;
	cout << "Start !! \n";
	cout << "\n Enter Numbers to generate :  \n";
	cin >> n;
	sortCPU(n);
	sortGPU(n);

	//sortCPUFloat(n);
	//sortGPUFloat(n);
	 

	return 0;
}



void sortGPU(int size)
{

	thrust::host_vector<int> hv(size);
	thrust::device_vector<int> dv(size);
	thrust::generate(hv.begin(), hv.end(), Random);

	cout << "\n Generated " << size << " random element integer vector \n";

	dv = hv;

	high_resolution_clock::time_point t1 = high_resolution_clock::now();

	thrust::sort(dv.begin(), dv.end());

	high_resolution_clock::time_point t2 = high_resolution_clock::now();

	duration<double> time_span = duration_cast<duration<double>>(t2 - t1);

	std::cout << "\n Sorted " << size << " randomly generated element array in " << time_span.count() << " seconds on GPU ";
	cout << "\n";



	hv = dv;

}

void sortCPU(int size)
{
	std::vector<int> cppV(size);

	std::generate(cppV.begin(), cppV.end(), Random);

	cout << "\n Generated " << size << " random element integer vector \n";

	high_resolution_clock::time_point t1 = high_resolution_clock::now();

	std::sort(cppV.begin(), cppV.end());

	high_resolution_clock::time_point t2 = high_resolution_clock::now();

	duration<double> time_span = duration_cast<duration<double>>(t2 - t1);

	std::cout << "\n Sorted " << size << " randomly generated element array in " << time_span.count() << " seconds using CPU ";
	cout << "\n";


}

void sortGPUFloat(int size)
{

	thrust::host_vector<float> hv(size);
	thrust::device_vector<float> dv(size);
	thrust::generate(hv.begin(), hv.end(), get_random_float);

	cout << "\n Generated " << size << " random element float vector \n";

	dv = hv;

	high_resolution_clock::time_point t1 = high_resolution_clock::now();

	thrust::sort(dv.begin(), dv.end());

	high_resolution_clock::time_point t2 = high_resolution_clock::now();

	duration<double> time_span = duration_cast<duration<double>>(t2 - t1);

	std::cout << "\n Sorted " << size << " randomly generated element array in " << time_span.count() << " seconds on GPU ";
	cout << "\n";



	hv = dv;

}

void sortCPUFloat(int size)
{
	std::vector<float> cppV(size);

	std::generate(cppV.begin(), cppV.end(), get_random_float);

	cout << "\n Generated " << size << " random element float vector \n";

	high_resolution_clock::time_point t1 = high_resolution_clock::now();

	std::sort(cppV.begin(), cppV.end());

	high_resolution_clock::time_point t2 = high_resolution_clock::now();

	duration<double> time_span = duration_cast<duration<double>>(t2 - t1);

	std::cout << "\n Sorted " << size << " randomly generated element array in " << time_span.count() << " seconds using CPU ";
	cout << "\n";


}