#ifndef CAR_H
#define CAR_H

#include <QObject>

class Car:public QObject
{
    Q_OBJECT

    //speed: m/s
    Q_PROPERTY(float speed MEMBER m_speed NOTIFY speedChanged)

public:
    explicit Car(float speed = 20);
    ~Car();
    Q_INVOKABLE float run();

signals:
    void speedChanged();

private:
    float m_speed;
};

#endif // CAR_H
