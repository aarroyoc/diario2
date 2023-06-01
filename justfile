default:
	echo "Not available yet"

psql-up:
	docker-compose up postgres -d

get-deps:
	rm -rf postgresql-prolog
	git clone --depth 1 --branch v1.0.0 https://github.com/aarroyoc/postgresql-prolog
	
