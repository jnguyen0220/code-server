# jnguyen0220/Code-Server

## Purpose

Prebuild docker code server image with code server extension, language runtime and applications

## VS Code Extension

- ms-python.python
- humao.rest-client
- golang.go
- eamodio.gitlens
- vscode-icons-team.vscode-icons
- rust-lang.rust
- adamhartford.vscode-base64

## Runtime and Applications

- vs-code - 1.72.1
- code-server - 4.8.3
- git node - v19.0.1
- yarn - 1.22.18
- aws cli - aws-cli/1.27.8 Python/3.10.6 Linux/5.15.0-52-generic botocore/1.29.8
- docker - Docker version 20.10.21, build baeda1f
- python - Python 3.10.6
- go - go version go1.18 linux/amd64
- rust - rustc 1.61.0
- kubectl - Client Version: version.Info{Major:"1", Minor:"25", GitVersion:"v1.25.4", GitCommit:"872a965c6c6526caa949f0c6ac028ef7aff3fb78", GitTreeState:"clean", BuildDate:"2022-11-09T13:36:36Z", GoVersion:"go1.19.3", Compiler:"gc", Platform:"linux/amd64"}
  Kustomize Version: v4.5.7
  Server Version: version.Info{Major:"1", Minor:"25", GitVersion:"v1.25.3", GitCommit:"434bfd82814af038ad94d62ebe59b133fcb50506", GitTreeState:"clean", BuildDate:"2022-11-07T07:39:12Z", GoVersion:"go1.19.3", Compiler:"gc", Platform:"linux/amd64"}

## Build

docker build -t jnguyen0220/code-server .

## Run

docker run -p 8080:8080 -e PASSWORD='welcome1' -d jnguyen0220/code-server

## Requirements

Docker runtime

## Demo

password: welcome1\
[https://smallware.tplinkdns.com/guest/login/](https://smallware.tplinkdns.com/guest/login/)
