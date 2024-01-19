#!/bin/bash
GAME_DIR="/home/steam/palworld"

# steamclient.so: cannot open shared object file: No such file or directory - expecting /home/steam/.steam/sdk64/steamclient.so
cp /home/steam/.steam/steamcmd/linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so

cd ${GAME_DIR}

echo "-------------------------------INSTALL & UPDATE------------------------------"
steamcmd +force_install_dir ${GAME_DIR} +login anonymous +app_update 2394010 validate +quit

echo "----------------------------------START GAME---------------------------------"
./PalServer.sh --useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS