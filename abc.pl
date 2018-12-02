vogal(a).
vogal(e).
vogal(i).
vogal(o).
vogal(u).

consoante(b).
consoante(c).
consoante(d).
consoante(f).
consoante(g).
consoante(r).
consoante(j).
consoante(k).
consoante(l).
consoante(m).
consoante(n).
consoante(p).
consoante(q).
consoante(r).
consoante(s).
consoante(t).
consoante(v).
consoante(w).
consoante(x).
consoante(y).
consoante(z).

frases([],[]).
frases([X|Xs],[A|B]) :- print(X), palavra(X,A),frases(Xs,B).


palavra([],[]).
palavra([X|Xs],[C|D]) :-print(X), silaba(X,C),palavra(Xs,D).


silaba([X|Xs],[X|[Xs|[p|Xs]]]) :- print(X), consoante(X).

silaba([X|Xs],[X|[p|[X|Xs]]]) :-vogal(X).
