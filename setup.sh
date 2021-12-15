#!/bin/bash

FILE_PATH=$(cd "$(dirname "$0")" ; pwd -P)
PROJECTS_PATH="${FILE_PATH}/projects"

CMAKE_LIST_PATH="CMakeLists.txt"

COLOR_RESET="\033[0m"
COLOR_RED="\033[1;31m"
COLOR_CYAN="\033[1;36m"


function check_arg(){

	if [ "$1" != "" ]; then
		echo true
	else
		echo false
	fi
}

function check_path(){

	if [ -d "$1" ]; then
		echo true
	else
		echo false
	fi
}

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

function show_list(){

	if [ "$1" == "-s" ]; then
		SAVE=$(du -shc $PROJECTS_PATH/*)
	 	SAVE_SHORT=${SAVE//"$PROJECTS_PATH/"/"project - "}
		echo "$SAVE_SHORT"

	elif [ "$1" == "-t" ]; then
		if [ "$2" == "" ]; then
			echo "please input tree deepth!"
			exit 1
		fi
		tree $PROJECTS_PATH -L $2

	elif [ "$1" == "-p" ]; then
		echo $(ls "$PROJECTS_PATH")

	elif [ "$1" == "" ]; then
		SAVE=$(ls "$PROJECTS_PATH")
		echo -e "${COLOR_CYAN}${SAVE}${COLOR_RESET}"

	else
		echo "unable argument!"
	fi
}

function init(){

	if [ "$(check_path $PROJECTS_PATH)" == "false" ]; then
		mkdir 777 "$PROJECTS_PATH"
	fi

}

function add(){

	if [ "$(check_arg $1)" == "false" ]; then
		echo "no argument!"
		exit 1
	elif [ "$(check_arg $2)" == "true" ]; then
		echo "too many arguments!"
		exit 2
	fi

	DIR_PATH="${PROJECTS_PATH}/"${1}
	echo $DIR_PATH

	if [ "$(check_path $DIR_PATH)" == "false" ]; then
		mkdir -m 777 "$DIR_PATH"
		mkdir -m 777 "${DIR_PATH}/include"
		mkdir -m 777 "${DIR_PATH}/source"
		touch "${DIR_PATH}/CMakeLists.txt"
		chmod 777 "${DIR_PATH}/${CMAKE_LIST_PATH}"
		echo "add end!"

	else
		echo "project is exists!"
	fi
}

function remove(){

	if [ "$(check_arg $1)" == "false" ]; then
		echo "no argument!"
		exit 1
	elif [ "$(check_arg $2)" == "true" ]; then
		echo "too many arguments!"
		exit 2
	fi

	DIR_PATH="${PROJECTS_PATH}/"${1}

	if [ "$(check_path $DIR_PATH)" == "true" ]; then
		echo -e "${COLOR_RED}delete${COLOR_RESET} ${1} project"
		echo "Do you want to continue? [y/n]"
		read CHECK
		if [ "$CHECK" == "y" ]; then
			rm -rf $DIR_PATH
			echo "remove end!"
		else
			echo "remove cancel"
			exit 0
		fi

	else
		echo "project is not found!"
	fi
}

function update_select(){

	if [ "$1" == "" ]; then
		echo "no argument!"
		exit 1
	fi

	DIR_PATH="$1"

	SAVE=$(find $DIR_PATH/source -name "*c" \
		| tr '\n' ' ')

		#echo ${SAVE//"$DIR_PATH/source/"/"\${SOURCE}"}
		SAVE_SHORT=${SAVE//"$DIR_PATH/source/"/"\${SOURCE}"}

		echo -e \
	"SET(SOURCE ./source/)\n\
	SET(TARGET $SAVE_SHORT)\n\
	INCLUDE_DIRECTORIES(include)\n\
	ADD_EXECUTABLE(app.out \${TARGET})" \
		> $DIR_PATH/${CMAKE_LIST_PATH}
}

function update(){

	if [ "$(check_arg $1)" == "false" ]; then
		echo "no argument!"
		exit 1
	elif [ "$(check_arg $2)" == "true" ]; then
		echo "too many arguments!"
		exit 2
	fi

	if [ "$1" == "-a" ]; then
		echo "update all project"
		echo "Do you want to continue? [y/n]"
		read CHECK

		if [ "$CHECK" == "y" ]; then
			DIFF=1
			PROJECTS_LIST=$(echo $(show_list "-p") | cut -d ' ' -f"$DIFF")

			while [ "$P_PROJETCS_LIST" != "$PROJECTS_LIST" ] && [ "$PROJECTS_LIST" != "" ]; do
				echo "updating ${PROJECTS_LIST}..."
				update_select "${PROJECTS_PATH}/${PROJECTS_LIST}"
				DIFF=$((DIFF+1))
				P_PROJETCS_LIST="$PROJECTS_LIST"
				PROJECTS_LIST=$(echo $(show_list "-p") | cut -d ' ' -f"$DIFF")
			done
		else
			echo "update cancel"
			exit 0
		fi

		echo "update is end!"
		exit 0
	fi

	DIR_PATH="${PROJECTS_PATH}/"${1}

	if [ "$(check_path $DIR_PATH)" == "true" ]; then
		update_select $DIR_PATH

	else
		echo "project is not found!"
	fi
}

function build_select(){

	if [ "$1" == "" ]; then
		echo "no argument!"
		exit 1
	fi

	DIR_PATH="$1"

	cd "$DIR_PATH"
	cmake "./$CMAKE_LIST_PATH"
	make
}

function build_manager(){
	if [ "$(check_arg $1)" == "false" ]; then
                echo "no argument!"
                exit 1
        elif [ "$(check_arg $2)" == "true" ]; then
                echo "too many arguments!"
                exit 2
        fi

        if [ "$1" == "-a" ]; then
		echo "build all project"
		echo "Do you want to continue? [y/n]"
		read CHECK

		if [ "$CHECK" == "y" ]; then
		        DIFF=1
		        PROJECTS_LIST=$(echo $(show_list "-p") | cut -d ' ' -f"$DIFF")

		        while [ "$P_PROJETCS_LIST" != "$PROJECTS_LIST" ] && [ "$PROJECTS_LIST" != "" ]; do
		                echo "makeing ${PROJECTS_LIST}..."
		                build_select "${PROJECTS_PATH}/${PROJECTS_LIST}"
				DIFF=$((DIFF+1))
				P_PROJETCS_LIST="$PROJECTS_LIST"
				PROJECTS_LIST=$(echo $(show_list "-p") | cut -d ' ' -f"$DIFF")
		        done
		else
		        echo "build cancel"
		        exit 0
		fi

        	echo "build is end!"
        	exit 0
	fi

	DIR_PATH="${PROJECTS_PATH}/"${1}

	if [ "$(check_path $DIR_PATH)" == "true" ]; then
		build_select $DIR_PATH

	else
		echo "project is not found!"
	fi
}


function rename(){

	if [ "$(check_arg $1)" == "false" ]; then
                echo "no argument!"
                exit 1
	elif [ "$(check_arg $2)" == "false" ]; then
                echo "no argument!"
                exit 1
        elif [ "$(check_arg $3)" == "true" ]; then
                echo "too many arguments!"
                exit 2
        fi

	DIR_PATH1="${PROJECTS_PATH}/"${1}
	DIR_PATH2="${PROJECTS_PATH}/"${2}

	if [ "$(check_path $DIR_PATH1)" == "true" ] && [ "$(check_path $DIR_PATH2)" == "false" ]; then
		mv "$DIR_PATH1" "$DIR_PATH2"
		echo -e "rename "${COLOR_CYAN}"$1""${COLOR_RESET} to "${COLOR_CYAN}"$2""${COLOR_RESET}!"
	elif [ "$(check_path $DIR_PATH1)" == "true" ]; then
		echo "rename failed! project is exists!"

	else
		echo "rename failed! project is not found!"
	fi

}


echo ""


if [ "$1" == "list" ]; then
	show_list $2 $3 $4

elif [ "$1" == "add" ]; then
	add $2 $3

elif [ "$1" == "remove" ]; then
	remove $2 $3

elif [ "$1" == "update" ]; then
	update $2 $3

elif [ "$1" == "build" ]; then
	build_manager $2 $3

elif [ "$1" == "rename" ]; then
	rename $2 $3 $4

elif [ "$1" == "help" ]; then
	help $2

else
	echo "no argument!"
	exit 1
fi


echo ""

