#include<bits/stdc++.h>
using namespace std;
const int N=1010;

int gra[N][N];
int dist[N];
int g[N];
bool st[N];
int n,m;

int dijkstra()
{
	 memset(dist, 0x3f, sizeof dist);
    dist[1] = 0;

    for (int i = 0; i < n - 1; i ++ )
    {
        int t = -1;
        for (int j = 1; j <= n; j ++ )
            if (!st[j] && (t == -1 || dist[t] > dist[j]))
                t = j;
        for (int j = 1; j <= n; j ++ )
            dist[j] = min(dist[j], dist[t] + gra[t][j]);
        st[t] = true;
    }
	return dist[n];
}
int main() 
{
	cin>>n>>m;
	for(int i=1;i<=n;++i) cin>>g[i];
	g[n]=0;
	memset(gra, 0x3f, sizeof gra);
	for(int i=1;i<=m;++i){
		int u,v,c;
		cin>>u>>v>>c;
		gra[u][v]=g[v]+c;
		gra[v][u]=g[u]+c;
	}
	cout<<dijkstra()<<endl;
    return 0;
}