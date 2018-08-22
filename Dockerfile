FROM node:8.9

RUN apt-get update -qqy \
  && apt-get install -qqy \
    ca-certificates \
    gnupg2 \
    build-essential \
    mongodb \
    default-jre \
    zip \
    unzip \
    curl \
    gnupg \
    xvfb \
    python-pip \
    libpython-dev \
    --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.3.3"

RUN yarn global add npm

RUN /bin/bash -l -c "gem install dpl"

RUN pip install -U pip

RUN pip install awscli
