FROM codercom/code-server:latest as cs
FROM ubuntu:22.04

# Set environment
ENV YARN_VERSION=1.22.19
ENV GO_VERSION=1.20.3

RUN apt-get update && apt-get install -y --no-install-recommends \
	sudo \
	tini \
	gpg \
	apt-transport-https \
	openssh-client \
	apt-transport-https \ 
	ca-certificates \
	cargo \
	curl \
	git \
	vim \
	build-essential \
	python3 \
	python3-pip \
	python3-venv

# install awscli
RUN pip install awscli --extra-index-url https://piwheels.org/simple

# install kubectl
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# install kubens & kubectx
RUN git clone https://github.com/ahmetb/kubectx /opt/kubectx
RUN ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
RUN ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# install code-server
COPY --from=cs /usr/bin/code-server /usr/bin/code-server
COPY --from=cs /usr/lib/code-server /usr/lib/code-server
RUN ln -s /usr/local/lib/code-server/code-server /usr/local/bin/code-server

# install code-server extensions
COPY ./setup/10-copy-codeserver.sh /setup/10-copy-codeserver.sh
RUN . ./setup/10-copy-codeserver.sh

# install Nodejs and Yarn
COPY ./setup/20-install-nodejs-yarn.sh /setup/20-install-nodejs-yarn.sh
RUN . ./setup/20-install-nodejs-yarn.sh

# install Docker cli
COPY ./setup/30-install-docker-cli.sh /setup/30-install-docker-cli.sh
RUN . ./setup/30-install-docker-cli.sh

# install golang
COPY ./setup/40-install-golang.sh /setup/40-install-golang.sh
RUN . ./setup/40-install-golang.sh

ENV USER_NAME=beyond
ENV GROUP_NAME=power
ENV HOME_DIR=/home/$USER_NAME

RUN groupadd -g 1000 $GROUP_NAME && useradd -rm -d $HOME_DIR -s /bin/bash -g $GROUP_NAME -G sudo -u 1000 $USER_NAME
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY /config /config
RUN chmod +x /config/init.sh

RUN cp /config/.bashrc /root/.bashrc

COPY /startup /startup

ENTRYPOINT ["tini","--","/config/init.sh"]

USER $USER_NAME
WORKDIR $HOME_DIR