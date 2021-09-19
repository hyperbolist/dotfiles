#!/usr/bin/env bash

case "$1" in
  *.tar*) tar tf "$1";;
  *.zip) unzip -l "$1";;
  *) highlight -O ansi "$1" || cat "$1";;
esac

