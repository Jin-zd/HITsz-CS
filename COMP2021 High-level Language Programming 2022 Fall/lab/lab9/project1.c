#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void)
{
    float a,b,c,p,s;
    const float E=1e-2;//���ڽ��и������е�
    int f=1;//��־��������Ϊ0ʱ��������һ��������

    scanf("%f %f %f",&a,&b,&c);

    if(a+b>c&&b+c>a&&a+c>b)
    {
        if(fabs(a-b)<=E&&fabs(a-c)<=E&&fabs(a-c)<=E)
        {
            printf("�ȱ�");
            f=0;
        }
        else
        {
            if(fabs(a-b)<=E||fabs(a-c)<=E||fabs(b-c)<=E)
            {
                printf("����");
                f=0;
            }
            if(fabs(a*a+b*b-c*c)<=E||fabs(a*a+c*c-b*b)<=E||fabs(b*b+c*c-a*a)<=E)
            {
                printf("ֱ��");
                f=0;
            }
        }
        if(f)
        {
            printf("һ��");
        }
        p=(a+b+c)/2;
        s=sqrt(p*(p-a)*(p-b)*(p-c));
        printf("������\nS=%.2f\n",s);

    }
    else
    {
        printf("����������\n");
    }
    return 0;
}
