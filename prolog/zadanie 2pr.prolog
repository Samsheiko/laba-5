% Считаем ненулевые элементы
count_nonzero([], 0).
count_nonzero([H|T], Count) :-
    count_nonzero(T, RestCount),
    (   H \= 0 -> Count is RestCount + 1
    ;   Count is RestCount
    ).

% Простой запуск
start :-
    nl, write('Enter list (e.g. [1,0,2].): '),
    read(L),
    count_nonzero(L, Result),
    nl, write('Non-zero elements: '), write(Result), nl.

% Автозапуск при загрузке
:- start.
