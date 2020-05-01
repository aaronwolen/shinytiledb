# Shiny Server with TileDB-R

This Dockerfile is based on:
* [`rocker/shiny`](https://hub.docker.com/r/rocker/shiny)
* [`eddelbuettel/rocker-tiledb`](https://hub.docker.com/r/eddelbuettel/rocker-tiledb)

Build the image

```
docker build -t shinytiledb .
```

Run the example app with `docker-compose`

```
docker-compose up
```