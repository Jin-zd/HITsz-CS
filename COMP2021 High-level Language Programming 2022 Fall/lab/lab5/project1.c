#include <stdio.h>
#include <stdlib.h>

//���룺���鼰�䴢�����ݸ���
//���ܣ�ɾ���������ظ���Ԫ��
//����������������ʣ�����ݸ���
int CutArray(int a[],int n)
{
    int i,j,k,cnt;
    cnt=0;
    for(i=0;i<n;i++)
    {
        for(j=i+1;j<n;j++)
        {
            if(a[i]==a[j])
            {
                for(k=j;k<n+1;k++)//����ɾ���������������ǰ�ƶ�һλ
                {
                    a[k]=a[k+1];
                }
                cnt++;//��¼��������
            }
        }
    }
    return n-cnt;

}

//���룺���鼰�䴢�����ݸ���
//���ܣ�������Ԫ�ؽ�������
//�������
void Sorting(int a[],int m)
{
    int i,j,t;
    for(i=0;i<m;i++)
    {
        for(j=i+1;j<m;j++)
        {
            if(a[i]>a[j])
            {
                t=a[i];
                a[i]=a[j];
                a[j]=t;
            }
        }
    }
}

int main()
{
    int n,m,i;
    scanf("%d",&n);
    int a[n];
    for(i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }
    m=CutArray(a,n);
    printf("%d\n",m);
    Sorting(a,m);
    for(i=0;i<m;i++)
    {
        printf("%d ",a[i]);
    }
    return 0;
}
