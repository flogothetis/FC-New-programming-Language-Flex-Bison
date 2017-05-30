/*Flogothetis Programms*/ 
 #include <stdio.h>
#include <stdlib.h>
#include<string.h>
void writeString(char *str) { printf( " \n%s " ,str); }
 void readString(char* x){ gets(x);}
 int readInteger(){int x; scanf("%d",&x);return x;}
 float readReal(){float x;scanf("%f",&x);return x;} 
 void writeInteger(int i){printf(" \n%d  ",i);}
 void writeReal(float r){printf("\n%f",r);} 


int main()
{writeString("Hello World!\n");

 return 0;


}