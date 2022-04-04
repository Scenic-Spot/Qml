#include "PathList.h"
#include "Path.h"

PathList::PathList(QObject *parent)
    : QObject(parent)
{
    CreatePathList();
}

PathList::~PathList()
{
    qDeleteAll(m_paths);
}

int PathList::count() const
{
    return m_paths.count();
}

void PathList::CreatePathList(){
    m_paths << new Path("Wang Street",3.7,3.1);
    m_paths << new Path("Li Street",1.2,1.2);
    m_paths << new Path("Da Street",0.5,0.5);
}

float PathList::pathFirstRest_Distance()
{
    return m_paths[0]->getRest_Distance();
}

float PathList::pathInitCurrent_Distance(){
    return m_paths[0]->getCurrent_Distance();
}

void PathList::enqueuePath(Path* path)
{
    m_paths << path;
}

void PathList::dequeuePath()
{
    if(count() != 0)
        m_paths.pop_front();
}

void PathList::modifyPath(int index,Path* path)
{
    m_paths[index] = path;
}

float PathList::pathDistanceChange(float speed){
    float dist = speed/1000;
    if(count() != 0){
        m_paths[0]->rest_distanceChange(dist);
        if (m_paths[0]->isComplete()){
            dequeuePath();
        }
    }
    return pathFirstRest_Distance();
}
