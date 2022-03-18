#!/bin/bash
echo "alias kns='kubens'" >> ~/.bashrc
echo "alias kctx='kubectx'" >> ~/.bashrc
echo "alias kctl='kubectl'" >> ~/.bashrc
echo "alias kustomize='kubectl kustomize'" >> ~/.bashrc
echo "\x1B[31m \U2605 \x1B[0m node: $(node -v)" >> ~/version.txt
echo "\x1B[31m \U2605 \x1B[0m yarn: $(yarn -v)" >> ~/version.txt
echo "\x1B[31m \U2605 \x1B[0m aws cli: $(aws --version)" >> ~/version.txt
echo "\x1B[31m \U2605 \x1B[0m docker: $(docker -v)" >> ~/version.txt
echo "\x1B[31m \U2605 \x1B[0m $(python3 --version)" >> ~/version.txt
echo "\x1B[31m \U2605 \x1B[0m $(go version)" >> ~/version.txt
echo "\x1B[31m \U2605 \x1B[0m $(rustc --version)" >> ~/version.txt
echo "\x1B[31m \U2605 \x1B[0m $(kubectl version)" >> ~/version.txt
echo "cat ~/logo.txt" >> ~/.bashrc
echo "echo -e $(cat ~/version.txt)" >> ~/.bashrc