FROM alpine:3.8
MAINTAINER Konstantin Radostev <konstantin_rados@mail.ru>

#Python3
RUN apk add npm \
&& apk add --no-cache python3 \
&& python3 -m ensurepip \
&& rm -r /usr/lib/python*/ensurepip \
&& pip3 install --upgrade pip setuptools \
&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
&& if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
&& rm -r /root/.cache

#Git
RUN apk add git \
&& git clone https://github.com/Cakemanator/student-exam2

#Run app
CMD cd student-exam2 \
&& pip install -e . \
&& export FLASK_APP=js_example \
&& flask run --host=0.0.0.0
