#ifndef PATHLIST_H
#define PATHLIST_H

#include <QObject>
#include <QQueue>
#include <QPainter>
#include <QDebug>
#include "mst.hh"
#include "sp.hh"

#define maxSize 19
#define inf 10000

struct Position{
    int x;
    int y;
};
typedef struct Position Position;

struct Vertex{
    QString name;
    Position position;
};
typedef struct Vertex Vertex;

struct Edge{
    float distance;
    QQueue<Vertex> tmp;
};
typedef struct Edge Edge;

struct Graph{
    int numV;
    int numE;
    Vertex vertex[maxSize];
    Edge edge[maxSize][maxSize];
};
typedef struct Graph Graph;

class Path;

class PathList:public QObject
{
    Q_OBJECT

    Q_PROPERTY(Path* dest MEMBER m_dest NOTIFY destChanged);
    Q_PROPERTY(bool isRunning MEMBER isRunning NOTIFY isRunningChanged);
    Q_PROPERTY(bool isVisible MEMBER isVisible NOTIFY isVisibleChanged);

public:
    explicit PathList(QObject *parent = nullptr);
    ~PathList();
    Q_INVOKABLE bool mpaths_isEmpty();
    Q_INVOKABLE float pathFirstRest_Distance();
    Q_INVOKABLE float pathInitCurrent_Distance();
    Q_INVOKABLE void startDijstra(int startIndex,int endIndex);
    Q_INVOKABLE void startKrustal();
    Q_INVOKABLE void setIsRunnig(bool checked);
    Q_INVOKABLE void setIsVisible(bool checked);
    Q_INVOKABLE bool getIsRunnig();
    Q_INVOKABLE bool getIsVisible();
    Q_INVOKABLE QString getFirstPathName();
    Q_INVOKABLE void draw();

    Q_INVOKABLE float pathDistanceChange(float dist);

    Q_INVOKABLE QPoint getPointLeftUp();
    Q_INVOKABLE QPoint getPointRightUp();
    Q_INVOKABLE int getAdd_x();
    Q_INVOKABLE int getAdd_y();
    Q_INVOKABLE void startSearch(int index);

    void setPointLeftUp(Position p);
    void setPointRightUp(Position p);

signals:
    void destChanged();
    void pathDistanceChanged(float dist);
    void isRunningChanged();
    void isVisibleChanged();
    void pointLeftUpChanged();
    void pointRightUpChanged();
    void iconChanged();
    void searchChanged();

private:
    QQueue<Path*> m_paths;
    QQueue<Vertex> m_path_vertex;
    QPoint pointLeftUp;
    QPoint pointRightUp;
    Graph graph;
    Path* m_dest;
    bool isRunning;
    bool isVisible;
    int m_x;
    int m_y;
};

#endif // PATHLIST_H
