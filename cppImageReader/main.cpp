#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "imgreader.h"
#include <QElapsedTimer>

int main(int argc, char *argv[])
{
    QElapsedTimer timer;
    timer.start();
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    //introduce as qml type
    qmlRegisterType<imgReader>("com.company.imgReader",1,0,"ImgReader");

    //imgReader reader;

    //reader.setPath("pathhere");
    //reader.getFiles();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    qInfo() << timer.elapsed();

    return app.exec();
}
