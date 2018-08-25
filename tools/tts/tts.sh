#!/bin/sh

ARG=$1
TMPDIR=/mnt/user/temp/tts
TTS_PATH=/mnt/user/custom/tts
MP3PLAY_PATH=/mnt/user/custom/playmp3

export PYTHONPATH=/mnt/user/custom/tts/pythonlib

mkdir -p $TMPDIR
# make a safe file name
mp3file=$(echo $ARG | sed -e 's/[^A-Za-z0-9._-]/_/g')
mp3file=$TMPDIR/$mp3file.mp3

if [ ! -f $mp3file ]; then
  $($TTS_PATH/createmp3.sh "$ARG" --output $mp3file --lang de)
fi

$($MP3PLAY_PATH/play.sh $mp3file)