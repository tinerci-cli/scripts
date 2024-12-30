#!/bin/sh
mkdir -p /tmp/"$USER"/tmp/
rm ~/.local/tmp && ln -s /tmp/"$USER"/tmp ~/.local || ln -s /tmp/"$USER"/tmp ~/.local
