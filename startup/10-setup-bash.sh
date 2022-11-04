#!/bin/bash
sudo cp /root/.bashrc $HOME_DIR/.bashrc
sudo cp /config/logo.txt $HOME_DIR/logo.txt
sudo chown -R $USER_NAME:$GROUP_NAME $HOME_DIR/.bashrc $HOME_DIR/logo.txt
export PATH="/usr/local/go/bin:${PATH}"
echo "alias kns='kubens'" >> $HOME_DIR/.bashrc
echo "alias kctx='kubectx'" >> $HOME_DIR/.bashrc
echo "alias kctl='kubectl'" >> $HOME_DIR/.bashrc
echo "alias kustomize='kubectl kustomize'" >> $HOME_DIR/.bashrc
echo "cat ${HOME_DIR}/logo.txt" >> $HOME_DIR/.bashrc
echo "echo 'Installed run times:'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m git\033[0m - $(git --version)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m node\033[0m - $(node -v)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m yarn\033[0m - $(yarn -v)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m aws cli\033[0m - $(aws --version)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m docker\033[0m - $(docker -v)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m python\033[0m - $(python3 --version)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m go\033[0m - $(go version)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m rust\033[0m - $(rustc --version)'" >> $HOME_DIR/.bashrc
echo "echo -e '\033[1;31m\U2605\033[0m \033[1;33m kubectl\033[0m - $(kubectl version)'" >> $HOME_DIR/.bashrc
echo "echo" >> $HOME_DIR/.bashrc