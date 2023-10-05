#!/bin/bash
clear
sudo apt update
clear
sudo apt upgrade -y
sudo apt install -y git python3 build-essential
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install -y nodejs
git clone https://github.com/spacebarchat/server.git
cd server
npm i -y
read -p "Do you want to install postgres? [y/N]: " response
if [[ "$response" =~ [Yy] ]]
    then
    clear
    echo "Installing postgres..."
    npm i pg --save
elif [[ "$response" =~ [Nn] ]]
    then
    clear
    echo "You've chosen not to install postgres"
else
    echo "Postgres will not be installed, you can always install it later with npm i pg --save"
fi
npm run setup
clear
read -p "Run server now? [y/N]: " response
if [[ "$response" =~ [Yy] ]]
    then
    clear
    npm run start
elif [[ "$response" =~ [Nn] ]]
    then
    echo "Server not started."
else
    echo "Invalid input or no response. Server not started."
fi
