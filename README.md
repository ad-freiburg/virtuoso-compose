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

Loading a Full Freebase RDF Dump
--------------------------------
**Note this part is work in progress and there will be additional cleanup steps
needed**
To load a full Freebase Dump the following steps are necessary. This part is
based on the instructions
[here](https://github.com/sameersingh/nlp_serde/wiki/Virtuoso-Freebase-Setup)

First change `virtuoso/virtuoso.ini` so it doesn't download the binary virtuoso
data and in `docker-compose.yaml` change the `volume` part of virtuoso to use
the `virtuoso-full-db` path. Then

    # docker-compose up -d --build virtuoso
    # docker-compose exec virtuoso bash
    root@XYZ# isql
    SQL> ld_dir('/input/', 'freebase-rdf-latest', 'http://freebase.com');
    SQL> select * from DB.DBA.load_list; # check if it registered
    SQL> rdf_loader_run();
