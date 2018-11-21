FROM ubuntu:18.04
RUN apt-get update && apt-get install -y varnish

COPY varnish.vcl run_varnish.sh /app/
RUN chmod +x /app/run_varnish.sh

ENV BACKEND_HOST=virtuoso
ENV BACKEND_PORT=8999
WORKDIR /app/
EXPOSE 9000
CMD ["/app/run_varnish.sh"]

