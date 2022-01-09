FROM codercom/code-server:4.0.1 as cs
FROM node:lts-bullseye-slim

ENV PASSWORD Thinh0220
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-transport-https \ 
	ca-certificates \
	curl \
	git \
	vim \
	build-essential \
	python3 \
	python3-pip

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
RUN chmod +x /setup/10-codeserver.sh
RUN ./setup/10-codeserver.sh

# install awscli
RUN pip install awscli

# install rust
COPY ./setup/30-rust.sh /setup/30-rust.sh
RUN chmod +x /setup/30-rust.sh
RUN ./setup/30-rust.sh

# copy code-server settings.json
COPY ./config/settings.json /root/.local/share/code-server/User/settings.json

# copy bash configure
COPY ./config/.bashrc /etc/bash.bashrc

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]