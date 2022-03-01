#!/bin/bash

docker-compose up -d
docker-compose exec web rails assets:precompile