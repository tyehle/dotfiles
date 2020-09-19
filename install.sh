#!/usr/bin/env bash

base_dir=$(dirname "$(readlink -f "$0")")

shopt -s nullglob
shopt -s dotglob

for home_dir in "$base_dir"/*/home
do
    for file in "$home_dir"/*
    do
        ln -sf "$file" "$HOME/"
    done
done

for config_dir in "$base_dir"/*/config
do
    for file in "$config_dir"/*
    do
        ln -sf "$file" "$HOME/.config/"
    done
done

