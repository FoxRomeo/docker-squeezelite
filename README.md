# squeezelite
__build a docker container for squeezelite__
main goal is to use (and tested) on architecture arm32v6 (old RPi) and arm32v7 (RPi2 and newer, NanoPi Neo2 and others)


## based on squeezelite
https://github.com/ralph-irving/squeezelite
and alpine:3.12
(newer alpine baseimages do NOT work on any RPi (Debian Buster) right now (02/2021)

### available container:
arm32v6

### planed:
arm32v7
arm64v8
(x86)

##__Usage:__
docker run -d --restart=unless-stopped \
    --name=Squeezelite \
    --device=/dev/snd \
    -e SQUEEZELITE_NAME=__name__ \
    -e SQUEEZELITE_AUDIO_DEVICE=__device__ \
    intrepidde/arm32v6-squeezelite:latest


###variables and their defaults:
* STARTUP_DELAY_SEC 0
* SQUEEZELITE_AUDIO_DEVICE default
* SQUEEZELITE_NAME SqueezeLite
* SQUEEZELITE_TIMEOUT 2
* SQUEEZELITE_DELAY 500
*
* SQUEEZELITE_SERVER -empty-
* SQUEEZELITE_UNMUTE -empty-
