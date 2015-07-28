FROM python:2-onbuild
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update --fix-missing \
    && apt-get install -y python-setuptools python-pip python-dev libxslt1-dev\
    && apt-get install -y libxml2-dev libz-dev libffi-dev libssl-dev

### Supervisor

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD . /var/www/sentry

RUN pip install -r /var/www/sentry/requirements.txt

VOLUME /var/www/sentry/src

ENV SENTRY_CONF=/var/www/sentry/src/sentry.conf.py
ENV C_FORCE_ROOT=true

ENV PORT 80
EXPOSE 80

WORKDIR /var/www/sentry
CMD env | grep _ >> /etc/environment && supervisord -c /etc/supervisor/conf.d/supervisord.conf
