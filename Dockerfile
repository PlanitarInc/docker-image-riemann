FROM planitar/base

RUN apt-get install -y curl supervisor && apt-get clean
RUN apt-get install -y ruby ruby-dev build-essential openjdk-6-jre && apt-get clean

RUN mkdir -p /opt/riemann && \
    curl http://aphyr.com/riemann/riemann-0.2.6.tar.bz2 | \
    tar -xjvf - --strip-components 1 -C /opt/riemann

ADD riemann/riemann.config /opt/riemann/etc/riemann.config
ADD riemann-dash/contrib.rb /opt/riemann/riemann-dash/contrib.rb
ADD supervisor/ /etc/supervisor/conf.d

# RUN gem install riemann-client riemann-tools riemann-dash
RUN gem install riemann-dash
#  RUN gem install riemann-client riemann-tools

EXPOSE 5555 5556 4567
CMD exec supervisord -n
