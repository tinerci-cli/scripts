#!/bin/sh
mkdir -p /tmp/"$USER"/tmp/
unlink ~/.local/tmp/ || ln -s /tmp/"$USER"/tmp ~/.local/ && ln -s /tmp/"$USER"/tmp ~/.local/
