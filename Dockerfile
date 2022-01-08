FROM codercom/code-server as cs
FROM node:lts-bullseye-slim

ENV PASSWORD Thinh0220
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
	curl \
	git \
	vim \
	build-essential \
	python3 \
	python3-pip

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

# install awscli
COPY ./setup/30-rust.sh /setup/30-rust.sh
RUN chmod +x /setup/30-rust.sh
RUN ./setup/30-rust.sh

# copy code-server settings.json
COPY ./config/settings.json /root/.local/share/code-server/User/settings.json

# copy bash configure
COPY ./config/.bashrc /etc/bash.bashrc

# Volume for docker daemon
VOLUME /var/lib/docker

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
