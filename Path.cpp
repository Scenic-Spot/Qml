#include "Path.h"
#include "PathList.h"
#include "Minute.h"

Path::Path(const QString &name,float distance)
    : m_name(name),m_distance(distance),m_rest_distance(distance),m_current_distance(distance),m_complete(false)
{
    QObject::connect(this,&Path::completed,this,&Path::complete);
}

Path::~Path()
{
    qDebug("Path %s destroyed", qPrintable(m_name));
}

float Path::rest_distanceChange(float dist){
    if (m_rest_distance-dist >= 0){
        m_rest_distance -= dist;
        dist = 0;
    }
    else{
        dist -= m_rest_distance;
        m_rest_distance = 0;
    }
    if (m_rest_distance == 0){
        emit completed();
    }
    return dist;
}

void Path::complete(){
    m_complete = true;
}

bool Path::isComplete(){
    return m_complete;
}

float Path::getRest_Distance(){
    return m_rest_distance;
}

float Path::getCurrent_Distance(){
    return m_current_distance;
}

QString Path::getName(){
    return m_name;
}
