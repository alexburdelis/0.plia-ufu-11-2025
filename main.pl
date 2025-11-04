resolve(S) :-
	S = money(_,_,_,_,_),
    %O homem que investiu R$ 5 mil está em algum lugar à direita do homem de Amarelo
    valor(A, "5k"),
    em_algum_lugar_a_direita(A, B, S),
    camiseta(B, amarelo),

%Caio está em algum lugar entre o amigo de camiseta Verde e o amigo que investiu em LCA, nessa ordem.
    nome(C, caio),
    entre(C, D, E, S),
    camiseta(D, verde),
    investimento(E, lca),
     
%O Bancário está na segunda posição.
    profissao(F, bancario),
    segunda_pos(F, S),
   
%O Programador está ao lado de quem fez um investimento com 6 anos de prazo.
	profissao(G, programador),
    ao_lado(G, H, S),
    prazo(H, 6),
    
%O homem de camiseta Branca investiu em LCI.
    camiseta(I, branca),
    investimento(I, lci),
    
%O amigo que investiu com um prazo de 3 anos está exatamente à esquerda de quem investiu em LCA.
	prazo(J, 3),
    exatamente_a_esquerda(J, K, S),
    investimento(K, lca),
    
%Na quarta posição está quem fez um investimento com prazo de 2 anos.
    quarta_pos(L, S),
    prazo(L, 2),
   
%Bernardo investiu R$ 10 mil.
	valor(M, "10k"),
    nome(M, bernardo),
    
%O homem que investiu R$ 15 mil está em algum lugar à direita do homem de camiseta Vermelha.
	valor(N, "15k"),
    camiseta(O, vermelha),
    em_algum_lugar_a_direita(N, O, S),
    
%O investidor de camiseta Branca está em algum lugar entre o investidor de Verde e o Wagner, nessa ordem.
	entre(I, D, P, S),
    nome(P, wagner),
    
%O amigo que investiu em Ações está ao lado do amigo que fez um investimento de R$ 20 mil.
    ao_lado(Q, R, S),
    investimento(Q, acoes),
    valor(R, "20k"),
    
%O Programador está na terceira posição.
    terceira_pos(G, S),
    
%O Bancário está exatamente à esquerda de quem fez um investimento com prazo de 3 anos.
    exatamente_a_esquerda(F, J, S),
    prazo(J, 3),
    
%Ícaro está exatamente à direita de quem investiu em CDB.
	exatamente_a_direita(U, V, S),
    nome(U, icaro),
    investimento(V, cdb),
    
%Quem investiu R$ 10 mil planeja ter retorno no prazo de 4 anos.
	prazo(M, 4),
    
%O dono do maior investimento está na terceira posição.
	valor(G, "25k"),
    
%O amigo que investiu em CDB está ao lado de quem fez um investimento com o menor prazo.
	ao_lado(V, L, S),
    
%Caio está na segunda posição.
	segunda_pos(W, S),
    nome(W, caio),
    
%Wagner está ao lado do homem de camiseta Branca.
	ao_lado(P, I, S),
    
%O Joalheiro está em algum lugar entre quem investiu R$ 10 mil e o Ator, nessa ordem.
	entre(X, M, Y, S),
    profissao(X, joalheiro),
    profissao(Y, ator),
    
%O amigo de camiseta Vermelha está em algum lugar à esquerda de quem investiu R$ 5 mil.
	em_algum_lugar_a_esquerda(O, A, S),
    
%O Joalheiro está na quarta posição.
    quarta_pos(X, S),

%fechamento
    algum_amigo(Z, S),
	camiseta(Z, azul),
    algum_amigo(A1, S),    
	nome(A1, marcelo),
    algum_amigo(A2, S),    
    investimento(A2, tesouro_direto),
    algum_amigo(A3, S),    
    prazo(A3, 5),
    algum_amigo(A4, S),
    profissao(A4, engenheiro).
    
    
	
camiseta(amigo(C,_,_,_,_,_),C).
nome(amigo(_,N,_,_,_,_),N).
investimento(amigo(_,_,I,_,_,_),I).
valor(amigo(_,_,_,V,_,_),V).
prazo(amigo(_,_,_,_,P,_),P).
profissao(amigo(_,_,_,_,_,P),P).

algum_amigo(X,money(X,_,_,_,_)).
algum_amigo(X,money(_,X,_,_,_)).
algum_amigo(X,money(_,_,X,_,_)).
algum_amigo(X,money(_,_,_,X,_)).
algum_amigo(X,money(_,_,_,_,X)).

em_algum_lugar_a_esquerda(X,Y,money(X,Y,_,_,_)).
em_algum_lugar_a_esquerda(X,Y,money(X,_,Y,_,_)).
em_algum_lugar_a_esquerda(X,Y,money(X,_,_,Y,_)).
em_algum_lugar_a_esquerda(X,Y,money(X,_,_,_,Y)).
em_algum_lugar_a_esquerda(X,Y,money(_,X,Y,_,_)).
em_algum_lugar_a_esquerda(X,Y,money(_,X,_,Y,_)).
em_algum_lugar_a_esquerda(X,Y,money(_,X,_,_,Y)).
em_algum_lugar_a_esquerda(X,Y,money(_,_,X,Y,_)).
em_algum_lugar_a_esquerda(X,Y,money(_,_,X,_,Y)).
em_algum_lugar_a_esquerda(X,Y,money(_,_,_,X,Y)).

em_algum_lugar_a_direita(X,Y,S) :-
    em_algum_lugar_a_esquerda(Y,X,S).

entre(M,I,F,money(I,M,F,_,_)).
entre(M,I,F,money(I,M,_,F,_)).
entre(M,I,F,money(I,M,_,_,F)).
entre(M,I,F,money(I,_,M,F,_)).
entre(M,I,F,money(I,_,M,_,F)).
entre(M,I,F,money(I,_,_,M,F)).
entre(M,I,F,money(_,I,M,F,_)).
entre(M,I,F,money(_,I,M,_,F)).
entre(M,I,F,money(_,I,_,M,F)).
entre(M,I,F,money(_,_,I,M,F)).

segunda_pos(X, money(_,X,_,_,_)).
terceira_pos(X, money(_,_,X,_,_)).
quarta_pos(X, money(_,_,_,X,_)).
           
exatamente_a_direita(X,Y,money(Y,X,_,_,_)).
exatamente_a_direita(X,Y,money(_,Y,X,_,_)).
exatamente_a_direita(X,Y,money(_,_,Y,X,_)).
exatamente_a_direita(X,Y,money(_,_,_,Y,X)).


exatamente_a_esquerda(X,Y,S) :-
    exatamente_a_direita(Y,X,S).

ao_lado(X,Y,S) :-
    exatamente_a_esquerda(X,Y,S);
    exatamente_a_esquerda(Y,X,S).




