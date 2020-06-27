FROM centos/nodejs-12-centos7:12
USER root
RUN yum update -y; yum-builddep -y python; yum -y install curl libicu make java-1.8.0-openjdk java-1.8.0-openjdk-devel postgresql-devel gcc \
 libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel \
 libxslt-devel libxml2-devel python-devel openssl openssl-devel; yum clean all

RUN yum install -y nodejs
RUN npm install -g npm
RUN npm install -g protractor  && npm install webdriver-manager 
RUN npm install --save chromium chromedriver selenium-webdriver
RUN npm install webdriver-manager update
RUN npm install geckodriver

CMD ["/bin/bash"]
