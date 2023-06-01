:- use_module(library(http/http_server)).
:- use_module(library(format)).

:- use_module(handlers/post).

:- use_module('../postgresql-prolog/postgresql').

:- initialization(main).

main :-
    portray_clause(diario(2.0, "Adrián Arroyo Calle")),
    connect("postgres", "postgres", '127.0.0.1', 5432, "postgres", Connection),
    http_listen(9099, [
        get(Slug, post_handler(Connection, Slug))
    ]),
    halt.
