#ifndef PATHLIST_H
#define PATHLIST_H

#include <QObject>
#include <QVector>

class Path;

class PathList:public QObject
{
    Q_OBJECT

    Q_PROPERTY(int count READ count CONSTANT)
    Q_PROPERTY(Path* dest MEMBER m_dest NOTIFY destChanged);

public:
    explicit PathList(QObject *parent = nullptr);
    ~PathList();

    int count() const;

    Q_INVOKABLE void CreatePathList();
    Q_INVOKABLE float pathFirstRest_Distance();
    Q_INVOKABLE float pathInitCurrent_Distance();
    void enqueuePath(Path* path);
    void dequeuePath();
    void modifyPath(int index,Path* path);

    Q_INVOKABLE float pathDistanceChange(float dist);

signals:
    void destChanged();
    void pathDistanceChanged(float dist);

private:
    QVector<Path*> m_paths;
    Path* m_dest;
};

#endif // PATHLIST_H
