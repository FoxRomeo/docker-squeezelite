#!/bin/sh

echo "About to sleep for ${STARTUP_DELAY_SEC} second(s)"
sleep ${STARTUP_DELAY_SEC}
echo "Rise and shine!"

if [ -n "${SQUUEZELITE_SERVER}" ]; then
  SQUEEZELITE_PARAMS="${SQUEEZELITE_PARAMS} -s ${SQUUEZELITE_SERVER}"
fi

if [ -n "${SQUUEZELITE_UNMUTE}" ]; then
  SQUEEZELITE_PARAMS="${SQUEEZELITE_PARAMS} -U ${SQUUEZELITE_UNMUTE}"
fi

/usr/bin/squeezelite \
  -n ${SQUEEZELITE_NAME} \
  -o ${SQUEEZELITE_AUDIO_DEVICE} \
  -C ${SQUEEZELITE_TIMEOUT} \
  -D ${SQUEEZELITE_DELAY} \
  "${SQUEEZELITE_PARAMS}"


