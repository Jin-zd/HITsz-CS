#include <stdio.h>
#include <stdlib.h>

/*���룺һ������*/
/*���ܣ��жϸ����Ƿ�Ϊ����*/
/*��������������ظ��������򷵻�0*/
int IsPrime(int n)
{
    int i,find;
    find=1;
    if(n<=0)//�ж������Ƿ�Ϸ�
    {
        printf("Error!\n");
        exit(0);
    }
    if(n==1)
    {
        find=0;
    }
    else
    {
        for(i=2;i<n;i++)
        {
            if(n%i==0)
            {
                find=0;
            }
        }
    }

    if(find)
    {
        return n;
    }
    else
    {
        return 0;
    }
}

int main()
{
    int M,N,n,ret,sum,i,j;
    int num[1000]={0};
    sum=0;
    scanf("%d",&M);

    for(i=1;i<=M;i++)
    {
         scanf("%d",&N);
         for(j=1;j<=N;j++)
         {
             scanf("%d",&n);
             ret=IsPrime(n);
             sum=sum+ret;
         }
         num[i-1]=sum;//ʹ�����鴢�����������sumΪ0�������һ���ۼ�
         sum=0;
    }
    for(i=0;i<M;i++)
    {
        printf("%d\n",num[i]);
    }
    return 0;
}
