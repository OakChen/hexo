#! /bin/sh

# Hexo docker运行脚本
# Copyright (C) 2019-2019 Oak Chen <oak@sfysoft.com>

port=4000
until [ $# -eq 0 ]
do
	case $1 in
	-h | --help)
		echo "Usage:"
		echo "-h, --help        Display this information"
		echo "-H, --map-home    Map $HOME directory"
		echo "-P, --port        Listen port, default 4000"
		echo "-p, --passwd      Map /etc/passwd"
		echo "-g, --group       Map /etc/group"
		echo "-s, --shadow      Map /etc/shadow"
		exit
		;;
	-H | --map-home)
		maphome=true
		;;
	-P | --port)
		port=$2
		shift
		;;
	-p | --password)
		mappasswd=true
		;;
	-g | --group)
		mapgroup=true
		;;
	-s | --shadow)
		mapshadow=true
		;;
	*)
		others="$*"
		break
		;;
	esac
	shift
done


if [ -n "$maphome" ]; then
	options="$options -v $HOME:$HOME"
fi

if [ "$port" != "" ]; then
	options="$options -p $port:4000"
fi

if [ "$mappasswd" = "true" ]; then
	options="$options -v /etc/passwd:/etc/passwd"
fi

if [ "$mapgroup" = "true" ]; then
	options="$options -v /etc/group:/etc/group"
fi

if [ "$mapshadow" = "true" ]; then
	options="$options -v /etc/shadow:/etc/shadow"
fi

options="$options $others"
commandline="docker run -it $options oakchen/hexo"

echo $commandline
eval $commandline
