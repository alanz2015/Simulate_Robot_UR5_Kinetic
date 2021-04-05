#!/bin/bash

XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

docker run -it --rm --net=host --user=$(id -u) \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    -e USER=$USER \
    --workdir=/home/$USER/ \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --gpus "all" \
    -v "/etc/group:/etc/group:ro" \
    -v "/etc/passwd:/etc/passwd:ro" \
    -v "/etc/shadow:/etc/shadow:ro" \
    -v "/etc/sudoers.d:/etc/sudoers.d:ro" \
    -v "/etc/sudoers:/etc/sudoers:ro" \
    -v "/etc/machine-id:/etc/machine-id:ro" \
    -v "/home/$USER/:/home/$USER/:rw" \
    test:0.1 \
    bash
