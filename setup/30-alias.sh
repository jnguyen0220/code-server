#!/bin/bash
echo "alias kns='kubens'" >> ~/.bashrc
echo "alias kctx='kubectx'" >> ~/.bashrc
echo "alias kctl='kubectl'" >> ~/.bashrc
echo "alias kustomize='kubectl kustomize'" >> ~/.bashrc
echo "cat ~/logo.txt" >> ~/.bashrc
echo "echo 'Installed run times:'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m git\033[0m - $(git --version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m node\033[0m - $(node -v)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m yarn\033[0m - $(yarn -v)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m aws cli\033[0m - $(aws --version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m docker\033[0m - $(docker -v)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m python\033[0m - $(python3 --version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m go\033[0m - $(go version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m rust\033[0m - $(rustc --version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m\U2605\x1B[0m \033[33;1m kubectl\033[0m - $(kubectl version)'" >> ~/.bashrc
echo "echo" >> ~/.bashrc