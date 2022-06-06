#ifndef __sp__hh__
#define __sp__hh__
#include<vector>
#include<queue>
#include<iostream>
#include<random>
#include<stack>
using namespace std;
struct ret2{
    vector<double> dist;
    vector<int> prev;
    vector<int>path;
    ret2(vector<double>dist,vector<int>prev,vector<int>path):dist(dist),prev(prev),path(path){

    }
};
ret2 dj(vector<vector<double>>map,int from, int to);
#endif
