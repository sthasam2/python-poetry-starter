# Python Poetry Starter

This is a starter project for Python projects using [Poetry](https://python-poetry.org/).

## Getting Started

### Prerequisites

- [Python](https://www.python.org/) (3.10 or higher)
- [Poetry](https://python-poetry.org/) (`pip install poetry`)

### Installation

1. Clone this repository

2. Install dependencies

    Make sure to have poetry installed and run the following command:

    ```sh
    poetry install
    ```

3. Setup pre-commit hooks

    ```sh
    poetry run pre-commit install
    ```

## Pre-commit hooks

This project uses [pre-commit](https://pre-commit.com/) to run some checks before committing changes.

To run the checks manually, run the following command:

```sh
poetry run pre-commit run -a
```

This checks all the files in the project and fixes them if possible.

It uses the installed pre-commit hooks described in the configuration file `.pre-commit-config.yaml` using locally installed dependencies

### Available hooks

[x] [pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks)  
    - [x] trailing_whitespace_fixer  
    - [x] debug_statement_hook  
    - [x] requirements_txt_fixer  
[x] [black](https://github.com/psf/black)  
[x] [isort](https://github.com/timothycrosley/isort)  
[x] [mypy](https://github.com/python/mypy)  
[x] [flake8](https://github.com/pycqa/flake8)  
    - [x] [flake8-bugbear](https://github.com/PyCQA/flake8-bugbear)  
    - [x] [flake8-comprehensions](https://github.com/adamchainz/flake8-comprehensions)  
    - [x] [flake8-implicit-str-concat](https://github.com/flake8-implicit-str-concat/flake8-implicit-str-concat)  
    - [x] [pep8-naming](https://github.com/PyCQA/pep8-naming)  
    - [x] [flake8-bandit](https://bandit.readthedocs.io/en/latest/plugins/index.html#complete-test-plugin-listing)  
    - [x] [flake8-eradicate](https://github.com/wemake-services/flake8-eradicate)  
    - [x] [flake8-print](https://github.com/jbkahn/flake8-print)  
