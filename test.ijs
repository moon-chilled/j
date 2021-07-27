0!:0<'lisp.ijs'
assert 6 = en ev (intern'+') cons ((intern'-') cons 8 cons 5 cons 0j1) cons 3 cons 0j1
assert 1 = en ev (intern'if') cons ((intern'symbolp') cons ((intern'quote') cons (intern'blep') cons 0j1) cons 0j1) cons 1 cons 2 cons 0j1
assert 6 = en ev ((intern'lambda') cons (0j1 cons~ intern'x') cons ((intern'+') cons 1 cons (intern'x') cons 0j1) cons 0j1) cons 5 cons 0j1
'f' de f =. en ev ((intern'lambda') cons (0j1 cons~ intern'x') cons (((intern'lambda') cons (0j1 cons~ intern'y') cons ((intern'+') cons (intern'x') cons (intern'y') cons 0j1) cons 0j1) cons 0j1)) cons 5 cons 0j1
'g' de g =. en ev ((intern'lambda') cons (0j1 cons~ intern'x') cons (intern'x') cons 0j1)
z =. #conses
GC en
assert z > #conses
assert 11 = en ev f cons 6 cons 0j1
assert 333 = en ev g cons 333 cons 0j1
echo fm en
