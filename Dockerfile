FROM centos:centos7

RUN yum update -y
RUN yum install -y yum-utils
RUN yum install -y curl wget hostname
RUN yum install -y git

RUN yum groupinstall -y 'Development Tools'

RUN curl -sL https://rpm.nodesource.com/setup_5.x | bash -

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN wget https://get.rvm.io -O /tmp/rvm-installer.sh && chmod +x /tmp/rvm-installer.sh
RUN /tmp/rvm-installer.sh --version latest stable
RUN bash -l -c 'rvm gemset install bundler'
RUN bash -l -c 'rvm gemset install rake'

ADD Rakefile /tmp/app/Rakefile
ADD Gemfile /tmp/app/Gemfile
#ADD package.json /tmp/app/package.json
#ADD bower.json /tmp/app/bower.json
#ADD .bowerrc /tmp/app/.bowerrc

RUN bash -l -c 'pushd /tmp/app && rake init_docker && popd'
