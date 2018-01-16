Virtuoso + Varnish + Freebase for Aqqu
======================================
This repository contains a Docker Compose recipe for running Virtuoso + Varnish
on Freebase for use with Aqqu.

Launch
------
Make sure you have Docker and Docker Compose set up on your machine. If it is
not set up see [here](https://docs.docker.com/compose/install/).

Then in the checked out repository run:
```bash
docker-compose up
```
it should take care of setting up containers as well as downloading the
necessary data.
