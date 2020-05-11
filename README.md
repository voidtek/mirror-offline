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
$ docker run \
    -e PLUGIN_WEBSITE="https://www.google.com" \
    -e PLUGIN_USER="" \
    -e PLUGIN_PASSWORD="" \
    -e PLUGIN_MIRROR="http://localhost/" \
    -v "html:/tmp" \
    wget-website:latest
```
