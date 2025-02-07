#!/bin/bash

tools_root='buildtools';

if [ -d "$tools_root" ]; then

  echo "$tools_root does exist.";

else
	mkdir $tools_root;
	echo 'created build toold directory';
fi

clone_if_not_existing() {
    local repo_url="$1"
    local repo_branch="$2"
    local repo_name="${3:-${repo_url##*/}}"

    if [ -d "$tools_root/$repo_name" ]; then
        print_info "$repo_name - already exists, skipping download"
        return 0
    fi

    # Try shallow clone first, fallback to full clone
    if ! git clone "$repo_url" -b "$repo_branch" --depth 1 --recursive "$tools_root/$repo_name"; then
        print_info "Shallow clone failed, attempting full clone..."
        git clone "$repo_url" -b "$repo_branch" --recursive "$tools_root/$repo_name"
    fi
}

if [ -n "$TERM" ] && [ "$TERM" != "dumb" ]; then
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    POWDER_BLUE=$(tput setaf 153)
    RESET=$(tput sgr0)
fi

function print_error() {
    printf "${RED}%s${RESET}\\n" "${*}" 1>&2
}

function print_warning() {
    printf "${YELLOW}%s${RESET}\\n" "${*}"
}

function print_success() {
    printf "${GREEN}%s${RESET}\\n" "${*}"
}

function print_info() {
    printf "${POWDER_BLUE}%s${RESET}\\n" "${*}"
}

function print_message() {
    printf "${RESET}%s${RESET}\\n" "${*}"
}

function print_header() {
    printf "${GREEN}%s${RESET}\\n" "${*}"
}


clone_if_not_existing "https://github.com/gussi362/linaro-gcc-4.9" "main"
clone_if_not_existing "https://github.com/gussi362/samsung-toolchain" "samsung"
