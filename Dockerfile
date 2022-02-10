FROM codercom/code-server:4.0.1 as cs
FROM node:lts-bullseye-slim

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-transport-https \ 
	ca-certificates \
	curl \
	git \
	vim \
	build-essential \
	python3 \
	python3-pip \
	python3-venv

# copy bash configure
COPY ./config/.bashrc /etc/bash.bashrc

# install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
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
COPY ./setup/10-codeserver.sh /setup/10-codeserver.sh
RUN sh -x ./setup/10-codeserver.sh

# alias
COPY ./setup/20-alias.sh /setup/20-alias.sh
RUN sh -x ./setup/20-alias.sh

# install awscli
RUN pip install awscli

# install rust
COPY ./setup/30-rust.sh /setup/30-rust.sh
RUN sh -x ./setup/30-rust.sh

# install docker
COPY ./setup/40-docker.sh /setup/40-docker.sh
RUN sh -x ./setup/40-docker.sh

# install golang
COPY ./setup/50-golang.sh /setup/50-golang.sh
RUN sh -x ./setup/50-golang.sh

# copy code-server settings.json
COPY ./config/settings.json /root/.local/share/code-server/User/settings.json

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]