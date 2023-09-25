#!/bin/bash

# Creates a random playlist of songs in a given directory and returns a song from that list

function create_playlist() {
    local filename="$1"
    local dirname="$2"
    find $dirname -type f -name "*.ogg" -print | shuf > $filename
}

# change these depending on which system you are using this script on`
# playlist_file="/home/dh_3aqt9p/playlist.txt"
# music_dir="/home/dh_3aqt9p/radio-music/"
playlist_file="/home/enforcie/playlist.txt"
music_dir="/home/enforcie/radio-music/"

playlist_size=$(wc -c "$playlist_file" | awk '{print $1}')

if [ "$playlist_size" -eq "0" ]; then
    create_playlist $playlist_file $music_dir;
fi

song_choice=$(head -n 1 "$playlist_file")
tail -n +2 "$playlist_file" > "$playlist_file.tmp" && mv "$playlist_file.tmp" "$playlist_file"
echo "$song_choice"
