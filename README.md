# Ouipharma Docker Workspace

## Get started

### Clone the workspace repository

```
git clone https://github.com/recodable/ouipharma.git
```

### Clone the codebase repository as code/

```
cd ouipharma # go into the workspace that you previously cloned
git clone git@github.com:Ouibiz/ouipharma.git code # clone the codebase inside the workspace directory as code/
```

### Docker up!

Inside the workspace

```
docker-compose up
```

This is going to set up a progreSQL container and a Ruby container for our app

### Set up development database

We make sure that database is created and the schema is set

⚠️: might need to check the container name depending of your setup (to check the containers' name, run: `docker ps`)
```
docker exec -it ouipharama_web_1 bin/rails db:create
docker exec -it ouipharama_web_1 bin/rails db:schema:load
```

## Additional info

### Run a RoR command

⚠️: might need to check the container name depending of your setup (to check the containers' name, run: `docker ps`)

```
docker exec -it ouipharama_web_1 bin/rails
```
