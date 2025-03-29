#include <stdlib.h>
#include <stdio.h>
#define MaxSize 40   // ��������

#define PUSH 0
#define POP 1
#define GET_TOP 2
#define STACK_EMPTY 3
#define EXIT -1
#define ENQUEUE 4
#define DEQUEUE 5
#define GET_HEAD 6
#define QUEUE_EMPTY 7
#define EXIT -1

typedef int DataType;
typedef struct
{
    DataType data[MaxSize];
    int top; // ջ��ָ��
} Stack;     // �ṹ��������

typedef struct
{
    Stack *stack_in;
    Stack *stack_out;
} Queue;


/**
 * ��ʼ��һ��ջ
 * @param S
 */
void InitStack(Stack *s)
{
    s->top = -1;
}

/**
 * ��ջ����һ��Ԫ��
 * @param S ����ջ
 * @param e ������
 * @return �ɹ�����1�����򷵻�0
 */
int Push(Stack *s, DataType e)
{
    //todo
    if (s->top == MaxSize - 1) {
        return 0;
    }
    s->top += 1;
    s->data[s->top] = e;
    return 1;
}

/**
 * ��ջ�е���һ��Ԫ��
 * @param S ����ջ
 * @param e ����ջ������ֵ
 * @return �ɹ�����1�����򷵻�0
 */
int Pop(Stack *S, DataType *e)
{
    //todo
    if (S->top < 0) {
        return 0;
    }
    *e = S->data[S->top];
    S->top -= 1;
    return 1;
}

/**
 * ��ȡջ��Ԫ�أ���ɾ����Ԫ��
 * @param S ����ջ
 * @param e ����ջ��Ԫ��
 * @return �ɹ�����1�����򷵻�0
 */
int GetTop(Stack S, DataType *e)
{
    //todo
    if (S.top < 0) {
        return 0;
    }
    *e = S.data[S.top];
    return 1;
}

/**
 * �ж�ջ�Ƿ�գ�Ϊ�շ���1�����򷵻�0
 * @param S
 * @return
 */
int StackEmpty(Stack S)
{
    //todo
    if (S.top == -1) {
        return 1;
    }
    return 0;
}

/**
 * ��ȡջ��һ�����鿽��
 * @param S ����ջ
 * @param seq ջ��Ԫ�ص�һ������
 */
void StackToArray(Stack S, DataType *seq)
{
    int i = 0;
    for (; i <= S.top; i++)
    {
        seq[i] = S.data[S.top-i];
    }
}

/**
 * ����ջ��ʹ�ó���
 * @param S ����ջ
 * @return ����ջ�ĳ���
 */
int StackLength(Stack S)
{
    return S.top + 1;
}

/**
 * ��ʼ������
 * @param Q ��������
 */
void InitQueue(Queue *Q)
{
    Q->stack_in = (Stack *)malloc(sizeof(Stack));
    Q->stack_out = (Stack *)malloc(sizeof(Stack));
    InitStack(Q->stack_in);
    InitStack(Q->stack_out);
}

/**
 * ��ȡ����ͷ����ɾ��Ԫ�أ�
 * @param Q ��������
 * @param e ���ܶ���ͷԪ��
 * @return ����ɹ���ȡ����1�����򷵻�0
 */
int GetHead(Queue Q, DataType *e)
{
    //todo
    if (StackEmpty(*Q.stack_in) && StackEmpty(*Q.stack_out)) {
        return 0;
    } else if(!StackEmpty(*Q.stack_out)) {
        *e = Q.stack_out->data[Q.stack_out->top];
        return 1;
    }
    *e = Q.stack_in->data[0];
    return 1;
}

/**
 * �ж϶����Ƿ�Ϊ��
 * @param Q ��������
 * @return ���Ϊ�շ���1�����򷵻�0
 */
int QueueEmpty(Queue Q)
{
    //todo
    if (StackLength(*Q.stack_in) == 0 && StackLength(*Q.stack_out) == 0) {
        return 1;
    }
    return 0;
}

/**
 * ��Ӳ�������Ԫ�ز�����У���Ҫ���������������������ͼ�����
 * @param Q ��������
 * @param e �����Ԫ��
 * @return �������ɹ�����1�����򷵻�0
 */
int EnQueue(Queue *Q, DataType e)
{
    //todo
    if (StackLength(*(Q->stack_in)) == MaxSize ) {
        return 0;
    }
    Push(Q->stack_in, e);
    return 1;
}

/**
 * ���Ӳ������Ӷ�����ȡ��һ��Ԫ��
 * @param Q ��������
 * @param e ���ܳ���Ԫ��
 * @return ����ɹ�ȡ������1�����򷵻�0
 */
int DeQueue(Queue *Q, DataType *e)
{
    //todo
    if (StackEmpty(*Q->stack_in) && StackEmpty(*Q->stack_out)) {
        return 0;
    } else if(!StackEmpty(*Q->stack_out)) {
        Pop(Q->stack_out, e);
        return 1;
    }
    while (!StackEmpty(*Q->stack_in)) {
        int item = 0;
        Pop(Q->stack_in, &item);
        Push(Q->stack_out, item);
    }
    Pop(Q->stack_out, e);
    return 1;
}

/**
 * ��ն��� ��������
 * @param Q
 */
void ClearQueue(Queue *Q)
{
    InitStack(Q->stack_in);
    InitStack(Q->stack_out);
}

/**
 *
 * @param Q ��������
 * @return ���ض�����ʹ�ó���
 */
int QueueLength(Queue Q)
{
    return StackLength(*Q.stack_in) + StackLength(*Q.stack_out);
}

/**
 * ��ȡ���е�һ�����鿽��
 * @param Q ��������
 * @param seq ջ��Ԫ�ص�һ������
 */
void QueueToArray(Queue Q, DataType *seq)
{
    //todo
    if (QueueEmpty(Q)) {
        return;
    }
    if(StackEmpty(*Q.stack_out)) {
        for (int i = 0; i < StackLength(*Q.stack_in); i++) {
            seq[i] = Q.stack_in->data[i];
        }
    } else if (StackEmpty(*Q.stack_in)){
        StackToArray(*Q.stack_out, seq);
    } else {
        StackToArray(*Q.stack_out, seq);
        int index = StackLength(*Q.stack_out) ;
        for (int i = index; i < QueueLength(Q); i++) {
            seq[i] = Q.stack_in->data[i - index];
        }
    }
}

void outputStack(Stack *S)
{
    int seq[MaxSize], i = 0;
    StackToArray(*S, seq);
    printf("Stack: ");
    for (i = 0; i < StackLength(*S); i++)
    {
        printf("%d", seq[i]);
        if(i<StackLength(*S)-1){
            printf(" ");
        }
    }
    printf("\n");
}


void outputQueue(Queue *Q)
{
    int seq[MaxSize], i = 0;
    QueueToArray(*Q, seq);
    printf("Queue: ");
    for (i = 0; i < QueueLength(*Q); i++)
    {
        printf("%d", seq[i]);
        if(i<QueueLength(*Q)-1){
            printf(" ");
        }
    }
    printf("\n");
}

int main(int argc, char **argv)
{
    Queue *Q = (Queue *)malloc(sizeof(Queue));
    InitQueue(Q);
    Stack *S = (Stack *)malloc(sizeof(Stack));
    InitStack(S);

    int mode, num, e, status;
    while (scanf("%d", &mode))
    {
        if (mode == EXIT)
        {
            break;
        }
        switch (mode)
        {
            case ENQUEUE:
                num = 0;
                scanf("%d", &num);
                while (num > 0)
                {
                    num--;
                    scanf("%d", &e);
                    status = EnQueue(Q, e);
                }
                outputQueue(Q);
                break;
            case DEQUEUE:
                num = 0;
                scanf("%d", &num);
                while (num > 0)
                {
                    num--;
                    status = DeQueue(Q, &e);
                    if(status)
                    {
                        printf("DeQueue: %d\n", e);
                        outputQueue(Q);
                    }
                    else
                    {
                        printf("DeQueue failed\n");
                    }
                }
                break;
            case GET_HEAD:
                status = GetHead(*Q, &e);
                if(status)
                {
                    printf("GetHead: %d\n", e);
                    outputQueue(Q);
                }
                else
                {
                    printf("GetHead failed\n");
                }
                break;
            case QUEUE_EMPTY:
                status = QueueEmpty(*Q);
                if(status)
                {
                    printf("The Queue is Empty\n");
                }
                else
                {
                    printf("The Queue is not Empty\n");
                    outputQueue(Q);
                }
                break;
            default:
                break;
        }
    }
    free(Q);
    free(S);
    return 0;
}