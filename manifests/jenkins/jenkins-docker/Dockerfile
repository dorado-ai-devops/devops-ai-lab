FROM jenkins/jenkins:lts

USER root


RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash


RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    jq \
    yq \
    unzip \
    tar \
    gzip \
    bash \
    coreutils \
    net-tools \
    iputils-ping \
    dnsutils \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*


RUN pip3 install --no-cache-dir tiktoken

USER jenkins
