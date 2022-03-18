#!/bin/bash
echo "alias kns='kubens'" >> ~/.bashrc
echo "alias kctx='kubectx'" >> ~/.bashrc
echo "alias kctl='kubectl'" >> ~/.bashrc
echo "alias kustomize='kubectl kustomize'" >> ~/.bashrc
echo "cat ~/logo.txt" >> ~/.bashrc
echo "echo 'Installed run times:'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m node - $(node -v)'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m yarn - $(yarn -v)'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m aws cli - $(aws --version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m docker - $(docker -v)'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m python - $(python3 --version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m go - $(go version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m rust - $(rustc --version)'" >> ~/.bashrc
echo "echo -e '\x1B[31m \U2605 \x1B[0m kubectl - $(kubectl version)'" >> ~/.bashrc
echo "echo" >> ~/.bashrc