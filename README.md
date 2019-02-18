# Kineses Lite (Docker)

Kinesis Lite is a docker image for [Kinesalite](https://github.com/mhart/kinesalite) which provides a Node.js based implementation of [AWS Kinesis Streams](https://aws.amazon.com/kinesis/streams/). This can then be used in development and testing.

Based on the latest Node.js 8 (LTS) Alpine library image from Docker Hub.

Supports passing all options to Kinesalite (also see the [README](https://github.com/mhart/kinesalite/blob/master/README.md)):

```
$ docker run -p 4567:4567 danielnegri/kinesalite --help

Usage: kinesalite [--port <port>] [--path <path>] [--ssl] [options]

A Kinesis http server, optionally backed by LevelDB

Options:
--help                 Display this help message and exit
--port <port>          The port to listen on (default: 4567)
--path <path>          The path to use for the LevelDB store (in-memory by default)
--ssl                  Enable SSL for the web server (default: false)
--createStreamMs <ms>  Amount of time streams stay in CREATING state (default: 500)
--deleteStreamMs <ms>  Amount of time streams stay in DELETING state (default: 500)
--updateStreamMs <ms>  Amount of time streams stay in UPDATING state (default: 500)
--shardLimit <limit>   Shard limit for error reporting (default: 10)

Report bugs at github.com/mhart/kinesalite/issues
```

## Build locally

```
$ cd docker-kinesalite
$ docker build -t danielnegri/kinesalite .
```

## Run (will pull from Dockerhub)

```
# Default
$ docker run -d -p 4567:4567 danielnegri/kinesalite

# With additional options
$ docker run -d -p 4567:4567 danielnegri/kinesalite --shardLimit 5

# With persistent data
$ docker run -d -p 4567:4567 -v $PWD/data:/var/lib/kinesalite/data danielnegri/kinesalite --path /var/lib/kinesalite/data
```
