#!/bin/sh

apt update
apt install curl
curl https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar -o minecraft-server.jar
