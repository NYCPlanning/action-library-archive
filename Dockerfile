FROM nycplanning/library:ubuntu-pluto_templates

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_VERSION=1.1.6 python3 -

# ENV PATH="~/.poetry/bin:$PATH"

# ENV PATH="~/.local/bin:$PATH"

ENV PATH="${PATH}:/root/.poetry/bin"

COPY script.py script.py

CMD ["poetry", "run", "python", "script.py"]