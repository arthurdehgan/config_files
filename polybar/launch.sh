#!/bin/sh

killall -q polybar

polybar gruvbar & disown
