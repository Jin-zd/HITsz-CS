//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>
//
//# define max_dis 100000
//
//typedef char vextype[20];
//
//typedef struct {
//    int N, E;//N�Ƕ�������E�Ǳ���
//    int **matrix;//�����ڽӾ���
//    vextype *vertex;//�洢�ڵ������
//} Graph;
//
//Graph createGraph(int n);
//
//void nodeDegree(Graph g, int *node_degree);
//
//double clusteringCoefficient(Graph g);
//
//
///**
// * ����һ���ڵ���Ϊn��ͼ
// * @param n �ڵ����
// * @return �������ͼ
// */
//Graph createGraph(int n) {
//    int i, j;
//    Graph g;
//    g.N = n;
//    g.matrix = (int **) malloc(sizeof(int *) * g.N);
//    for (i = 0; i < n; i++) {
//        g.matrix[i] = (int *) malloc(sizeof(int) * g.N);
//    }
//    for (i = 0; i < g.N; i++) {
//        for (j = 0; j < g.N; j++) {
//            g.matrix[i][j] = max_dis;
//        }
//    }
//    for (i = 0; i < g.N; i++) {
//        g.matrix[i][i] = 0;
//    }
//    g.vertex = (vextype *) malloc(sizeof(vextype) * g.N);
//    return g;
//}
//
//
///**
// * ����ÿ����Ķ�
// * @param g ͼ
// * @param node_degree ��ÿ����Ķ�д�����������
// */
//void nodeDegree(Graph g, int *node_degree) {
//    for (int i = 0; i < g.N; i++) {
//        node_degree[i] = 0;
//    }
//    for (int i = 0; i < g.N; i++) {
//        for (int j = 0; j < g.N; j++) {
//            if (g.matrix[i][j] == max_dis) {
//                continue;
//            } else if (g.matrix[i][j] != 0){
//                node_degree[i] += 1;
//            }
//        }
//    }
//}
//
///**
// * ����ͼ�ľ���ϵ��
// * @param g ͼ
// * @return ���ؾ���ϵ��
// */
//double clusteringCoefficient(Graph g) {
//    int node_degree[g.N];
//    nodeDegree(g, node_degree);
//    double clCof[g.N];
//    for (int i = 0; i < g.N; i++) {
//        int v[g.N];
//        for (int j = 0; j < g.N; j++) {
//            v[j] = max_dis;
//        }
//        for (int j = 0; j < g.N; j++) {
//            if (g.matrix[i][j] != 0 && g.matrix[i][j] != max_dis) {
//                v[j] = j;
//            }
//        }
//        int friends = 0;
//        for (int j = 0; j < g.N; j++) {
//            if (v[j] != max_dis) {
//                for (int k = j + 1; k < g.N; k++) {
//                    if (v[k] != max_dis && g.matrix[k][j] != max_dis) {
//                        friends += 1;
//                    }
//                }
//            }
//        }
//        int degree = node_degree[i];
//        if (degree == 1 || degree == 0) {
//            clCof[i] = 0;
//        } else {
//            clCof[i] = friends / (degree * (degree - 1) / 2.0);
//        }
//    }
//    double sum = 0;
//    for (int i = 0; i < g.N; i++) {
//        sum += clCof[i];
//    }
//    return sum / g.N;
//}
//
//
//int main() {
//    int node_num;
//    int edge_num;
//
//    scanf("%d %d", &node_num, &edge_num);
//
//    Graph g = createGraph(node_num);
//    for (int i = 0; i < node_num; i++) {
//        sprintf(g.vertex[i], "%d", i);
//    }
//
//    for (int i = 0; i < edge_num; i++) {
//        int start_idx, end_idx, weight;
//        scanf("%d %d %d", &start_idx, &end_idx, &weight);
//        g.matrix[start_idx][end_idx] = weight;
//        g.matrix[end_idx][start_idx] = weight;
//    }
//
//    int *degree = (int *) malloc(sizeof(int) * g.N);
//    nodeDegree(g, degree);
//    printf("degree distribution:\n");
//    for (int i = 0; i < g.N; i++) {
//        printf("node%s:%d,", g.vertex[i], degree[i]);
//    }
//    printf("\n");
//    double c = clusteringCoefficient(g);
//    printf("clustering coefficient:%f\n", c);
//
//    return 0;
//}