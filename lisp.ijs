NB. nj0 is number n
NB. nj1 is symbol n.  0j1 is nil
NB. nj2 is cons n     I do not like this
NB. nj3 is builtin function n
NB. nj4 is user-defined function n.  (env . (parm . body))
NB. todo reader, better error messages
NB. todo macros? mutation? better gc?

t =: {:@+. : [: NB.type
c =: {.@+. : [: NB.content

syms =: 'nil';,'t'
intern =: {{
 i =. syms i. y=.<,y
 if. i = #syms do. syms =: syms , y end.
 i j.1
}}
sym_name =: {{>syms{~c y}}

conses =: i.0 2          NB. first col is car, second cdr
cons =: {{ (conses =: conses , x,y) ] 2 j.~#conses }}
ca =: {{conses{~<0,~c y}}
cd =: {{conses{~<1,~c y}}
ra =: {{x[conses=:x(<0,~c y)}conses}} NB. rplaca
rd =: {{x[conses=:x(<1,~c y)}conses}} NB. will this happen in place?
caa =: ca@ca
cad =: ca@cd
cda =: cd@ca
cdd =: cd@cd
cadd =: cad@cd
caddd =: cadd@cd
er =: {{'lisp'13!:8]255}}
la =: ''"_`(ca,$:@cd) @. (0j1&~:)

bf =: i.0 2      NB. content; arity
cb =: {{ bf {~ c y }}     NB. a function that, when applied to the argument list
nbf =: {{ (bf=:bf,y) ] 3 j.~#bf }}         NB. returns its length iff the function is willing to accept those args

fm =: ":`sym_name`('(',fm@ca,' . ',')',~fm@cd)`('<builtin ','>',~":@c)`('<lambda ','>',~":@c) @. t

en =: 0j1 NB.alist
de =: {{en =: en cons~ y cons~ intern x }}
(de intern)'nil'
(de intern)'t'
'cons'   de nbf cons/`2:
'car'    de nbf ca@{.`1:
'cdr'    de nbf cd@{.`1:
'symbolp'de nbf (1 j.~1&=@t@{.)`1:
'consp'  de nbf (1 j.~2&=@t@{.)`1:
'functionp'de nbf (1 j.~3 4&(e.~)@t@{.)`1:
'numberp'de nbf (1 j.~0&=@t@{.)`1:
'eq'     de nbf (1 j.~=/)`2:
'+'      de nbf +/   `#
'*'      de nbf */   `#
'/'      de nbf %~/@|.`(1&>.)
'-'      de nbf -~/@|.`(1&>.)

lu =: ($:cd)`([:cda]) @. ((2*0j1=])+(= caa)) NB. eg: en lu~ intern'nil'
sn =: intern@>"0'lambda';'if';'quote'
sv =: (0j2+(cons cd))`((ev cadd)`(ev caddd)@.(0j1=(ev cad)))`([:cad])`ap
al =: {{ b ev~e cons~ cons/"1 y,.~la p['e p b' =. la x }}
ap =: (ev ca) (er`er`er`{{(cb x)@.0 y}}`al @. ([:t[)) (ev"0 la@cd)
ev =: ]`(lu~)`(sv@.([:sn&i.@ca]))`]`] @. ([:t])

GC =: {{
 b =. 0 #~ # h =. (c conses) * p =. 2 4 e.~t conses
 b =. 1 (c y)} b
 b =. h {{ 1 (,y#x)} y}}^:_ b  NB.todo improve this.  Maybe maintain two bitmaps, one for elements that were just marked and one with all the markings, so performance is in the same computational ballpark as traditional tracing
 d =. +/\-.b
 conses =: tc - d{~c (tc=.b#conses)*.b#p
 en =: en - d{~c en }}
