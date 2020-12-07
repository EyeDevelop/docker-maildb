FROM mariadb:latest

COPY scripts/* /usr/local/bin/
COPY setup_db.sql /docker-entrypoint-initdb.d/

COPY pre-entrypoint.sh /
ENTRYPOINT ["/pre-entrypoint.sh"]

CMD ["mysqld"]
