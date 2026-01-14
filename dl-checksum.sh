#!/usr/bin/env bash
set -e
DIR=~/Downloads
MIRROR=https://github.com/stedolan/jq/releases/download

dl()
{
    local -r ver=$1
    local -r lchecksums=$2
    local -r os=$3
    local -r arch=$4
    local -r dotexe=${5:-}
    local -r platform="${os}-${arch}"
    local -r exe="jq-${platform}${dotexe}"
    local -r url="${MIRROR}/jq-${ver}/${exe}"
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep -e "${exe}\$" $lchecksums | awk '{print $1}')
}

dl_ver() {
    local -r ver=$1
    # https://github.com/jqlang/jq/releases/download/jq-1.7.1/sha256sum.txt
    local -r url="${MIRROR}/jq-${ver}/sha256sum.txt"
    local -r lchecksums="${DIR}/jq-${ver}-sha256sum.txt"
    if [ ! -e "${lchecksums}" ];
    then
        curl -sSLf -o "$lchecksums" "${url}"
    fi
    printf "  # %s\n" $url
    printf "  '%s':\n" $ver
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums linux arm64
    dl $ver $lchecksums linux armel
    dl $ver $lchecksums linux armhf
    dl $ver $lchecksums linux i386
    dl $ver $lchecksums linux mips
    dl $ver $lchecksums linux mips64
    dl $ver $lchecksums linux mips64el
    dl $ver $lchecksums linux mips64r6
    dl $ver $lchecksums linux mips64r6el
    dl $ver $lchecksums linux mipsel
    dl $ver $lchecksums linux mipsr6
    dl $ver $lchecksums linux mipsr6el
    dl $ver $lchecksums linux powerpc
    dl $ver $lchecksums linux ppc64el
    dl $ver $lchecksums linux riscv64
    dl $ver $lchecksums linux s390x
    dl $ver $lchecksums macos amd64
    dl $ver $lchecksums macos arm64
    dl $ver $lchecksums windows amd64 .exe
    dl $ver $lchecksums windows i386 .exe
}

dl_ver ${1:-1.8.1}
