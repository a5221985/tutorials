# C++ Programming #
## Pre-requisites ##
1. g++
2. Comment

		// Single line comment
		/*
			Multi-line comment
		*/
		
		#include <iostream>
		#include <vector>
		#include <string>
		#include <fstream>
		
		using namespace std;
		
		int main() {
			cout << "Hello World" << endl;
			
			const double PI = 3.1415926535; // const cannot be changed
			char myGrade = 'A'; // takes one byte
			bool isHappy = true; // comparable to 1
			int myAge = 39;
			float favNum = 3.1415;
			double otherfavNum = 1.6180339887
			
			cout << "Favorite Number" << favNum << endl;
			
			return 0;
		}
		
	1. Running

			g++ -std=c++11 ctut.cpp
			./a.out