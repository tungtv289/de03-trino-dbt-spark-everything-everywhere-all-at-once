include .env

build:
	docker compose build

up:
	docker-compose --env-file .env up -d

down:
	docker-compose --env-file .env down

restart:
	make down && make up

to_mysql:
	docker exec -it de_mysql mysql --local-infile=1 -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" brazillian_ecommerce

to_mysql_root:
	docker exec -it de_mysql mysql -u"root" -p"${MYSQL_ROOT_PASSWORD}"

to_psql:
	docker exec -ti de_psql psql postgres://admin:admin123@de_psql:5432/postgres



POSTGRES_HOST=de_psql
POSTGRES_PORT=5432
POSTGRES_DB=postgres
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin123
POSTGRES_HOST_AUTH_METHOD=trust