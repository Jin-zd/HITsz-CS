#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <stdbool.h>

struct TreeNode *findNode(struct TreeNode *root, int num);//�ҵ���Ӧ������Ľ��
void findPath(struct TreeNode *root, struct TreeNode *p, struct TreeNode *q);//��ӡ·��
bool judge(struct TreeNode *root, int start, int end);//�ж�������Ƿ�ɴ�
struct TreeNode *createTreeNode(int val, struct TreeNode *left, struct TreeNode *right);//�������Ľڵ�
struct TreeNode *createTreeWithLevelOrder(int *data, int size);//���ղ�����д���������

typedef struct TreeNode {
    int id;
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode, *TreeNodePtr;

typedef struct ListNode {
    struct TreeNode *node; // ���е�ֵ�����������ڵ�ָ��
    struct ListNode *next;
} ListNode, *ListNodePtr;

typedef struct Queue {
    ListNodePtr dummyHead;
    ListNodePtr tail;
    int size;
} *QueuePtr;

// ��������Ľڵ�
ListNodePtr createListNode(TreeNodePtr node, ListNodePtr next) {
    ListNodePtr curr = (ListNodePtr) (malloc(sizeof(ListNode)));
    curr->node = node;
    curr->next = next;
    return curr;
}

// �������Ľڵ�
int TreeId = 0;

TreeNodePtr createTreeNode(int val, TreeNodePtr left, TreeNodePtr right) {
    TreeNodePtr curr = (TreeNodePtr) (malloc(sizeof(TreeNode)));
    curr->id = TreeId++;
    curr->val = val;
    curr->left = left;
    curr->right = right;
    return curr;
}

// ��������г�ʼ��
QueuePtr InitQueue() {
    QueuePtr queue = (QueuePtr) malloc(sizeof(struct Queue));
    TreeNodePtr dummyTreeNode = createTreeNode(-1, NULL, NULL);
    queue->size = 0;
    queue->dummyHead = createListNode(dummyTreeNode, NULL);
    queue->tail = queue->dummyHead;
    return queue;

}

// �� queue ��β�����һ��Ԫ�صĸ���
void EnQueue(QueuePtr queue, TreeNodePtr node) {
    ListNodePtr curr = createListNode(node, NULL);
    queue->tail->next = curr;
    queue->tail = queue->tail->next;
    queue->size++;
}

// ɾ�� queue �еĵ�һ��Ԫ��
void DeQueue(QueuePtr queue) {
    if (queue->size == 0) {
        perror("error! the size of queue is zero when call DeQueue().");
        return;
    }
    ListNodePtr head = queue->dummyHead->next;
    queue->dummyHead->next = head->next;
    queue->size--;
    if (queue->size == 0)
        queue->tail = queue->dummyHead;
    free(head);
}

// ��� queue ��û��Ԫ��, ���� true
bool QueueEmpty(QueuePtr queue) {
    return queue->size == 0;
}

// ���� queue �е�һ��Ԫ�ص�����
TreeNodePtr GetHead(QueuePtr queue) {
    if (QueueEmpty(queue)) {
        perror("error! the size of queue is zero when call front().");
        return NULL;
    } else {
        return queue->dummyHead->next->node;
    }
}

int max(int a, int b) {
    return (a >= b) ? a : b;
}


// ������ת��Ϊ����
void getDigits(char *buff, int *data) {
    int len = strlen(buff);
    int index = 0;
    for (int i = 0; i < len; i++) {
        int num = 0;
        if (buff[i] == '#') {
            num = -1;
            i++;
        } else {
            while (buff[i] != ' ' && buff[i] != '\0') {
                num = num * 10 + (buff[i++] - '0');
            }
        }
        data[index++] = num;
    }
}


//���ܣ��ҵ���Ӧ������Ľ��
//���Σ�rootΪ��������������ַ��numΪ��Ҫ���ҵĽ��valֵ
//����ֵ������ֵΪ�ҵ��Ľ��ĵ�ַ
struct TreeNode *findNode(struct TreeNode *root, int num) {
    TreeNode *node = NULL;
    if (root == NULL) {
        node = NULL;
    } else if (root->val == num) {
        node = root;
    } else if (root->left != NULL) {
        node = findNode(root->left, num);
        if (node == NULL && root->right != NULL) {
            node = findNode(root->right, num);
        }
    }
    return node;
}


//���ܣ���ӡ·��
//���Σ�rootΪ��������������ַ��pΪ��ʼ���ĵ�ַ��qΪ�������ĵ�ַ����Ҫ��ӡp��q��·����·������p��q�����˵�
//����ֵ���޷���ֵ���ú�������ɴ�ӡ·���Ĺ���
void findPath(struct TreeNode *root, struct TreeNode *p, struct TreeNode *q) {
    if (p == q) {
        printf("%d", p->val);
        return;
    }
    if (p->left == q || p -> right == q) {
        printf("%d->%d", p->val, q->val);
    } else if (judge(root, p->left->val, q->val)) {
        printf("%d->", p->val);
        findPath(root, p->left, q);
    } else {
        printf("%d->", p->val);
        findPath(root, p->right, q);
    }
}


//���ܣ��ж�������Ƿ�ɴ�
//���Σ�rootΪ��������������ַ��startΪ��ʼ����val��endΪ��������val
//����ֵ������ֵΪ�������ͣ�����true���ʾ�ɴ����false��ʾ���ɴ���ɴ������������ú���ӡToo Far!!!���ɴ����ӡ������·��
bool judge(struct TreeNode *root, int start, int end) {
    bool flag = false;
    TreeNode* goNode = findNode(root, start);
    TreeNode* endNode = findNode(root, end);
    if (goNode != endNode && goNode->left == NULL) {
        flag = false;
    }else if (goNode == endNode) {
        flag = true;
    }else {
        flag = judge(root, goNode->left->val, end);
        if (!flag) {
            flag = judge(root, goNode->right->val, end);
        }
    }
    return flag;
}


//���ܣ����ղ�����д���������
//���Σ�dataΪ����Ĳ�����о������������飬-1����ս�㣬sizeΪdata����ĳ���
//����ֵ������ֵΪ���������Ķ������ĸ����ĵ�ֵַ
//ע��������ֱ������ǰ�����������д����������ĺ������ɣ�����ǰ����ı���ú������ص������
TreeNodePtr createTreeWithLevelOrder(int *data, int size) {
    QueuePtr qPtr = InitQueue();
    TreeNodePtr root = NULL;
    int i = 0;

    if (data[i] == -1) {
        return root;
    }
    root = createTreeNode(data[i], NULL, NULL);
    EnQueue(qPtr, root);

    while (!QueueEmpty(qPtr) && i < size) {
        TreeNodePtr T = GetHead(qPtr);
        DeQueue(qPtr);

        i++;
        int leftData;
        if (i >= size) {
            leftData = -1;
        } else {
            leftData = data[i];
        }
        T->left = createTreeNode(leftData, NULL, NULL);
        EnQueue(qPtr, T->left);
        i++;
        int rightData;
        if (i >= size) {
            rightData = -1;
        } else {
            rightData = data[i];
        }
        T->right = createTreeNode(rightData, NULL, NULL);
        EnQueue(qPtr, T->right);

    }
    return root;
}

int main(void) {
    int i, j, num, SIZE = 128;
    char buff[SIZE];
    scanf("%d\n", &num);
    fgets(buff, SIZE, stdin);
    char *pos = strchr(buff, '\n');          //���һ��з�
    if (pos)                            //���find��Ϊ��ָ��
        *pos = '\0';                    //�Ͱ�һ�����ַ���������

    // Mac/Linux �滻\r
    pos = strchr(buff, '\r');
    if (pos)
        *pos = '\0';
    int *data = (int *) malloc(num * sizeof(int));
    getDigits(buff, data);
    struct TreeNode *root = createTreeWithLevelOrder(data, num), *start, *end;

    //����Ϊ������д���������

    //����Ϊ������·��������������

    scanf("%d %d", &i, &j);
    if (!judge(root, i, j))
        printf("Too Far!!!");
    else {
        start = findNode(root, i);
        end = findNode(root, j);
        findPath(root, start, end);
    }
    return 0;
}