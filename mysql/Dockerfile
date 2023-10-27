FROM mysql:5.7

LABEL maintainer="gin8 <gediminas.gineitis@gmail.com>"

COPY my.cnf /etc/mysql/conf.d/my.cnf
COPY run.sh /run.sh

RUN chmod 755 /run.sh

CMD ["/run.sh"]

EXPOSE 3306
