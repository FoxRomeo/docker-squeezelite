#!/bin/sh
/bin/echo [HEALTHCHECK]

/bin/ps -aux | grep "[s]queezelite"

return $?