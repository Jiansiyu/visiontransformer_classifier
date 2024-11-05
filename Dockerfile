FROM nvidia/cuda:12.4.0-base-ubuntu22.04

# disable interactive functions
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ffmpeg libsm6 libxext6

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-dev \
    python3-pip \
    git \
    build-essential \
    && python3 -m pip install --upgrade pip \
    && apt-get clean



# install python packages \
COPY requirements.txt /tmp/requirements.txt

RUN pip3 install --upgrade pip \
    && pip3 install -r /tmp/requirements.txt


WORKDIR /app