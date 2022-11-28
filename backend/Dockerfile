FROM python:3

USER root

RUN useradd -m -d /app backend

WORKDIR /app

USER backend

RUN wget -qq https://github.com/timoguic/acit4640-py-mysql/archive/refs/heads/master.zip -O /tmp/source.zip \
    && unzip /tmp/source.zip \
    && cp -r acit4640-py-mysql-master/backend /app/src \
    && rm -rf acit4640-py-mysql-master \
    && wget -qq https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /app/src/wait-for-it.sh

RUN pip3 install -r /app/src/requirements.txt

WORKDIR /app/src

COPY script.sh script.sh

USER root
RUN chmod +x script.sh && chmod +x wait-for-it.sh

USER backend
EXPOSE 8080

# custom script goes here
ENTRYPOINT [ "bash", "/app/src/script.sh" ]

# full gunicorn command goes here
CMD [ "/app/.local/bin/gunicorn", "wsgi:app", "-b", "0.0.0.0:8080" ]