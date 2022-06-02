#include "Minute.h"

Minute::Minute()
    :m_minute(0)
{

}

Minute::~Minute(){

}

int Minute::minuteShow(float speed,float rest_distance){
    m_minute = int(rest_distance/speed/60);
    return m_minute;
}

int Minute::getMinute(){
    return m_minute;
}
