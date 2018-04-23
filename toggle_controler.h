#ifndef TOGGLE_CONTROLLER_H
#define TOGGLE_CONTROLLER_H

#include <QQuickItem>

class ToggleController : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(bool state READ state WRITE setState NOTIFY stateChanged)

public:

    bool state() const;

signals:

    void stateChanged(bool state);
    void fix();

public slots:

    void setState(bool state);

private:

    bool state_;

};

#endif // TOGGLE_CONTROLLER_H
