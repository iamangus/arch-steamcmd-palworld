#!/bin/bash
GAME_DIR="/home/steam/palworld"

cd ${GAME_DIR}

echo "-------------------------------INSTALL & UPDATE------------------------------"
steamcmd +force_install_dir ${GAME_DIR} +login anonymous +app_update 2394010 validate +quit

echo "----------------------------------START GAME---------------------------------"
./PalServer.sh --useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS