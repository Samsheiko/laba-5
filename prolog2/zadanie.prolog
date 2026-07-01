sum_digits(0, 0) :- !.
sum_digits(N, S) :-
    N > 0,
    Tail is N // 10,
    Digit is N mod 10,
    sum_digits(Tail, RestSum),
    S is RestSum + Digit.

start :-
    write('Enter a 3-digit number (e.g. 123.): '),
    read(X),
    (   integer(X), X >= 100, X =< 999 ->
        sum_digits(X, Sum),
        Otn is X / Sum,
        write('Sum of digits: '), write(Sum), nl,
        write('Otnoshenie: '), write(Otn), nl
    ;   write('Error! Please enter a valid 3-digit number.'), nl
    ).

:- start.
