:- module(post, [post_handler/4]).

:- use_module(library(http/http_server)).
:- use_module(library(lists)).
:- use_module(library(dcgs)).
:- use_module(library(format)).
:- use_module('../postgresql-prolog/postgresql').
:- use_module('../teruel/teruel').

query_by_slug([/|Slug], Query) :-
    phrase(format_("SELECT id, content, title, excerpt, date FROM post WHERE slug = '~s'", [Slug]), Query).

post_handler(Connection, Slug, Request, Response) :-
    query_by_slug(Slug, Query),
    query(Connection, Query, Data),
    Data = data(["id", "content", "title", "excerpt", "date"], [[Id, Content, Title, Excerpt, Date]]),
    http_status_code(Response, 200),
    render("templates/post.html", ["title"-Title, "content"-Content], Out),
    http_body(Response, text(Out)).
