#############################
#                           #
#       BUILD STAGE         #
#                           #
#############################

FROM python:3.11-bullseye as builder

WORKDIR /app

RUN pip install poetry

COPY poetry.lock pyproject.toml ./

ENV POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_INSTALLER_MAX_WORKERS=10 \
    POETRY_NO_INTERACTION=1 

RUN --mount=type=cache,target=/root/.cache/poetry \
    poetry install --no-dev --no-root -vv 

CMD ["sleep", "infinity"]

