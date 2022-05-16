# Dockerfile for working with Jupyter notebooks 
FROM python:3.9-slim-buster

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app
RUN pip install -r requirements.txt
COPY . /opt/app

WORKDIR /home/notebooks
 
COPY . .
EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook","--ip=0.0.0.0","--allow-root", "--no-browser"]
