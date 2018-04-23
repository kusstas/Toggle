#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "toggle_controler.h"
#include "mouse_checker.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<ToggleController>("CustomControllers", 1, 0, "ToggleController");
    qmlRegisterType<MouseChecker>("CustomControllers", 1, 0, "MouseChecker");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
