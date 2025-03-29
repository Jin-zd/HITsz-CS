#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/* ���²������ṩ��ѧ���� */
typedef struct node{
    char StuID[11];
    int Grade;
    struct node *next;
}StudentLinkedListNode;

/* ���������б� */
void createCrossLink(StudentLinkedListNode* a, StudentLinkedListNode* b, int beforeCross1, int beforeCross2){
    // a��b�������ɽ��ֵ��ͬ
    // beforeCross1Ϊ������a�еĸ������ӵ�beforeCross1 + 1����㿪ʼ�ཻ
    // beforeCross2Ϊ������b�еĸ������ӵ�beforeCross2 + 1����㿪ʼ�ཻ
    // �ཻ�����ǽ�b�е�ǰһ���ָ��a�е��׸��ཻ���
    StudentLinkedListNode *p, *q;
    while(beforeCross1--)a=a->next;
    while(--beforeCross2)b=b->next;
    p = b->next;
    b->next = a;
    //����Ұָ����
    while(p){
        q = p->next;
        free(p);
        p = q;
    }
}

/* ������������ٽ����б� */
void destroyCrossLink(StudentLinkedListNode* a, StudentLinkedListNode* b, StudentLinkedListNode* crossNode){
    StudentLinkedListNode* p = crossNode->next, *q;
    while(p){
        q = p->next;
        free(p);
        p = q;
    }
    while(a != crossNode){
        q = a->next;
        free(a);
        a = q;
    }
    while(b != crossNode){
        q = b->next;
        free(b);
        b = q;
    }
    free(crossNode);
}

/* ��ӡ������� */
void printLinkedListNode(StudentLinkedListNode * node){
    printf("{ID:%s, Grade:%d}", node->StuID, node->Grade);
    if(node->next!=NULL){
        printf("->");
    }else{
        printf("\n");
    }
}

/** ���²�������Ҫѧ���Լ�ʵ�ֵ� **/
/** ��ӡ�����б� **/
void outputStudentLinkedList(StudentLinkedListNode* head){
    // ���ڵ����ڵ�����ĺ���printLinkedListNode���ṩ
    // ����ʵ�ֱ���������߼�
	// TODO
}

/** �½�һ������node������ **/
StudentLinkedListNode* createStudentLinkedList(char student_id[], int grade) {
    //tips:malloc��ʱ��ǵ�Ϊת��Ϊ�ṹ��ָ��
	//TODO
}

/** ���ս������ѧ���ĳɼ����,����������ͷָ�� **/
StudentLinkedListNode* addStudentLinkedList(StudentLinkedListNode* head, StudentLinkedListNode* node) {
    //TODO
}

/** ��ת���� **/
StudentLinkedListNode* reverseStudentLinkedList(StudentLinkedListNode*head)
{
    //TODO
}

/** �ҵ��ཻ�ĵ�һ����� **/
StudentLinkedListNode* findCrossBeginNode(StudentLinkedListNode* class1, StudentLinkedListNode* class2) {
    // class1��class2�ں�һ������ȫ�غϣ������ڴ��ַ��ͬ�������ҳ������ؿ�ʼ�ཻ�ĵ�һ����㡣
    // �벻Ҫ�򵥵�ͨ�����ṹ��ĳ�Ա���жϡ�
    // TODO
}

int main()
{
    StudentLinkedListNode *class1=NULL, *class2=NULL;
    int num1, num2, i;
    char student_id[11];
    int grade;
    int beforeCross1, beforeCross2;
    StudentLinkedListNode *node;

    // ��ȡ�����༶������
    scanf("%d%d", &num1, &num2);
    class1 = class2 = NULL;
    // ��ȡ�༶1�ĳɼ�
    for(i = 0;i < num1;i++){
        scanf("%s%d", student_id, &grade);
        node = createStudentLinkedList(student_id, grade);
        class1 = addStudentLinkedList(class1, node);
    }
    // ��ȡ�༶2�ĳɼ�
    for(i = 0;i < num2;i++){
        scanf("%s%d", student_id, &grade);
        node = createStudentLinkedList(student_id, grade);
        class2 = addStudentLinkedList(class2, node);
    }
    // ��ȡ������֮ǰ�Ľ�����
    scanf("%d%d",&beforeCross1,&beforeCross2);

    // ���1���洢�б���
    printf("Store Linkedlist\n");
    outputStudentLinkedList(class1);
    outputStudentLinkedList(class2);

    // ִ�з�ת�������
    class1 = reverseStudentLinkedList(class1);
    class2 = reverseStudentLinkedList(class2);

    // ���2����ת�б���
    printf("Reverse Linkedlist\n");
    outputStudentLinkedList(class1);
    outputStudentLinkedList(class2);

    // �������������ҵ���һ������
    createCrossLink(class1, class2, beforeCross1, beforeCross2);
    node = findCrossBeginNode(class1, class2);

    // ���3��������
    printf("Cross node\n");
    printf("{ID:%s, Grade:%d}\n", node->StuID, node->Grade);

    // ���ٽ�������
    destroyCrossLink(class1, class2, node);

    return 0;
}
