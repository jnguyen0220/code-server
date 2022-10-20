export YARN_VERSION=$YARN_VERSION

curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
sudo apt install -y nodejs

node --version
npm --version

npm install --global yarn@$YARN_VERSION
yarn --version