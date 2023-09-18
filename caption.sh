#!/bin/bash

BOOK=$1
CHAPTER=$2
START=$3
END=$4
JPATH=./Bible-kjv/$1.JSON
CINDEX=$(($2-1))
VINDEX=$(($3-1))

for i in $(eval echo {$START..$END})
do
    
    VERSE=$(jq '.chapters | .['$CINDEX'].verses | .['$(($VINDEX+($i-1)))'].text' $JPATH)
    echo $VERSE
    #scripture % jq '.chapters | .[0].verses | .[0].text' Genesis.json
    echo "$BOOK $CHAPTER:$(($START+($i-1)))"
    convert -background transparent -fill white -gravity center -size 1718x224 caption:"$VERSE" comtest.png +swap -gravity southeast -geometry +0+70 -composite output/"$BOOK"_"$CHAPTER"_"$(($START+($i-1)))".png
    convert -background transparent -fill white -gravity center -size 530x80 caption:"$BOOK $CHAPTER:$(($START+($i-1)))" output/"$BOOK"_"$CHAPTER"_"$(($START+($i-1)))".png +swap -gravity southeast -composite output/"$BOOK"_"$CHAPTER"_"$(($START+($i-1)))".png




done
