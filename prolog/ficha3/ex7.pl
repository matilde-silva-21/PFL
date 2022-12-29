%class(Course, ClassType, DayOfWeek, Time, Duration)

class(pfl, t, '1 Seg', 11, 1).
class(pfl, t, '4 Qui', 10, 1).
class(pfl, tp, '2 Ter', 10.5, 2).

class(lbaw, t, '1 Seg', 8, 2).
class(lbaw, tp, '3 Qua', 10.5, 2).

class(ltw, t, '1 Seg', 10, 1).
class(ltw, t, '4 Qui', 11, 1).
class(ltw, tp, '5 Sex', 8.5, 2).

class(fsi, t, '1 Seg', 12, 1).
class(fsi, t, '4 Qui', 12, 1).
class(fsi, tp, '3 Qua', 8.5, 2).

class(rc, t, '4 Qui', 8, 2).
class(rc, tp, '5 Sex', 10.5, 2).


/* (a) */
same_day(UC1, UC2) :-
    class(UC1, _, Day, _, _),
    class(UC2, _, Day, _, _).

/* (b) */

daily_courses(Day, Courses):-
    findall(Course, class(Course, _, Day, _, _), Courses).


/* (c) */

subgoal(Course, ClassType, DayOfWeek, Time, Duration) :-
    class(Course, ClassType, DayOfWeek, Time, Duration),
    Duration < 2.

short_classes(L):-
    findall(class(Course, ClassType, DayOfWeek, Time, Duration), subgoal(Course, ClassType, DayOfWeek, Time, Duration), L).

/* (d) */

course_classes(Course, Classes) :-
    findall(type_day_hour(Type, DayOfWeek, Time), class(Course, Type, DayOfWeek, Time, _), Classes).

/* (e) -- obrigada martim pela resposta */
courses(L) :-
    setof(Class,(Type,Day,Hour,Duration)^class(Class,Type,Day,Hour,Duration),L).
