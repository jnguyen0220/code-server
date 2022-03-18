FROM codercom/code-server:4.1.0 as cs
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
	golang \
	python3-pip \
	python3-venv

# copy bash configure
COPY ./config/.bashrc /etc/bash.bashrc

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# install docker
COPY ./setup/10-docker.sh /setup/10-docker.sh
RUN . ./setup/10-docker.sh

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
COPY ./setup/20-codeserver.sh /setup/20-codeserver.sh
RUN . ./setup/20-codeserver.sh

# install awscli
RUN pip install awscli

# copy code-server settings.json
COPY ./config/settings.json /root/.local/share/code-server/User/settings.json

# alias
COPY ./setup/30-alias.sh /setup/30-alias.sh
RUN . ./setup/30-alias.sh

# Copy Logo
COPY ./setup/logo.txt /root/logo.txt

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]