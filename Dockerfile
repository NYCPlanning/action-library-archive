FROM nycplanning/library:ubuntu-pluto_templates

RUN curl -sSL https://install.python-poetry.org | python3 -

# ENV PATH="~/.poetry/bin:$PATH"

# ENV PATH="~/.local/bin:$PATH"

ENV PATH="${PATH}:/root/.poetry/bin"

WORKDIR /library/
RUN poetry export -f requirements.txt --output requirements.txt;\
    pip install -r requirements.txt



COPY script.py script.py

CMD ["python3", "script.py"]