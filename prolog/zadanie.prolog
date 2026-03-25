sum_digits(N, S) :-
    A is N // 100,
    B is (N // 10) mod 10,
    C is N mod 10,
    S is A + B + C.

start :-
    write('Enter number (e.g. 123.): '),
    read(X),
    (   integer(X), X >= 100, X =< 999 ->
        sum_digits(X, Sum),
        Otn is X / Sum,
        write('Sum: '), write(Sum), nl,
        write('Otn: '), write(Otn), nl
    ;   write('Error! Use 3-digit number.'), nl
    ).

:- start.

