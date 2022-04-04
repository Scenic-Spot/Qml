#include <QGuiApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "PathList.h"
#include "Path.h"
#include "Car.h"
#include "Minute.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    PathList* pathList = new PathList();
    Car* car = new Car();
    Minute* minute = new Minute();

    engine.rootContext()->setContextProperty("_pathList", pathList);
    engine.rootContext()->setContextProperty("_car", car);
    engine.rootContext()->setContextProperty("_minute", minute);
    QObject::connect(&engine, SIGNAL(quit()), qApp, SLOT(quit()));
    engine.load(url);

    /*QQuickView view;
    view.connect(view.engine(), &QQmlEngine::quit, &app, &QCoreApplication::quit);
    view.rootContext()->setContextProperty("_pathList", pathList);
    view.rootContext()->setContextProperty("_car", car);
    view.rootContext()->setContextProperty("_minute", minute);
    view.setSource(QUrl("qrc:/main.qml"));
    if (view.status() == QQuickView::Error)
        return -1;
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    view.show();*/
    return app.exec();
}
