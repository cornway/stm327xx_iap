#!/bin/bash

DUMMY_FILE="dummy.txt"
OUT_FILE=$DUMMY_FILE

function config_begin () {
        OUT_FILE=$2
        [ -z $OUT_FILE ] && OUT_FILE=$DUMMY_FILE
        [ -f $OUT_FILE ] && rm $OUT_FILE
        touch $OUT_FILE
        echo "[ $1 ]+"
}

function config_set () {
        echo -e $1 >> $OUT_FILE
}

config_add_cdef_cond () {
        dst=$1 exp=$2 name=$3 file=$OUT_FILE

        [ -z $name ] && name=$exp
        echo -e 'ifeq ($('$exp'), 1)' >>  $file
        echo -e $dst' += -D'$name'=1' >>  $file
        echo -e "else" >>  $file
        echo -e $dst' += -D'$name'=0' >>  $file
        echo -e "endif\n" >>  $file
}

config_set_hdr_ifeq () {
        dst=$1 exp=$2 true=$3 false=$4 file=$OUT_FILE

        [ -z $true ] && true="1"; [ -z $false ] && false="0"
        echo -e "#if ($exp)" >>  $file
        echo -e "#define $dst ($true)" >>  $file
        echo -e "#else" >> $file
        echo -e "#define $dst ($false)" >>  $file
        echo -e "#endif\n" >>  $file
}