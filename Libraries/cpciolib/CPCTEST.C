/* 
This is cpctest.c  to show how to write programs for the
Amstrad CPC in Small-C
Best is to get the ZSIM CP/M emulator package from an ftp site.
It contains the Small-C Compiler (and is very fast).

compile (under CP/M):

   cc -M cpctest
   zmac cpctest=cpctest
   zlink cpctest=cpciolib,cpctest,printf1
   comam cpctest

comam copies cpctest.com to cpctest.bin by
appending an amsdos header.

*/

#include cpciolib.h
#include printf1.h

jgw_star()
{
 move(539,358);
 graph_pen(3);
 wr_graph('W');
 graph_pen(2);
 move(480,290);
 draw(545,399);
 draw(610,290);
 draw(480,370);
 draw(609,370);
 draw(480,290);
}

fib(n) int n;
{
 if (n<2)
    return(1);
 return(fib(n-1)+fib(n-2));
}

main()
{
 char s[80];
 int l,h;

 mode(1);
 jgw_star();
 printf("Helloh, world\n\nThis is a test");
 printf(" for the\nCPC small-c library\n");
 printf("\nby Juergen Weber\n");
 window(1,40,10,25);
 printf("let's cat");
 set_time(0,0);
 cat();
 get_time(&l,&h);
 printf("Time needed for catalog: high=%d, low=%d\n",h,l);
 printf("Press ENTER to continue");
 getchar();

 cls();
 printf("Hi, this is a number: %d\n",12345); 
 puts("enter string: ");
 gets(s);
 printf("\nstring entered: %s\n",s);
 printf("fib(6) is %d\n",fib(6));
}

