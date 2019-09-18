FROM jupyter/scipy-notebook:17aba6048f44

ARG NB_UID=1000
USER root

RUN apt-get update && apt-get install -y libhunspell-dev