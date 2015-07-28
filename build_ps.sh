#! /bin/bash

if [ ! -d ps-lite ]; then
    echo "Install third-party libraries for PS"
    ./ps-lite/make/install_deps.sh 1>install_ps.log
    echo "Compile PS"
    make -j 4 -C ps-lite
fi

if [ ! -f config.mk ]; then
    echo "Use the default config.m"
    cp make/config.mk config.mk
fi

sed -i 's/USE_DIST_PS.*/USE_DIST_PS = 1/' config.mk
sed -i 's/PS_PATH.*/PS_PATH = .\/ps-lite/' config.mk
echo "USE_GLOG = 1" >>config.mk

make -C ps-lite -j4
make -j4
# make $1
