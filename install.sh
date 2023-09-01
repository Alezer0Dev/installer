#!/bin/bash
apt update
apt-get upgrade -y
apt install -y git python3 build-essential
apt install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install -y nodejs
git clone https://github.com/spacebarchat/server.git
cd server
npm i -y
npm run setup
clear
read -p "Run server now? [y/N]: " response
if [[ "$response" =~ [Yy] ]] then
    clear
    npm run start
elif [[ "$response" =~ [Nn] ]] then
    echo "Server not started."
else
    echo "Invalid input or no response. Server not started."
fi