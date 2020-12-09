FROM continuumio/miniconda:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

COPY environment.yml /environment.yml
RUN conda env update -f environment.yml -n base

COPY scripts/* /

RUN chmod +x /*.sh

COPY . .

COPY app.py /app.py

EXPOSE 80
EXPOSE 443

ENV PROJECT_NAME template
ENV FLASK_APP app.py
ENV UWSGI_INI /app/uwsgi.ini

ENV STATIC_URL /static
ENV STATIC_PATH /static
ENV LISTEN_PORT 80


CMD [ "python", "app.py" ]