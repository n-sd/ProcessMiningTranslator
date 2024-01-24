

    event(a0;a1;a2;a3;a4;a5;a6;a7;a8;a9;a10;a11;a12;a13;a14;a15).
    fluent(started(E)) :- event(E).
    fluent(completed(E)) :- event(E).
    time(1..30).

    % definitions
    initiates(E, started(E), T) :- happens(E,T), event(E), time(T).
    terminates(E, started(E1), T) :- happens(E,T), holdsAt(started(E1),T), event(E), time(T).
    initiates(E, completed(E1), T) :- happens(E,T), holdsAt(started(E1), T), event(E), time(T).

    holdsAt(F,T) :- happens(E,T1), initiates(E,F,T1), not stoppedIn(T1,F,T), T1<T, time(T), time(T1).
    stoppedIn(T1,F,T2) :- happens(E,T), T1<T, T<T2, terminates(E,F,T), time(T), time(T1), time(T2).

    % complements
    predecesor(E1, E2, T) :- happens(E1,T1), happens(E2, T), T1 = (T-1), time(T), time(T1), event(E1), event(E2).
    another(E, T1, T2) :- happens(E, T), T1 < T, T < T2, time(T), time(T1), time(T2), event(E).
    bbetween(E1, E2, T) :- happens(E1, T1), happens(E2, T2), happens(E2, T), not another(E1, T1, T), T1 < T2, T2 < T, time(T), time(T1), time(T2), event(E1), event(E2).
    
    % restrictions

    :- happens(E, T), happens(E1, T), event(E), event(E1), E != E1.


    :- happens(a5,T), not predecesor(a1,a5,T), time(T).
:- happens(a8,T), not predecesor(a5,a8,T), time(T).
:- happens(a2,T), not 1 {predecesor(a8,a2,T); predecesor(a4,a2,T)}.
:- happens(a3,T), not predecesor(a2,a3,T), time(T).
:- happens(a6,T), not predecesor(a3,a6,T), time(T).
:- happens(a4,T), not 1 {predecesor(a9,a4,T); predecesor(a6,a4,T)}.
:- happens(a11,T), not predecesor(a6,a11,T), time(T).
:- happens(a9,T), not predecesor(a6,a9,T), time(T).



% sequence

happens(a1,1).
happens(a5,2).
happens(a8,3).
happens(a2,4).
happens(a3,5).
happens(a6,6).
happens(a4,7).
happens(a2,8).
happens(a3,9).
happens(a6,10).
happens(a4,11).
happens(a2,12).
happens(a3,13).
happens(a6,14).
happens(a4,15).
happens(a2,16).
happens(a3,17).
happens(a6,18).
happens(a11,19).
