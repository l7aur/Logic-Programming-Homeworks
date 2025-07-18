:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, 9), maplist(length_list(9), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_different, Rows),
        transpose(Rows, Columns), maplist(all_different, Columns),
        Rows = [A,B,C,D,E,F,G,H,I],
        blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
		maplist(labeling([ff]), Rows).

length_list(L, Ls) :- length(Ls, L).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        all_different([A,B,C,D,E,F,G,H,I]),
        blocks(Bs1, Bs2, Bs3).
		
problem(1, P) :- % shokyuu
        P = [[1,_,_,8,_,4,_,_,_],
             [_,2,_,_,_,_,4,5,6],
             [_,_,3,2,_,5,_,_,_],
             [_,_,_,4,_,_,8,_,5],
             [7,8,9,_,5,_,_,_,_],
             [_,_,_,_,_,6,2,_,3],
             [8,_,1,_,_,_,7,_,_],
             [_,_,_,1,2,3,_,8,_],
             [2,_,5,_,_,_,_,_,9]].


problem(2, P) :-  % shokyuu
        P = [[_,_,2,_,3,_,1,_,_],
             [_,4,_,_,_,_,_,3,_],
             [1,_,5,_,_,_,_,8,2],
             [_,_,_,2,_,_,6,5,_],
             [9,_,_,_,8,7,_,_,3],
             [_,_,_,_,4,_,_,_,_],
             [8,_,_,_,7,_,_,_,4],
             [_,9,3,1,_,_,_,6,_],
             [_,_,7,_,6,_,5,_,_]].

problem(3, P) :-
        P = [[1,_,_,_,_,_,_,_,_],
             [_,_,2,7,4,_,_,_,_],
             [_,_,_,5,_,_,_,_,4],
             [_,3,_,_,_,_,_,_,_],
             [7,5,_,_,_,_,_,_,_],
             [_,_,_,_,_,9,6,_,_],
             [_,4,_,_,_,6,_,_,_],
             [_,_,_,_,_,_,_,7,1],
             [_,_,_,_,_,1,_,3,_]].
			 
problem(4, P) :-
        P = [[4,_,_,_,_,_,5,_,_],
             [_,_,3,_,_,_,7,_,_],
             [5,9,_,2,_,7,_,_,6],
             [1,_,_,_,8,3,_,_,_],
             [_,_,_,6,_,1,_,_,_],
             [_,_,_,7,4,_,_,_,1],
             [9,_,_,4,_,6,_,7,5],
             [_,_,7,_,_,_,4,_,_],
             [_,_,2,_,_,_,_,_,3]].
