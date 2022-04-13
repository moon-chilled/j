0&T.@'' ::] ^:_'' NB.eat all the cores
NPAR=. 1 T.''

a0=: i.4 1e8
a1=: i.1e8 4
a2=. i.1e9

peach0=: >@: ((t.'')"_1)
peach1=: {{ > ([: u {&y) t.''"_1 i.#y }}
prankb=: {{ par=. NPAR <. #y
 c=. (#y) <.@% par          NB.chunk size
 d=. c*i.par                NB.drops, see also +/\par#c
 t=. (c#~<:par) , c+par|#y  NB.takes, last of which may be oversized
 ([: u"n {&t {. {&d }. y"_) t.''"_1 i.par }}
NB. todo:
NB. when 0{$y is short and n is deeper than _1, parallelise along further axes
NB. also, niceties:
NB. - should be ambivalent
NB. - should do the right thing for "_
NB. - should take advantage of more parallelism than n permits by looking at u b.0
prank=: ;@:prankb
peach2=: prank _1

bslash=: {{
 if. x<0 do.  NB.nonoverlapping
  x=. |x
  rs=. (#y) >.@% x  NB.result size
  par=. NPAR <. rs
  rc=. rs <.@% par  NB.result chunk
  c=. rc * x
  d=. c*i.par
  t=. (c#~<:par) , c+par|#y
  ; ((-x) u\ {&t {. {&d }. y"_) t.''"_1 i.par
 else.        NB.overlapping; left as an exercise to the reader
  'nyi' assert 0
 end. }}

monoid=: 2 :'x u y NB.MONOID'

slash0=: {{ par=. NPAR <. #y
 NB. annoying; no late binding for non-verbs
 if. -. u`'' -:&(0&{@,@>) + monoid 0 `'' do.
  u/y return. end.
 id=. 1{::^:3,>u
 u=. (0{1{::,>u`'') `:6  NB. pull out actual verb to take advantage of SC
 if. 0-:#y do. id return. end.
 c=. (#y) <.@% par
 d=. c*i.par
 t=. (c#~<:par) , c+par|#y
 > u&.>/ ([: u/ {&t {. {&d }. y"_) t.''"_1 i.par }}

slash1=: {{ par=. NPAR <. 2 <.@%~ #y
 NB. annoying; no late binding for non-verbs
 if. -. u`'' -:&(0&{@,@>) + monoid 0 `'' do.
  u/y return. end.
 id=. 1{::^:3,>u
 u=. (0{1{::,>u`'') `:6  NB. pull out actual verb to take advantage of SC
 if. 0-:#y do. id return. end.
 c=. (#y) <.@% par
 d=. c*i.par
 t=. (c#~<:par) , c+par|#y
 y=. >([: u/ {&t {. {&d }. y"_) t.''"_1 i.par
 u monoid id slash2^:(1~:#) y }}
