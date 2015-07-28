#! /bin/bash


if [ ! -f config.mk ]; then
    echo "Use the default config.m"
    cp make/config.mk config.mk
fi

make -j4

