0!:0<'lisp.ijs'
assert 6 = en ev (intern'+') cons ((intern'-') cons 8 cons 5 cons 0j1) cons 3 cons 0j1
assert 1 = en ev (intern'if') cons ((intern'symbolp') cons ((intern'quote') cons (intern'blep') cons 0j1) cons 0j1) cons 1 cons 2 cons 0j1
assert 6 = en ev ((intern'lambda') cons (0j1 cons~ intern'x') cons ((intern'+') cons 1 cons (intern'x') cons 0j1) cons 0j1) cons 5 cons 0j1
'f' de en ev ((intern'lambda') cons (0j1 cons~ intern'x') cons (((intern'lambda') cons (0j1 cons~ intern'y') cons ((intern'+') cons (intern'x') cons (intern'y') cons 0j1) cons 0j1) cons 0j1)) cons 5 cons 0j1
'g' de en ev ((intern'lambda') cons (0j1 cons~ intern'x') cons (intern'x') cons 0j1)
z =. #conses
GC en
assert z > #conses
'ff' de en ev intern'f'
assert (intern't') = en ev (intern'eq') cons (intern'f') cons (intern'ff') cons 0j1
assert 7 = en ev (intern'if') cons ((intern'functionp') cons (intern'f') cons 0j1) cons 7 cons 2 cons 0j1
assert 11 = en ev (en lu~ intern'f') cons 6 cons 0j1
assert 333 = en ev (en lu~ intern'g') cons 333 cons 0j1
en ev (intern'def') cons (intern'x') cons ((intern'cons') cons 5 cons 6 cons 0j1) cons 0j1
assert 6 = en ev (intern'cdr') cons (intern'x') cons 0j1
en ev (intern'rplacd') cons (intern'x') cons 7 cons 0j1
assert 7 = en ev (intern'cdr') cons (intern'x') cons 0j1
en ev (intern'set') cons (intern'x') cons 14 cons 0j1
assert 14 = en ev intern'x'
GC en
assert 5 = ca 5 cons 7
GC en
GC en
x =. 5 cons 7
y =. 6 cons 9
assert 5 = ca x

echo fm en
