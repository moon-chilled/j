NB. not entirely sure about the transposed representation?
NB. should be able to apply wp to the entire screenful of coordinates (possibly transposed), not just "1.  Haven't thought about the ideal way to do that yet
vecs=: 4 3 2$ 0 0.5  0.3 0.3  0.5 0   0.5 0  0.7 0.3  1 0.5   1 0.5  0.7 0.7  0.5 1   0.5 1  0.3 0.7  0 0.5
vecs=: 0.25+0.5*vecs
'vx vy'=: |:vecs
abc=. (0&{ + 2&{ - 2 * 1&{) , (2 * 1&{ - 0&{) ,: 0&{
'xa xb xc'=: abc vx   NB. todo handle case where p0/1/2 are evenly spaced, so a is 0
'ya yb yc'=: abc vy   NB. need to arrange for result -c/b.  Should also do the optimization that drops a mul
sample_y=: {{ yc + y * yb + y * ya }}
sample_x=: {{ xc + y * xb + y * xa }}
slug=: |.#:16b2e74

wp=. {{)m
 'x y'=. y
 d=. (*:xb) - 4 * xa * xc - x
 s=. (2*xa) %~ (-xb) (+,.-) %:|d       NB. | prevents complex results; they will be filtered regardless
 r=. (d>:0) *. y > sample_y s
 r=. r *. (2 {. }.&slug)"1 0 +/2 4 8 * vx < x
 0 ~: -/+/|:r }}

NB. try: ' #' {~ 100 100 $ wp"1]100 %~ 100 100 #: i. 1e4
