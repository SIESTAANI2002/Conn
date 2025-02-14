FROM python:3.9.7-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev
RUN sudo add-apt-repository ppa:savoury1/ffmpeg4
RUN sudo apt full-upgrade
RUN apt -qq install -y mediainfo
COPY . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
