#include <stdio.h>
#include <stdlib.h>

int main()
{
     int year,month,day,p,i,sum;
     int a[12]={31,29,31,30,31,30,31,31,30,31,30,31};
     int b[12]={31,28,31,30,31,30,31,31,30,31,30,31};//������ֱ𴢴������ƽ��ÿ�µ�����

     printf("���������ڣ��꣬�£��գ�");
     scanf("%d,%d,%d",&year,&month,&day);

     p=(year%4==0&&year%100!=0)||(year%400==0);
     if(p)
     {
         for(i=0;i<month-1;i++)
         {
             sum=sum+a[i];//�ۼӼ��������·�ǰ��������
         }
         sum=sum+day;//���ϵ�������
     }
     else
     {
         for(i=0;i<month-1;i++)
         {
             sum=sum+b[i];
         }
         sum=sum+day;
     }
     printf("%d��%d����%d��ĵ�%d��",month,day,year,sum);
     return 0;
}
