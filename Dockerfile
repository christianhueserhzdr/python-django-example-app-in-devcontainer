FROM python:3.11.0-bullseye

LABEL maintainer="Christian Hueser <55481699+christianhueserhzdr@users.noreply.github.com>"

RUN mkdir -p /workspaces/python-django-example-app-in-devcontainer/

COPY . /workspaces/python-django-example-app-in-devcontainer/

WORKDIR /workspaces/python-django-example-app-in-devcontainer/

RUN pip install -U pip
ENV VIRTUAL_ENV=/workspaces/python-django-example-app-in-devcontainer/.venv
RUN python3 -m venv ${VIRTUAL_ENV}
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"
RUN pip install poetry
RUN poetry install

EXPOSE 8000

ENTRYPOINT [ "poetry", "run", "python3", "django_example_app/manage.py", "runserver", "0.0.0.0:8000" ]
