#include"sp.hh"
//map[i][j]!=0 means that  i is adjacent to j
//ret 包装了从from到任何点的最短距离，int32max代表不可达.
ret2 dj(vector<vector<double>>map,int from, int to){
    vector<int>retval;
    stack<int> tmp;
    vector<int>prev(map.size(),from);
    vector<double>dist(map.size(),INT32_MAX);
    vector<bool>visited(map.size(),false);
    int vc = 0;
    auto cmp = [](const pair<int,double>&a,const pair<int,double>&b){return a.second>b.second;};
    priority_queue<pair<int,double>,vector<pair<int,double>>,decltype(cmp)>q(cmp);
    //first step
    visited[from]=true;
    dist[from]=0;
    for(int i = 0;i<map.size();++i){
        if(map[from][i]!=0){
            prev[i]=from;
            dist[i]=map[from][i];
            q.push({i,dist[i]});
        }
    }
    vc=1;
    while(!q.empty()){
        auto p = q.top();
        q.pop();
        if(visited[p.first])
        continue;
        visited[p.first]=true;
        ++vc;
        for(int i =0;i<map.size();++i){
            if(map[p.first][i]){
                if(p.second+map[p.first][i]<dist[i]){
                    prev[i]=p.first;
                    dist[i]=p.second+map[p.first][i];
                    q.push({i,dist[i]});
                }
            }
        }
    }
    cout<<dist[to]<<" ";
    int now = to;
    while(now!=from){
        tmp.push(now);
        now = prev[now];
    }
    tmp.push(from);
    while(!tmp.empty()){
        retval.push_back(tmp.top());
        tmp.pop();
    }
    for(auto i : retval){
        cout<<i<<" ";
    }
    ret2 r{dist,prev,prev};
    return r; 
}
