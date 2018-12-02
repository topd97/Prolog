artigoM([o | S]-S).
artigoM([um | S]-S).

artigoF([a | S]-S).
artigoF([uma | S]-S).

adjetivoF([branca | S]-S).
adjetivoF([bonita | S]-S).

adjetivoM([bom | S]-S).
adjetivoM([branco | S]-S).

substantivoM([bolo | S]-S).
substantivoM([carro | S]-S).

substantivoF([caixa | S]-S).
substantivoF([surpresa | S]-S).

verbo([contem | S]-S).
toBe([é | S]-S).


pronomeM([ele | S]-S).
pronomeM([eles | S]-S).

pronomeF([ela | S]-S).
pronomeF([elas | S]-S).


pronome([eu | S]-S).
pronome([tu | S]-S).
pronome([nós | S]-S).
pronome([vós | S]-S).

artigo(S) :- artigoM(S).
artigo(S) :- artigoF(S).

substantivo(S) :- substantivoM(S).
substantivo(S) :- substantivoF(S).

adjetivo(S) :- adjetivoM(S).
adjetivo(S) :- adjetivoF(S).

/*
sentenca(S-S0) :- frase_nominal(S-S1), frase_verbal(S1-S0).

frase_nominal(S-S0) :- artigo(S-S1), frase_nominal2(S1-S0).
frase_nominal(S) :- frase_nominal2(S).

frase_nominal2(S-S0) :- adjetivo(S-S1), frase_nominal2(S1-S0).
frase_nominal2(S-S0) :- substantivo(S).

frase_verbal(S) :- verbo(S).
frase_verbal(S-S0) :- verbo(S-S1), frase_nominal(S1-S0).
*/

sentenca(S) :- nominalF(S-S1), predicadoF(S1-[]).
sentenca(S) :- nominalM(S-S1), predicadoM(S1-[]).
sentenca(S) :- nominal(S-S1), predicado(S1-[]).

nominalF(S-S0) :- artigoF(S-S1), adjSubF(S1-S0).
nominalF(S) :- adjSubF(S).

adjSubF(S-S0) :- adjetivosF(S-S1), nucleosujeitoF(S1-S2), adjetivosF(S2-S0).
adjSubF(S-S0) :- adjetivosF(S-S1), nucleosujeitoF(S1-S0).
adjSubF(S-S0) :- nucleosujeitoF(S-S1), adjetivosF(S1-S0).
adjSubF(S) :- nucleosujeitoF(S).

adjetivosF(S-S0) :- adjetivoF(S-S1), adjetivosF(S1-S0).
adjetivosF(S) :- adjetivoF(S).

nucleosujeitoF(S) :- substantivoF(S).
nucleosujeitoF(S) :- pronomeF(S).

predicadoF(S-S0):- verbo(S-S1), nominalF(S1-S0).
predicadoF(S-S0):- toBe(S-S1), adjetivoF(S1-S0).


nominalM(S-S0) :- artigoM(S-S1), adjSubM(S1-S0).
nominalM(S) :- adjSubM(S).

adjSubM(S-S0) :- adjetivosM(S-S1), nucleosujeitoM(S1-S2), adjetivosM(S2-S0).
adjSubM(S-S0) :- adjetivosM(S-S1), nucleosujeitoM(S1-S0).
adjSubM(S-S0) :- nucleosujeitoM(S-S1), adjetivosM(S1-S0).
adjSubM(S) :- nucleosujeitoM(S).

adjetivosM(S-S0) :- adjetivoM(S-S1), adjetivosM(S1-S0).
adjetivosM(S) :- adjetivoM(S).

nucleosujeitoM(S) :- substantivoM(S).
nucleosujeitoM(S) :- pronomeM(S).

predicadoM(S-S0):- verbo(S-S1), nominalM(S1-S0).
predicadoM(S-S0):- toBe(S-S1), adjetivoM(S1-S0).



nominal(S-S0) :- artigo(S-S1), adjSub(S1-S0).
nominal(S) :- adjSub(S).

adjSub(S-S0) :- adjetivos(S-S1), nucleosujeito(S1-S2), adjetivos(S2-S0).
adjSub(S-S0) :- adjetivos(S-S1), nucleosujeito(S1-S0).
adjSub(S-S0) :- nucleosujeito(S-S1), adjetivos(S1-S0).
adjSub(S) :- nucleosujeito(S).

adjetivos(S-S0) :- adjetivo(S-S1), adjetivos(S1-S0).
adjetivos(S) :- adjetivo(S).

nucleosujeito(S) :- substantivo(S).
nucleosujeito(S) :- pronome(S).

predicado(S-S0):- verbo(S-S1), nominal(S1-S0).
predicado(S-S0):- toBe(S-S1), adjetivo(S1-S0).

