FROM centos:centos7
LABEL \
    test_image=aks
USER root
RUN yum update -y; yum-builddep -y python; yum -y install curl libicu make java-1.8.0-openjdk java-1.8.0-openjdk-devel postgresql-devel gcc \
 libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel \
 libxslt-devel libxml2-devel python-devel openssl openssl-devel; yum clean all
ARG NODEJS_VERSION="12.x"
RUN curl -sL https://rpm.nodesource.com/setup_${NODEJS_VERSION} | bash -
RUN yum install -y nodejs
RUN npm install -g npm
RUN npm install --save -g elm-github-install --unsafe-perm=true --allow-root
RUN npm install --save -g appium --unsafe-perm=true --allow-root
RUN npm install --save -g chromium --unsafe-perm=true --allow-root
RUN npm install --save -g protractor  && npm install webdriver-manager 
RUN npm install --save chromedriver selenium-webdriver --unsafe-perm=true --allow-root
RUN npm install webdriver-manager update
RUN npm install --save -g geckodriver --unsafe-perm=true --allow-root

CMD ["/bin/bash"]
