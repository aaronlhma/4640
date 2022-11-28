FROM ubuntu

RUN apt-get update -y && apt-get install -y default-mysql-client wget

WORKDIR /startup
RUN wget -qq https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /startup/wait-for-it.sh

COPY startup.sh startup.sh

RUN chmod +x startup.sh && chmod +x wait-for-it.sh

ENTRYPOINT ["bash", "/startup/startup.sh"]

