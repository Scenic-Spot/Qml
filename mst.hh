#ifndef __mst__hh__
#define __mst__hh__
#include<vector>
#include<queue>
#include<iostream>
#include<set>
using namespace std;
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
ret mst(vector<vector<double>> map);
#endif
