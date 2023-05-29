:- use_module(library(format)).

:- initialization(main).

main :-
    portray_clause(diario(2.0, "Adrián Arroyo Calle")),
    halt.
