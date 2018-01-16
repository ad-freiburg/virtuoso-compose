Virtuoso + Varnish + Freebase for Aqqu
======================================
This repository contains a Docker Compose recipe for running Virtuoso + Varnish
on Freebase for use with Aqqu.

Launch
------
Make sure you have Docker and Docker Compose set up on your machine. If it is
not set up see [here](https://docs.docker.com/compose/install/).

Also make sure your user is in the `docker` group.

Then in the checked out repository run:
```bash
docker-compose up -d # '-d' daemonizes, leave away to run interactively
```

You can stop a running instance with
```bash
docker-compose down
```

and show instances via
```bash
docker-compose ps
```

For some more tips you may find this
[cheatsheet](https://devhints.io/docker-compose) helpful.

it should take care of setting up containers as well as downloading the
necessary data.

To view the log run
```bash
docker-compose logs -f
```
