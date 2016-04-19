#!/bin/bash

# scan script
# usage ./scan.sh ZZZ YYY
# requires tesseract (tesseract-ocr package)

SOURCE_PATH='../screenshots'
IDX_START=$1
IDX_END=$2

PATTERN_AMPLITUDE='s|.*Amplilude\(.*\)$|\1|'
PATTERN_PHASE='s|.*Phase\(.*\)$|\1|'
PATTERN_FREQUENCY='s|.*Frequency\(.*\)$|\1|'

UZN_FILE=uzn-01.uzn

OUTFILE=output.csv
WORKDIR=_temp

rm -rf $WORKDIR
mkdir -p $WORKDIR

rm -rf $OUTFILE

cp $UZN_FILE $WORKDIR/source.uzn

for IDX in $(eval echo "{$IDX_START..$IDX_END}")
do
  SOURCE_FILE="$SOURCE_PATH/tek00$IDX.png"
  SOURCE_NAME=`basename "$SOURCE_FILE"`
  EXT="${SOURCE_NAME##*.}"

  cp $SOURCE_FILE $WORKDIR/source.$EXT

  echo "processing $SOURCE_NAME ..."

  pushd $WORKDIR > /dev/null

  tesseract -psm 6 'source.png' result > /dev/null 2>&1
  sed -i '/^$/d' result.txt

  AMPL1=`sed '1q;d' result.txt | sed "$PATTERN_AMPLITUDE"`
  AMPL2=`sed '2q;d' result.txt | sed "$PATTERN_AMPLITUDE"`
  PHASE=`sed '3q;d' result.txt | sed "$PATTERN_PHASE"`
  FREQN=`sed '4q;d' result.txt | sed "$PATTERN_FREQUENCY"`

  # cat result.txt

  popd > /dev/null

  echo "$SOURCE_NAME,$AMPL1,$AMPL2,$PHASE,$FREQN" >> $OUTFILE

done
