FROM debian:buster
LABEL maintainer "nik0chan@hotmail.com"

RUN apt-get update \
  && apt-get install -y git python3 python3-pip git wget unzip \
  && python3 -m pip install distorm3 \
  && python3 -m pip install crypto \
  && git clone https://github.com/volatilityfoundation/volatility3.git \
  && cd ./volatility3/volatility3/symbols \
  && mkdir windows \
  && cd windows \ 
  && wget https://downloads.volatilityfoundation.org/volatility3/symbols/windows.zip \
  && unzip windows.zip \
  && mkdir ../linux \
  && cd ../linux \
  && wget https://downloads.volatilityfoundation.org/volatility3/symbols/linux.zip \
  && unzip linux.zip \ 
  && mkdir ../mac \ 
  && cd ../mac \ 
  && wget https://downloads.volatilityfoundation.org/volatility3/symbols/mac.zip \
  && unzip mac.zip \
  && rm -rf volatility3/.git \
  && apt-get -y remove --purge git \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x /volatility3/vol.py \
  && ln -s  /volatility3/vol.py /usr/bin/volatility \
  && mkdir evidencias 
  
VOLUME /evidencias

WORKDIR /volatility

