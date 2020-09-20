#!/usr/bin/env bash

base_dir=$(dirname "$(readlink -f "$0")")

shopt -s nullglob
shopt -s dotglob

echo "linking to $HOME/"
for home_dir in "$base_dir"/*/home
do
    for file in "$home_dir"/*
    do
        echo "  $(basename "$file")"
        ln -sf "$file" "$HOME/"
    done
done

echo "linking to $HOME/.config/"
for config_dir in "$base_dir"/*/config
do
    for file in "$config_dir"/*
    do
        echo "  $(basename "$file")"
        ln -sf "$file" "$HOME/.config/"
    done
done

