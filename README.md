# A Python Django Example App in Dev Containers

## Introduction

GitHub.com offers a way to deploy an application in Docker Container on the Microsoft Azure Cloud.
This example app illustrates how to do that by deploying a Python Django Example Webapp.

## GitHub DevContainer with GitHub Codespaces

GitHub Codespaces is the service to create a container development environment on the Microsoft Azure Cloud.
To do so one need to define the environment with a file `devcontainer.json` in folder `.devcontainer`.

## Dev Container Definition File

This the definition file for the Dev Containers.
Please read the [Dev Container documentation](https://containers.dev/implementors/json_reference/) to know more about the keywords involved.

```
{
  "name": "Python Django Example App in DevContainer",
  "dockerComposeFile": "../docker-compose.yml",
  "service": "web",
  "workspaceFolder": "/workspaces/${localWorkspaceFolderBasename}",

  "containerEnv": {
    "VIRTUAL_ENV": "/workspaces/${localWorkspaceFolderBasename}/.venv",
    "PATH": "/workspaces/${localWorkspaceFolderBasename}/.venv/bin:${localEnv:PATH}"
  },

  "settings": {
    "sqltools.connections": [{
    "name": "Container database",
    "driver": "PostgreSQL",
    "previewLimit": 50,
    "server": "python-django-example-app-in-devcontainer_db_1",
    "port": 5432,
    "database": "postgres",
    "username": "postgres",
    "password": "postgres"
    }]
  },

  "extensions": [
    "ms-python.python",
    "mtxr.sqltools",
    "mtxr.sqltools-driver-pg"
  ],

  "forwardPorts": [8000, 5432],

  "postCreateCommand": "poetry run python3 django_example_app/manage.py runserver 0.0.0.0:8000" 
}
```

### Keyword `name`

A name for the Dev Container.

### Keyword `dockerComposeFile`

You can specify a Docker Compose file to be executed to spin up the containers.

### Keyword `service`

Specify a container to conect to once the app is running when a Docker Compose file is given.

### Keyword `workspaceFolder`

Set the path to open in when connecting to the container.

### Keyword `containerEnv`

A set of name-value pairs that sets environment variables for the container.
Please note that the environment variables in the Docerfile and Docker Compose file are not available here and need to be given as well.

### Keyword `settings`

Defines basis settings in the Dev Container.
Here we use it to configure the SQL tools used in the Dev Container.

### Keyword `extensions`

Defines which extensions to load into the Dev Container.
Here we use the Python and PostgreSQL database extensions.

### Keyword `forwardPorts`

An array of port numbers that should be forwarded from inside the primary container to the local machine.
Here we expose the ports 8000 for the Python Django app and 5432 for the PostgreSQL database.

### Keyword `postCreateCommand`

A command to be executed once the Dev Containers are created.
Please note that it is not enough to define an ENTRYPOINT for a container in the Dockerfile.
Here we start the Python Django app built-in webserver.

## Run Dev Container

Go to the GitHub.com project, click on thhe "Code" button, choose the "Codespaces" tab, click "Create codespace on main" button.
Wait until all is created and a web Visual Studio Code IDE version is launched.
Click on the "ports" tab and open URL for port 8000 in a browser.
Enjoy the Python Django Example App.
