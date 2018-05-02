#! /bin/bash 

HOME_INSTALL=$PWD
rm -fr packages/*
mkdir packages

echo " installing idsk from github."
git clone  https://github.com/cpcsdk/idsk.git ./packages/idsk
cd packages/idsk
cmake ./ 
make 
cp iDSK $HOME_INSTALL/bin
cd $HOME_INSTALL

echo " installing cpcxfer from github."
git clone https://github.com/M4Duke/cpcxfer.git ./packages/cpcxfer
cd packages/cpcxfer 
make 
cp xfer pyxfer.py $HOME_INSTALL/bin
cd $HOME_INSTALL 

echo " installing gfx2crtc from github."
git clone https://github.com/cpcsdk/gfx2crtc.git ./packages/gfx2crtc
cd packages/gfx2crtc
make 
cp png2crtc raw2crtc $HOME_INSTALL/bin
cd $HOME_INSTALL


echo " installing zmac from github."
git clone https://github.com/cpcsdk/cpctools.git ./packages/cpctools
cd packages/cpctools/cpctools/tools/ZMac
make 
cp zmac $HOME_INSTALL/bin
cd $HOME_INSTALL

echo "type this : export PATH=$HOME_INSTALL/bin:$PATH"

#echo " installing sdcc from github."
#git clone https://github.com/cpcitor/cpc-dev-tool-chain.git
#cd cpc-dev-tool-chain
#make 
#cd ../

#echo " intalling zmac from spdns."
#git clone https://k1.spdns.de/Git/zasm-4.0.git
#cd zasm-4.0/Linux
#make 
#cd ../
