FROM ubuntu:16.04
RUN apt-get update && apt-get install -y build-essential autotools-dev autoconf automake unzip \
    wget net-tools libtool git flex bison gawk m4 libreadline-dev openssl crudini gperf libssl-dev
# Mount point for integrating data volumes
RUN mkdir /data
RUN mkdir /source
RUN mkdir /app

# Build/Install virtuoso
RUN git clone --branch stable/7 --depth 1 https://github.com/openlink/virtuoso-opensource.git /source/
WORKDIR /source
RUN ./autogen.sh && ./configure --prefix=/app/
RUN make -j && make install

COPY virtuoso.ini start-virtuoso.sh /app/
WORKDIR /app/
EXPOSE 8999
CMD ["/app/start-virtuoso.sh"]

