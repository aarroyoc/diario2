default:
	echo "Not available yet"

psql-up:
	docker-compose up postgres -d

run-local:
	scryer-prolog main.pl

get-deps:
	rm -rf postgresql-prolog
	git clone --depth 1 --branch v1.0.0 https://github.com/aarroyoc/postgresql-prolog
	rm -rf teruel
	git clone --depth 1 --branch v1.0.1 https://github.com/aarroyoc/teruel
	
