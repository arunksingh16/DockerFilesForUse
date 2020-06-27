# webdriver-manager - A selenium server and browser driver manager for your end to end tests.
# chromedriver - ChromeDriver for Selenium
# selenium-webdriver - The official WebDriver JavaScript bindings from the Selenium project
# protractor - Webdriver E2E test wrapper for Angular.
# selenium - Selenium in an npm package
FROM centos:centos7
LABEL com.buildx.version="0.0.1-beta"
LABEL com.buildx.release-date="2020-06-27"
USER root
RUN yum update -y; yum-builddep -y python; yum -y install curl libicu make java-1.8.0-openjdk java-1.8.0-openjdk-devel postgresql-devel gcc \
 libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel \
 libxslt-devel libxml2-devel python-devel openssl openssl-devel; yum clean all
ARG NODEJS_VERSION="12.x"
RUN curl -sL https://rpm.nodesource.com/setup_${NODEJS_VERSION} | bash -
RUN yum install -y nodejs
RUN npm install -g npm
RUN npm install -g protractor  && npm install webdriver-manager 
RUN npm install --save appium chromium chromedriver selenium selenium-webdriver geckodriver --unsafe-perm=true --allow-root
RUN npm install webdriver-manager update
#RUN npm install geckodriver

CMD ["/bin/bash"]
