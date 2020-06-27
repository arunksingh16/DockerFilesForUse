# webdriver-manager - A selenium server and browser driver manager for your end to end tests.
# chromedriver - ChromeDriver for Selenium
# selenium-webdriver - The official WebDriver JavaScript bindings from the Selenium project
# protractor - Webdriver E2E test wrapper for Angular.
# selenium - Selenium in an npm package
FROM centos:centos7
USER root
RUN yum update -y; yum-builddep -y python; yum -y install curl libicu make java-1.8.0-openjdk java-1.8.0-openjdk-devel postgresql-devel gcc \
 libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel \
 libxslt-devel libxml2-devel python-devel openssl openssl-devel; yum clean all
ARG NODEJS_VERSION="12.x"
RUN curl -sL https://rpm.nodesource.com/setup_${NODEJS_VERSION} | bash -
RUN yum install -y nodejs
RUN npm install -g npm
RUN npm i -g elm-github-install --unsafe-perm=true --allow-root
RUN npm install --save -g appium --unsafe-perm=true --allow-root
RUN npm install --save -g chromium --unsafe-perm=true --allow-root
RUN npm install -g protractor  && npm install webdriver-manager 
RUN npm install --save chromedriver selenium selenium-webdriver --unsafe-perm=true --allow-root
RUN npm install webdriver-manager update
RUN npm install --save -g geckodriver --unsafe-perm=true --allow-root
#RUN npm install geckodriver

CMD ["/bin/bash"]
