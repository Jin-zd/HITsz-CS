#include <stdio.h>
#include <stdlib.h>

//���룺�����±�k
//�������ܣ��ݹ鷨����Pell���е�k��
//�����Pell���е�k��
int Pell(int k)
{
    if(k==1)
    {
        return 1;
    }
    else if(k==2)
    {
        return 2;
    }
    else
    {
        return Pell(k-1)*2+Pell(k-2);
    }
}

int main(void)
{
    int n,k,i;
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        scanf("%d",&k);
        printf("%d\n",Pell(k)%32767);
    }
    return 0;
}
