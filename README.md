# Rails Event Driven Apps with RabbitMQ

## Setup

To make it easy to setup and run the project, I recommend the use of docker. With docker installed
follow the following instructions to setup and run the project.

1- First step will be to clone the project locally:

```sh
git clone https://github.com/psantos10/rails-events-driven-apps.git [OPTIONAL DIRECTORY NAME]
```

2- Navigate into the new directory, and there start up the containers:

```bash
cd rails-events-driven-apps
```

```bash
docker-compose up -d
```

3- Make sure, all containers are running:

```bash
docker-compose ps
```

At the stage only the migration containers will be stoped. Other services should be running and you can
access each service as follow:

Note that the Contractor App will be accessible on PORT 3001 and MAnager App on PORT 3002.
You can check and change access ports on docker-compose.yml file.

> - Contractor App: http://localhost:3001
> - Contractor Sidekiq: http://localhost:3001/sidekiq
> - Manager App: http://localhost:3002
> - RabbitMQ Dashboard: http://localhost:16572

## How it works

Using The `Contractor App` you will be able to request payments to the `Manager App`. Payments between 500.00 and 2500.00 will be automatically accepted by the `Manager App`; Payments between 2500.01 and 5000 will require Manual Processing; Other values will be automatically rejected.

With the `Manager App` you will be able to visualize
all requested payments and they status. You will be also able to manually approve or reject pending requests.
