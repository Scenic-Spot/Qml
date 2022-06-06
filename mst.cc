#include"mst.hh"
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
