# Stentle challenge

## Description
Create a page that displays a list of related products. More instructions can be found in the **instructions.pdf** file.

## How to
Install all dependencies: `docker-compose -f frontend-app/npm.yml run --rm install`

Build and serve the application (available at http://localhost:8080/): `docker-compose -f deployment/prod/docker-compose.yml up`

Spin up a development environment (available at http://localhost:1234/): `docker-compose -f deployment/dev/docker-compose.yml up`

When you are done, remember to run `docker-compose down`.
