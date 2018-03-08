FROM ubuntu:16.04
RUN apt-get update && apt-get install -y varnish 
RUN mkdir /app

COPY varnish.vcl /app/
WORKDIR /app/
EXPOSE 9000
CMD ["/usr/sbin/varnishd", "-a", "0.0.0.0:9000", "-f", "/app/varnish.vcl",\
     "-F", "-n", "/app", "-s", "malloc,10G", "-p", "http_resp_size=10000000",\
     "-p", "http_req_size=1000000", "-p", "http_resp_hdr_len=1000000",\
     "-p", "http_req_hdr_len=1000000"]

