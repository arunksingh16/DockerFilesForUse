FROM centos:7.8.2003
LABEL owner=singh.arunk16@hotmail.com)
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo
RUN yum update -y && yum install -y wget curl powershell which dos2unix unzip libtool perl-core zlib-devel azure-cli libicu openssl openssl-devel && yum install -y java-1.8.0-openjdk-headless && yum clean all
ARG KUBE_VER=v1.18.0
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBE_VER}/bin/linux/amd64/kubectl && chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && mv /kustomize /usr/bin
ARG HELM_VER=v3.2.4
RUN curl -LO "https://get.helm.sh/helm-${HELM_VER}-linux-amd64.tar.gz"
RUN tar -xzf helm-${HELM_VER}-linux-amd64.tar.gz && mv linux-amd64/helm /usr/local/bin/helm && chmod +x /usr/local/bin/helm && rm -rf linux-amd64
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum install jq -y

CMD ["bash"]