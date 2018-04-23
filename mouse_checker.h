#ifndef MOUSE_CHECKER_H
#define MOUSE_CHECKER_H

#include <QQuickItem>

class MouseChecker : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QPoint pos READ pos)

public:

QPoint pos() const;
};

#endif // MOUSE_CHECKER_H
