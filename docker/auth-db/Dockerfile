ARG POSTGRESQL
FROM postgres:${POSTGRESQL}
COPY ./sql/dump.sql /docker-entrypoint-initdb.d/dump.sql