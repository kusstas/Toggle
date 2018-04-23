#include "ToggleControler.h"

bool ToggleController::state() const
{
    return state_;
}

void ToggleController::setState(bool state)
{
    if (state_ != state) {
        state_ = state;
        emit stateChanged(state_);
    }

    emit fix();
}
