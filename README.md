# Ouipharma Docker Workspace

## Get started

### Clone the workspace repository

```bash
git clone https://github.com/recodable/ouipharma.git
```

### Clone the codebase repository as code/

```bash
cd ouipharma # go into the workspace that you previously cloned
git clone git@github.com:Ouibiz/ouipharma.git code # clone the codebase inside the workspace directory as code/
```

### Docker up!

Inside the workspace

```bash
docker-compose up
```

This is going to set up a progreSQL container and a Ruby container for our app

### Set up development database

First, update your RoR `config/database.yml`:

```yaml
local: &local
  # TODO: change username
  username: postgres

  # TODO: change password
  password: password

  # TODO: point to db host, this is valid as docker-compose manage the local network and point `db` to our postgresql container
  host: db

  # The TCP port the server listens on. Defaults to 5432.
  # If your server runs on a different port number, change accordingly.
  port: 5432

  # ...
  
development:
  <<: *default
  <<: *local
  database: ouipharma_development

# ...
```

Then we create set up the database

⚠️: might need to check the container name depending of your setup (to check the containers' name, run: `docker ps`)
```bash
docker exec -it ouipharama_web bin/rails db:create
docker exec -it ouipharama_web bin/rails db:schema:load
docker exec -it ouipharma_web bin/rails db:seed # optional
```


## Additional info

### Run a RoR command

⚠️: might need to check the container name depending of your setup (to check the containers' name, run: `docker ps`)

```bash
docker exec -it ouipharama_web bin/rails
```
