#!/bin/bash

BOOK=$1
CHAPTER=$2
START=$3
END=$4
JPATH=./Bible-kjv/$BOOK.JSON
CINDEX=$(($CHAPTER-1))
VINDEX=$(($START-1))

for i in $(eval echo {$START..$END})
do
    VERSE=$(jq '.chapters | .['$CINDEX'].verses | .['$(($i-1))'].text' $JPATH)
    echo $VERSE
    echo "$BOOK $CHAPTER:$(($i))"
    convert -background transparent -fill white -gravity center -size 1718x224 caption:"$VERSE" comtest.png +swap -gravity southeast -geometry +0+70 -composite output/"$BOOK"_"$CHAPTER"_"$(($i))".png
    convert -background transparent -fill white -gravity center -size 530x80 caption:"$BOOK $CHAPTER:$(($i))" output/"$BOOK"_"$CHAPTER"_"$(($i))".png +swap -gravity southeast -composite output/"$BOOK"_"$CHAPTER"_"$(($i))".png




done
