# based on Nikola Dev Container
FROM ubuntu:20.10

# Installing required packages
RUN apt-get update -y \
    && apt-get install --no-install-recommends -y \
    gnupg \
    build-essential \
    vim \
    git \
    curl \
    cmake \
    wget \
    sudo \
    iputils-ping \
    ssh \
    python-dev \
    python-setuptools \
    python3-pip \
    unzip \
    jq \
    tree \
    maven \
    bash-completion \
    apt-transport-https \
    software-properties-common \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Installing Additional PIP based libraries
RUN pip install awscli \
    six \
    docker \
    httpie \
    python-bash-utils \
    pywinrm \
    xmltodict \
    pyOpenSSL==16.2.0 

# Kubernetes Tools : kubectl, kubectx, and kubens
ENV KUBECTL_VER 1.19.2
RUN wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx -O /usr/local/bin/kubectx && chmod +x /usr/local/bin/kubectx
RUN wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -O /usr/local/bin/kubens && chmod +x /usr/local/bin/kubens
RUN wget https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VER/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# Installing Helm
ENV HELM_VERSION 3.5.0
RUN wget https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz -O /tmp/helm-v$HELM_VERSION-linux-amd64.tar.gz && \
    tar -zxvf /tmp/helm-v$HELM_VERSION-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm

# Setting WORKDIR and USER 
ARG OC_VERSION=4.5
RUN curl -sLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v$(echo $OC_VERSION | cut -d'.' -f 1)/clients/oc/$OC_VERSION/linux/oc.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /tmp/ && \
    mv /tmp/oc /usr/local/bin/ && \
    rm -rf /tmp/oc.tar.gz && \
    rm -rf /tmp/kubectl

ENV KUSTOMIZE_VERSION 3.9.3
RUN curl -sLo /tmp/kustomize.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz && \    
    tar xzvf /tmp/kustomize.tar.gz -C /usr/local/bin/ && \
    rm -rf /tmp/kustomize.tar.gz

CMD ["bash"]
