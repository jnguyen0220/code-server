export NODE_VERSION=$NODE_VERSION
export YARN_VERSION=$YARN_VERSION

ARCH="$(dpkg --print-architecture)"
NODE_PACKAGE=node-v$NODE_VERSION-linux-$ARCH
NODE_HOME=/opt/$NODE_PACKAGE

export PATH=$NODE_HOME/bin:$PATH

curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /usr/local --strip-components=1 --no-same-owner
ln -s /usr/local/bin/node /usr/local/bin/nodejs 

node --version
npm --version

npm install --global yarn@$YARN_VERSION
yarn --version