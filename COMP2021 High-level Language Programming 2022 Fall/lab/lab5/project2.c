#include <stdio.h>
//���룺���鼰�䴢�����ݸ���
//���ܣ�����ƽ����
//������������ݵ�ƽ����
int Mean(int a[],int n)
{
    int i,sum=0;
    for(i=0;i<n;i++)
    {
        sum=sum+a[i];
    }
    return sum/n;
}

//���룺���鼰�䴢�����ݸ���
//���ܣ�������λ��
//������������ݵ���λ��
int Median(int a[],int n)
{
    int i,j,t;
    for(i=0;i<n;i++)//����������
    {
        for(j=i+1;j<n-1;j++)
        {
            if(a[j]>a[i])
            {
                t=a[i];
                a[i]=a[j];
                a[j]=t;
            }
        }
    }
    if(n%2==0)//ż����ȡ�м�����ȡƽ��ֵ
    {
        return ((a[n/2-1]+a[n/2])/2);
    }
    else//��������ȡ�м����
    {
        return a[(n)/2];
    }
}

//���룺���鼰�䴢�����ݸ���
//���ܣ���������
//������������ݵ�����
int Mode(int a[],int n)
{
    int b[11];//�洢ÿ�������ֵĴ���
    int i,j,max,f;
    for(i=0;i<11;i++)
    {
        b[i]=0;
    }
    for(i=0;i<n;i++)
    {
        for(j=0;j<=10;j++)
        {
            if(a[i]==j)
            {
                b[j]++;
            }
        }
    }
    max=b[0];//�ж������е����ֵ
    for(i=0;i<=10;i++)
    {
        if(b[i]>max)
        {
            max=b[i];
            f=i;
        }
    }
    return f;
}

int main()
{
    int n,i;
    scanf("%d",&n);
    int a[n];
    for(i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }
    printf("Mean=%d\n",Mean(a,n));
    printf("Median=%d\n",Median(a,n));
    printf("Mode=%d\n",Mode(a,n));
    return 0;
}
