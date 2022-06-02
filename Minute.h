#ifndef MINUTE_H
#define MINUTE_H

#include <QObject>

class Minute: public QObject
{
    Q_OBJECT

    Q_PROPERTY(int minute MEMBER m_minute NOTIFY minuteChanged)

public:
    explicit Minute();
    ~Minute();
    Q_INVOKABLE int minuteShow(float speed,float rest_distance);
    Q_INVOKABLE int getMinute();

signals:
    void minuteChanged();


private:
    int m_minute;
};

#endif
