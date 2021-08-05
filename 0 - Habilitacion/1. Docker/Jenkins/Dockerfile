FROM jenkinsci/blueocean:1.24.7
USER root

# Update apk repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install the latest Docker and docker-compose binaries
RUN apk -U --no-cache \
	--allow-untrusted add \
    wget \
    docker \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN mv ./kubectl /usr/local/bin/kubectl
RUN chown jenkins:jenkins /usr/local/bin/kubectl
RUN chmod 755 /usr/local/bin/kubectl

USER jenkins