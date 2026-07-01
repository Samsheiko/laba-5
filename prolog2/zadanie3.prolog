member_set(X, [X|_]).
member_set(X, [_|Tail]) :- 
    member_set(X, Tail).

make_set([], []).
make_set([H|T], Result) :-
    member_set(H, T), !,
    make_set(T, Result).
make_set([H|T], [H|Result]) :-
    make_set(T, Result).

intersection_set([], _, []).
intersection_set([H|T], B, [H|Result]) :-
    member_set(H, B), !,
    intersection_set(T, B, Result).
intersection_set([_|T], B, Result) :-
    intersection_set(T, B, Result).

union_set(A, B, Result) :-
    append(A, B, Combined),
    make_set(Combined, Result).

verify_distributive(A, B, C) :-
    union_set(B, C, BU_C),
    intersection_set(A, BU_C, LeftPartRaw),
    make_set(LeftPartRaw, LeftPart),

    intersection_set(A, B, A_cap_B),
    intersection_set(A, C, A_cap_C),
    union_set(A_cap_B, A_cap_C, RightPartRaw),
    make_set(RightPartRaw, RightPart),
    
    equivalent_sets(LeftPart, RightPart),
    write('Левая часть: '), write(LeftPart), nl,
    write('Правая часть: '), write(RightPart), nl,
    write('Закон выполняется!').

equivalent_sets(S1, S2) :-
    subset_of(S1, S2),
    subset_of(S2, S1).

subset_of([], _).
subset_of([H|T], S) :-
    member_set(H, S),
    subset_of(T, S).
