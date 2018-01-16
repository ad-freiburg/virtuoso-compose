FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install -y build-essential autotools-dev autoconf automake unzip \
    wget net-tools libtool git flex bison gawk m4 libreadline-dev openssl crudini gperf libssl-dev
# Mount point for integrating data volumes
RUN mkdir /data
RUN mkdir /source
RUN mkdir /app

# Build/Install virtuoso
RUN git clone https://github.com/openlink/virtuoso-opensource.git /source/
WORKDIR /source
RUN git checkout stable/7 && ./autogen.sh && ./configure --prefix=/app/
RUN make -j && make install

COPY virtuoso.ini start-virtuoso.sh /app/
WORKDIR /app/
EXPOSE 8999
CMD ["/app/start-virtuoso.sh"]

