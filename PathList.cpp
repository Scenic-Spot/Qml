#include "PathList.h"
#include "Path.h"

PathList::PathList(QObject *parent)
    : QObject(parent)
{
    isRunning = false;
    isVisible = false;
    QString name[maxSize] = {
        "嘉瑞新艺术仓库","罐子书屋","旻古艺术","新时代画廊","3818库","世纪翰墨","圣东方","千年时间",
        "八大画廊","星空间","协民国际","北京空间","龚伟艺术空间","麦杰艺术","灿艺术","亚洲艺术中心","物波空间","卓越艺术","山艺术"
    };
    Position position[maxSize] = {
        {14,233},{14,357},{14,401},{14,452},{214,72},{214,111},{214,150},{214,191},{214,81},{214,116},
        {214,147},{214,189},{372,45},{372,242},{372,231},{372,312},{372,405},{372,465},{626,384}
    };
    for(int i=0;i<maxSize;i++){
        graph.vertex[i]={name[i],position[i]};
    }
    for(int i=0;i<maxSize;i++){
        for(int j=0;j<maxSize;j++){
            graph.edge[i][j].distance=inf;
        }
    }
    //嘉瑞新艺术仓库
    graph.edge[0][1].distance = graph.edge[1][0].distance = 124;
    graph.edge[0][4].distance = graph.edge[4][0].distance = 487;
    graph.edge[0][4].tmp.enqueue(Vertex{"None",Position{14,9}});
    graph.edge[0][4].tmp.enqueue(Vertex{"None",Position{214,9}});
    graph.edge[4][0].tmp.enqueue(Vertex{"None",Position{214,9}});
    graph.edge[4][0].tmp.enqueue(Vertex{"None",Position{14,9}});
    graph.edge[0][12].distance = graph.edge[12][0].distance = 618;
    graph.edge[0][12].tmp.enqueue(Vertex{"None",Position{14,9}});
    graph.edge[0][12].tmp.enqueue(Vertex{"None",Position{372,9}});
    graph.edge[12][0].tmp.enqueue(Vertex{"None",Position{372,9}});
    graph.edge[12][0].tmp.enqueue(Vertex{"None",Position{14,9}});
    graph.edge[0][13].distance = graph.edge[13][0].distance = 435;
    graph.edge[0][13].tmp.enqueue(Vertex{"None",Position{14,276}});
    graph.edge[0][13].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[13][0].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[13][0].tmp.enqueue(Vertex{"None",Position{14,276}});
    graph.edge[0][15].distance = graph.edge[15][0].distance = 437;
    graph.edge[0][15].tmp.enqueue(Vertex{"None",Position{14,276}});
    graph.edge[0][15].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[15][0].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[15][0].tmp.enqueue(Vertex{"None",Position{14,276}});

    //罐子书屋
    graph.edge[1][2].distance = graph.edge[2][1].distance = 44;
    graph.edge[1][13].distance = graph.edge[13][1].distance = 473;
    graph.edge[1][13].tmp.enqueue(Vertex{"None",Position{14,276}});
    graph.edge[1][13].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[13][1].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[13][1].tmp.enqueue(Vertex{"None",Position{14,276}});
    graph.edge[1][15].distance = graph.edge[15][1].distance = 472;
    graph.edge[1][15].tmp.enqueue(Vertex{"None",Position{14,276}});
    graph.edge[1][15].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[15][1].tmp.enqueue(Vertex{"None",Position{372,276}});
    graph.edge[15][1].tmp.enqueue(Vertex{"None",Position{14,276}});

    //旻古艺术
    graph.edge[2][3].distance = graph.edge[3][2].distance = 51;

    //新时代画廊
    graph.edge[3][17].distance = graph.edge[17][3].distance = 473;
    graph.edge[3][17].tmp.enqueue(Vertex{"None",Position{14,516}});
    graph.edge[3][17].tmp.enqueue(Vertex{"None",Position{372,516}});
    graph.edge[17][3].tmp.enqueue(Vertex{"None",Position{372,516}});
    graph.edge[17][3].tmp.enqueue(Vertex{"None",Position{14,516}});
    graph.edge[3][18].distance = graph.edge[18][3].distance = 808;
    graph.edge[3][18].tmp.enqueue(Vertex{"None",Position{14,516}});
    graph.edge[3][18].tmp.enqueue(Vertex{"None",Position{626,516}});
    graph.edge[18][3].tmp.enqueue(Vertex{"None",Position{626,516}});
    graph.edge[18][3].tmp.enqueue(Vertex{"None",Position{14,516}});

    //3818库
    graph.edge[4][8].distance = graph.edge[8][4].distance = 9;
    graph.edge[4][12].distance = graph.edge[12][4].distance = 257;
    graph.edge[4][12].tmp.enqueue(Vertex{"None",Position{214,9}});
    graph.edge[4][12].tmp.enqueue(Vertex{"None",Position{372,9}});
    graph.edge[12][4].tmp.enqueue(Vertex{"None",Position{372,9}});
    graph.edge[12][4].tmp.enqueue(Vertex{"None",Position{214,9}});

    //世纪翰墨
    graph.edge[5][8].distance = graph.edge[8][5].distance = 30;
    graph.edge[5][9].distance = graph.edge[9][5].distance = 5;

    //圣东方
    graph.edge[6][10].distance = graph.edge[10][6].distance = 3;
    graph.edge[6][11].distance = graph.edge[11][6].distance = 49;

    //千年时间
    graph.edge[7][11].distance = graph.edge[11][7].distance = 2;

    //星空间
    graph.edge[9][10].distance = graph.edge[10][9].distance = 31;

    //龚伟艺术空间
    graph.edge[12][13].distance = graph.edge[13][12].distance = 197;
    graph.edge[12][14].distance = graph.edge[14][12].distance = 186;

    //麦杰艺术
    graph.edge[13][14].distance = graph.edge[14][13].distance = 11;
    graph.edge[13][15].distance = graph.edge[15][13].distance = 70;

    //亚洲艺术中心
    graph.edge[15][16].distance = graph.edge[16][15].distance = 93;

    //物波空间
    graph.edge[16][17].distance = graph.edge[17][16].distance = 60;

    //卓越空间
    graph.edge[17][18].distance = graph.edge[18][17].distance = 440;
    graph.edge[17][18].tmp.enqueue(Vertex{"None",Position{372,516}});
    graph.edge[17][18].tmp.enqueue(Vertex{"None",Position{626,516}});
    graph.edge[18][17].tmp.enqueue(Vertex{"None",Position{626,516}});
    graph.edge[18][17].tmp.enqueue(Vertex{"None",Position{372,516}});
}

PathList::~PathList()
{
    qDeleteAll(m_paths);
}

bool PathList::mpaths_isEmpty()
{
    return m_paths.isEmpty();
}

QString PathList::getFirstPathName(){
    if(!m_paths.isEmpty()){
        return m_paths[0]->getName();
    }else{
        return "None";
    }
}
float PathList::pathFirstRest_Distance()
{
    if(!m_paths.isEmpty()){
        return m_paths[0]->getRest_Distance();
    }else{
        return 0;
    }
}

float PathList::pathInitCurrent_Distance(){
    if(!m_paths.isEmpty()){
        return m_paths[0]->getCurrent_Distance();
    }
    else{
        return 0;
    }
}

float PathList::pathDistanceChange(float speed){
    float dist = speed;
    if(!m_paths.isEmpty()){
        m_paths[0]->rest_distanceChange(dist);
        if (m_paths[0]->isComplete()){
            m_paths.dequeue();
        }
    }
    return pathFirstRest_Distance();
}

void PathList::setIsRunnig(bool checked){
    isRunning = checked;
    emit isRunningChanged();
}

void PathList::setIsVisible(bool checked){
    isVisible = checked;
    emit isVisibleChanged();
}

bool PathList::getIsRunnig(){
    return isRunning;
}

bool PathList::getIsVisible(){
    return isVisible;
}

QPoint PathList::getPointLeftUp(){
    return pointLeftUp;
}

QPoint PathList::getPointRightUp(){
    return pointRightUp;
}

void PathList::setPointLeftUp(Position p){
    int x = p.x;
    int y = p.y;
    pointLeftUp=QPoint(x,y);
    emit pointLeftUpChanged();
}

void PathList::setPointRightUp(Position p){
    int x = p.x;
    int y = p.y;
    pointRightUp=QPoint(x,y);
    emit pointRightUpChanged();
}

void PathList::draw(){
    if(!m_path_vertex.isEmpty()){
        Vertex v=m_path_vertex.dequeue();
        Position pre = v.position;
        while(!m_path_vertex.isEmpty()){
            Position cur = m_path_vertex.dequeue().position;
            setPointLeftUp(pre);
            setPointRightUp(cur);
            pre=cur;
        }
    }
}

void PathList::startDijstra(int startIndex,int endIndex){
    m_paths.clear();
    m_path_vertex.clear();
    vector<vector<double>>map(maxSize,vector<double>(maxSize,0));
    for(int i=0;i<maxSize;i++){
        for(int j=0;j<maxSize;j++){
            map[i][j]=graph.edge[i][j].distance;
        }
    }
    ret2 ret_tmp= dj(map,startIndex,endIndex);
    vector<int> path = ret_tmp.path;
    vector<int>::iterator it=path.begin();
    m_path_vertex.enqueue(graph.vertex[path.front()]);
    int pre=*path.begin();
    it++;
    for(;it!=path.end();it++){
        int cur=*it;
        qDebug()<<pre;
        QQueue<Vertex> tmp = graph.edge[pre][cur].tmp;
        while(!tmp.isEmpty()){
            Vertex v_tmp=tmp.dequeue();
            m_path_vertex.enqueue(v_tmp);
        }
        m_path_vertex.enqueue(graph.vertex[cur]);
        m_paths.enqueue(new Path(graph.vertex[pre].name,graph.edge[pre][cur].distance));
        pre=cur;
    }
}

void PathList::startKrustal(){
    m_paths.clear();
    m_path_vertex.clear();
    vector<vector<double>>map(maxSize,vector<double>(maxSize,INT32_MAX));
    for(int i=0;i<maxSize;i++){
        for(int j=0;j<maxSize;j++){
            map[i][j]=graph.edge[i][j].distance;
        }
    }
    ret ret_tmp = mst(map);
    vector<edge> e = ret_tmp.e;
    vector<edge>::iterator it;
    m_path_vertex.enqueue(graph.vertex[(e.front()).a]);
    for(it=e.begin();it!=e.end();it++){
        QQueue<Vertex> tmp = graph.edge[(e.front()).a][(e.front()).b].tmp;
        while(!tmp.isEmpty()){
            Vertex v_tmp=tmp.dequeue();
            m_path_vertex.enqueue(v_tmp);
        }
        m_path_vertex.enqueue(graph.vertex[(*it).b]);
        m_paths.enqueue(new Path(graph.vertex[(*it).b].name,graph.edge[(*it).a][(*it).b].distance));
    }
}
