#include "Car.h"
#include "Path.h"
#include "PathList.h"

Car::Car(float speed)
    :m_speed(speed)
{
}

Car::~Car()
{
    qDebug("Car destroyed");
}

float Car::run()
{
    return m_speed;
}
