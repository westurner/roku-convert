#!/usr/bin/env bash
# Convert videos to Roku-compatible h.264 AAC videos
#
# Usage:
#
#   ./roku-convert.sh install <path>
#   ./roku-convert.sh video.mp4 <output/path>
#
# TODO: is -ab 128k necessary? would `copy` work for some videos?
set -x

function copy_preset {
    local PRESETDIR="${1:-"${HOME}/.ffmpeg"}"
    mkdir -p "${PRESETDIR}"

    local __THIS=$(readlink -e "$0")
    local __THISDIR=$(dirname "${__THIS}")

    cp "${__THISDIR}/libx264-roku.ffpreset" "${PRESETDIR}"
}

function convert_video {
    local input="${1}"
    local outputdir="${2:-"modified"}"
    local output="${outputdir}/$(basename "$input").modified.mp4"

    ffmpeg -y \
        -i "${input}" -acodec aac -ab 128k -vcodec libx264 \
        -vpre roku -crf 15 -threads 0 "${output}"
}

if [ -n "${BASH_SOURCE}" ] && [ "${BASH_SOURCE}" == "${0}" ]; then
    if [ "${1}" == "install" ]; then
        copy_preset "${2}"
    else
        convert_video "${@}"
    fi
fi
