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

 void fibonacci()
{
int n,first=0  ,second=1  ,next  ,c    ;

 writeString("Enter the number of terms\n");

 
n=readInteger();
 for(c=0;c < n;c=c+1)
{
if (c <= 1) 

next=c;
 else {
next=first+second;
first=second;
second=next;
}
writeInteger(next);
} 
}
 int Fibonacci(int n)
{
if (n == 0) 
return 0;

 else if (n == 1) 
return 1;

 else return (Fibonacci(n - 1)+Fibonacci(n - 2));

}

 int main()
{writeString("\n Fibonacci non-Recursively");

 fibonacci();

 writeString("Enter a number to compute (Fibonacci Recursively)\n");

 int n,result    ;

 
n=readInteger();
 
result=Fibonacci(n);
 writeInteger(result);

 return 0;


}