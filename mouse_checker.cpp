#include "mouse_checker.h"
#include <QCursor>

QPoint MouseChecker::pos() const
{
    return QCursor::pos();
}
