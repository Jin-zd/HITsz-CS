#include <stdio.h>
#include <stdlib.h>
#define N 50

//���룺����
//���ܣ��������
//���������λ��
int ReadNumber(int* p)
{
    int t[N]= {0};
    char ch;
    int i=0,len=0;
    do
    {
        ch=getchar();
        t[i]=atoi(&ch);
        i++;
    }while(ch!='\n');//�������ÿһλ����
    len=i-2;//��¼����λ��
    for(i=i-2; i>=0; i--)//������������
    {
        p[len-i]=t[i];
    }
    return len;
}

//���룺�����洢���������鼰��λ�����洢������������
//���ܣ����д����ӷ�
//����������λ��
int Calculating(int* a,int* b,int* c,int x,int y)
{
    int m=(x>=y?x:y);//ȡ������λ�������ֵ
    int i,flag=0;
    for(i=0; i<=m+1; i++)
    {
        c[i]=c[i]+a[i]+b[i];
        if(c[i]>=10)//��λ
        {
            c[i]=c[i]-10;
            c[i+1]=c[i+1]+1;
        }
    }
    for(i=N; i>=0; i--)//������λ��
    {
        if(c[i]!=0)
        {
            flag=1;
            return i+1;
        }
    }
    if(flag==0)
    {
        return 1;
    }
}

int main(void)
{
    int n,x,y;
    int a[N]= {0};
    int b[N]= {0};
    int c[N+1]= {0};
    x=ReadNumber(a);
    y=ReadNumber(b);
    n=Calculating(a,b,c,x,y);
    for(int i=n-1; i>=0; i--)
    {
        printf("%d",c[i]);
    }
    printf("\n");
    return 0;
}
