r=: <:10000x^30103
NB.t=. <:2x^400000
NB.r and t have similar magnitude.  2 is the machine's base; 10000 is j's base

t=: <. 48 (| (([: <: 2 ^ [) , (<:2^48) #~ ]) <.@%~) 400000 NB. need <.; why is int^int not an int?
M=: <.2^48
bp=: {{ 
 {{ c=. y>:M
    y=. y-c*M
    y=. y+1|.c_: }}^:_ x+y }}
bp2=: {{ (] (1&|.@] + [ - M * ]) >:&M)^:_ x+y }}
bp3=: (] (1&|.@] + [ - M * ]) >:&M)^:_ &: +

NB.'+~r' %&timex 'bp~t'
NB.
NB.tt=: ([ + (<.2^48) * ])/ x: |. bp~t
NB.tt2=: +~<:2x^400000
NB.tt = tt2

NB.u=. t-0,|.i.<:#t NB. pathological case
u=: 1,~0#~<:#t
