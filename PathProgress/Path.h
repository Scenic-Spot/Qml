#ifndef PATH_H
#define PATH_H

#include <QObject>

class Path:public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name MEMBER m_name NOTIFY nameChanged)
    Q_PROPERTY(float distance MEMBER m_distance NOTIFY distanceChanged)
    Q_PROPERTY(float rest_distance MEMBER m_rest_distance NOTIFY rest_distanceChanged)
    Q_PROPERTY(float current_distance MEMBER m_current_distance NOTIFY current_distanceChanged)


public:
    explicit Path(const QString &name,float distance,float current_distance);
    ~Path();
    float rest_distanceChange(float dist);
    bool isComplete();
    float getRest_Distance();
    float getCurrent_Distance();

signals:
    void nameChanged();
    void distanceChanged();
    void rest_distanceChanged();
    void current_distanceChanged();
    void completed();

public slots:
    void complete();

private:
    QString m_name;
    float m_distance;
    float m_rest_distance;
    float m_current_distance;
    bool m_complete;
};

#endif // PATH_H
