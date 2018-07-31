#!/usr/bin/env sh

clock () {
    date "+%T %a %e %b"
}

ram () {
    local line="$(free -m | grep 'Mem:' | sed 's/ \+/ /g')"
    echo "$(cut -d ' ' -f3 <<< "$line")/$(cut -d ' ' -f2 <<< "$line")"
}

home_files() {
    local n_files="$(ls -al "$HOME"| wc -l)"

    # -2 accounting for . and ..
    echo "$(($n_files - 2))"
}

while true; do
    LINE="Home: $(home_files) "
    LINE+="Ram: $(ram) "
    LINE+="Time: $(clock)"

    xsetroot -name "${LINE}"

    sleep 1
done
