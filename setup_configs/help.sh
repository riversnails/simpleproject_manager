#!/bin/bash


function help(){

        if [ "$1" == "" ]; then
                echo -e \
        "\
list - show projects list\n\
add - create new project\n\
remove - remove project\n\
update - update cmake list\n\
build - cmake list and make out file\n\
"

        fi

}

