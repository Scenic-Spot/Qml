#include"mst.hh"
struct DisjointSet {
    vector<int> parent;
    vector<int> size;
    DisjointSet(int maxSize) {
        parent.resize(maxSize);
        size.resize(maxSize);
        for (int i = 0; i < maxSize; i++) {
            parent[i] = i;
            size[i] = 1;
        }
    }

    int find_set(int v) {
        if (v == parent[v])
            return v;
        return parent[v] = find_set(parent[v]);
    }

    void union_set(int a, int b) {
        a = find_set(a);
        b = find_set(b);
        if (a != b) {
            if (size[a] < size[b])
                swap(a, b);
            parent[b] = a;
            size[a] += size[b];
        }
    }
};
struct edge{
    int a,b;
    double weight;
    edge(int a,int b ,double weight):
    a(a),b(b),weight(weight){}
};
struct ret{
    vector<edge> e;
    bool all;
};
//int32max代表不可达
ret mst(vector<vector<double>> map){
    auto cmp = [](const edge& a,const edge& b ){ return a.weight > b.weight;};
    priority_queue<edge,vector<edge>,decltype(cmp)>q(cmp);
    for(int i =0;i<map.size();++i){
        for(int j =0;j<map.size();++j){
            if(i!=j){
                q.push(edge{i,j,map[i][j]});
            }
            else{
                continue;
            }
        }
    }
    DisjointSet ds(map.size());
    int maxedgenum = map.size()-1;
    int curedgenum = 0;
    vector<edge> retval;
    while(curedgenum!=maxedgenum && !q.empty()){
        edge e = q.top();
        q.pop();
        if(ds.find_set(e.a)!=ds.find_set(e.b)){
            ds.union_set(e.a,e.b);
            ++curedgenum;
            retval.push_back(e);
        }
    }
    ret r ;
    r.e=retval;
    if(curedgenum==maxedgenum){
        r.all=true;
    }
    else{
        r.all=false;
    }
    for(edge i : retval){
        cout<<i.a<<" :"<<i.b<<endl;
    }
    return r;
}
int main(int argc, char const *argv[])
{
    vector<vector<double>>map(7,vector<double>(7,INT32_MAX));
    for(int i =0;i<12;++i){
        int a,b;
        double dist;
        cin>>a>>b>>dist;
        map[a][b]=dist;
        map[b][a]=dist;
    }
    mst(map);
    return 0;
}
