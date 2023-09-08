#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/stedolan/jq/releases/download

dl()
{
    ver=$1
    platform=$2
    dotexe=${3:-}
    lfile=$DIR/jq-${ver}-${platform}${dotexe}
    url=${MIRROR}/jq-${ver}/jq-${platform}${dotexe}
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    ver=$1
    printf "  '%s':\n" $ver
    dl $ver linux32
    dl $ver linux64
    dl $ver osx-amd64
    dl $ver win32 .exe
    dl $ver win64 .exe

}

dl_ver ${1:-1.7}
