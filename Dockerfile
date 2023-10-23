############################
# Stage 1: Base Stage
############################
FROM python:3.12.0-alpine3.18 as base

# create user and group
RUN addgroup -g 1000 -S users
RUN adduser -S user -u 1000 -G users



############################
# Stage 2: Builder Stage
############################

FROM base as builder

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install poetry

ENV VIRTUAL_ENV=/opt/venv

RUN python -m venv ${VIRTUAL_ENV}

ENV PATH=${VIRTUAL_ENV}/bin:$PATH \
    POETRY_VIRTUALENVS_CREATE=0 \
    POETRY_INSTALLER_MAX_WORKERS=10 \
    POETRY_NO_INTERACTION=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

COPY pyproject.toml poetry.lock ./

RUN --mount=type=cache,id=poetry,target=${POETRY_CACHE_DIR} \
    poetry install --no-root --without dev -vv



############################
# Stage 3: Dev Dependencies
############################
FROM builder as devdeps
WORKDIR /app

ENV VIRTUAL_ENV=/opt/venv
ENV PATH=${VIRTUAL_ENV}/bin:$PATH \
    POETRY_VIRTUALENVS_CREATE=0 \
    POETRY_INSTALLER_MAX_WORKERS=10 \
    POETRY_NO_INTERACTION=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

RUN --mount=type=cache,target=${POETRY_CACHE_DIR} poetry install --no-root --only dev -vv



############################
# Stage 4: Dev Stage
############################
FROM devdeps as development
WORKDIR /home/development/app

ENV VIRTUAL_ENV=/opt/venv \
    PATH=${VIRTUAL_ENV}/bin:$PATH \
    PYTHONUNBUFFERED=1

COPY --chown=user:users . .

# Change user
USER user

# entrypoint
CMD ["sleep","infinity"]



############################
# Stage 5: Prod Stage
############################
FROM base as production

WORKDIR /app

ENV VIRTUAL_ENV=/opt/venv

COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}
COPY --chown=user:users . .

ENV PATH=${VIRTUAL_ENV}/bin:$PATH \
    PYTHONUNBUFFERED=1

# Change user
USER user

# entrypoint
CMD ["sleep","infinity"]
