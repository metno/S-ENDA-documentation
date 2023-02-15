FROM ubuntu:22.04

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    rm /etc/apt/apt.conf.d/docker-clean && \
    apt-get update && \
    apt-get install -qy --no-install-recommends make graphviz plantuml python3-pip

RUN --mount=type=cache,target=/root/.cache/pip \ 
    python3 -m pip install pdm

WORKDIR /senda

COPY pyproject.toml pdm.lock ./
RUN --mount=type=cache,target=/root/.cache/pdm \
    pdm install --no-self

COPY source/ source/

COPY Makefile .
ENTRYPOINT ["/bin/sh", "-c", "pdm run make html && exec $0 $@"]
EXPOSE 8000
CMD ["python3", "-m", "http.server", "--directory", "build/html"]
