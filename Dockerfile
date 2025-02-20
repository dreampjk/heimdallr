FROM python:3.12.3-slim
WORKDIR /app

RUN adduser --disabled-password --gecos '' appuser

RUN pip install poetry && poetry config virtualenvs.create false

# dependencies
COPY pyproject.toml poetry.lock ./
RUN poetry install --no-dev

USER appuser
COPY heimdallr ./heimdallr
COPY main.py ./

CMD ["python", "main.py"]