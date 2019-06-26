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
		echo "-p, --port        Listen port, default 4000"
		exit
		;;
	-H | --map-home)
		maphome=true
		;;
	-p | --port)
		port=$2
		shift
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

options="$options $others"
commandline="docker run -it $options oakchen/hexo"

echo $commandline
eval $commandline
