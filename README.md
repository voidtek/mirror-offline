# Offline mirror

## Description

## Requirement

- Docker
- Docker-compose

## Usage

With docker-compose
```bash
$ docker-compose up
```

## Development

Helping cmd
```
$ docker run -it -e PLUGIN_WEBSITE="http://www.google.com" -v html:/tmp wget-website:latest
```
