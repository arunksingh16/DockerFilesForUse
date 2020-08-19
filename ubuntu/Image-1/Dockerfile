FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y ca-certificates wget curl gnupg2 openjdk-8-jre unzip
# Chrome Browser
ARG CHROME_VERSION=84.0.4147.89-1
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
	&& apt-get update -qqy \
	&& apt-get -qqy install google-chrome-stable=$CHROME_VERSION \
	&& rm /etc/apt/sources.list.d/google-chrome.list \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
	&& sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome
# Chrome Driver
ARG CHROME_DRIVER_VERSION=84.0.4147.30
RUN wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip \
	&& unzip /tmp/chromedriver.zip -d /opt \
	&& rm /tmp/chromedriver.zip \
	&& mv /opt/chromedriver /opt/chromedriver-$CHROME_DRIVER_VERSION \
	&& chmod 755 /opt/chromedriver-$CHROME_DRIVER_VERSION \
	&& ln -s /opt/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver
# Kustomize
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && mv /kustomize /usr/bin
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk && apt-get autoclean
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
# Gecko and Mozilla
ARG GECKO_VER=v0.26.0
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl firefox && rm -fr /var/lib/apt/lists/*  && curl -L https://github.com/mozilla/geckodriver/releases/download/${GECKO_VER}/geckodriver-${GECKO_VER}-linux64.tar.gz | tar xz -C /usr/local/bin \
 && apt-get purge -y ca-certificates curl && chmod +x /usr/local/bin/geckodriver
RUN apt-get update && apt-get -y upgrade && apt-get install -y ca-certificates curl && update-ca-certificates
CMD ["/bin/bash"]
