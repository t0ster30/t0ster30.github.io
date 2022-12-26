.nr PS 12	\" font size
.nr VS 15	\" vertical spacing
.nr PO 1.3i	\" left indent
.nr LL 11.5cm	\" line length
.nr FP -2cm	\" footer position
.nr t.i 2m	\" IP indentation
.nr t.pg 1	\" page numeration
.nr t.l 1	\" numbered lines in code block
.ds TX \\frT\\h’-.1667’\\v’.20’E\\v’-.20’\\h’-.125’X\\fP
.ds LX \\frL\\h’-.36’\\v’-.15’\s-2A\\s0\\h’-.15’\\v’.15’\\fP\*(TX
.de RT        \" reset
. fi
. ft r
. ff r -*
. ad pl
. ps \\n(PS
. vs \\n(VS
. ll \\n(LLu
. lt \\n(LLu
. po \\n(POu
. in \\n[t.in]u
. cl 0
..
.\" header and footer macros
.de pg	\" numerize pages
. ff r +tnum
. lt 6i+1n
. ie \\n[t.pg]=1 'tl '''\\s+3%\\s-3'
. el 'sp
..
.de HD	 \" page header (called by FT)
. ev t.ft
. RT
' sp 1.3cm
. ev
. ns
. keepbop
..
.de FT  \" page footer
. ev t.ft
. FP
' sp |\\n(.pu+\\n(FPu
. RT
' sp
. pg
' bp
. ev
. if \\n(.t==(\\n(.p+(\\n(FP)) .HD
..
.\" font styles --------------------
.de i \"-- italic font
\\$3\\fi\\$1\fp\\$2
..
.de b \"-- bold font
\\$3\\fb\\$1\fp\\$2
..
.de u \"-- underline
\\$3\\Z'\\$1'\v'.1'\\D'l \\w'\\$1'u 0'\\v'-.1'\\$2
..
.de r \"-- strikeout
\\$3\\Z'\\$1'\\v'-.23'\\D'l \\w'\\$1'u 0'\\v'.25'\\$2
..
.de bx \"-- box
. ie n \\fi\\$1\\fP
. el \\$3\\Z'\\$1'\\v'.1'\\D'l 0 -.9'\
\\v'.9'\\D'l \\w'\\$1'u 0'\
\\v'-.9'\\h'-\\w'\\$1'u 0'\\D'l \\w'\\$1'u 0'\
\\D'l 0 .9'\\v'-.1'\\$2
..
.de box
\\(br\\$*\\(br\\l'|0\\(rn'\\l'|0\\(ul'
..
.de p  \"-- paragraph
. RT
. sp .5
. ne 2
..
.de pp \"-- first-line indented paragraph
. p
. ti .5cm+\\n(PSp
..
.de ip \"-- indented paragraph
. p
. ie \\n(.$>1 .nr t.i \\$2
. el .nr t.i 2m
. in +\\n[t.i]u
\h'|-\\n[t.i]u'\\$1
. sp -1
..
.de xp \"-- backindented paragraph
. ip
. ti -\\n[t.i]u
..
.de hp \"-- hanging indent paragraph
. p
. mk
. ie \\n(.$>1 .po -\\$2
. el .po -\\w'\\$0'u
\\$1\~
. br
. po
. rt
..
.de qp \"-- quoted paragraph
. p
. in \\n[t.in]u+.5cm
. ll -.5cm
..
.de t \"-- title, author, & institution
. HD
. RT
. ps \\n(PS+7 \"6
. vs \\n(VS+6
. lt \\n(LLu
. tl '\\f(hd\\$*''\fr\s[10]\v'-.1'\n(dy.\?'\n(mo<10@0'\n(mo.20\n(yr\v'.1''
. RT
. sp .6v
. in 1m
. ps 9
. dv Author "@au"
. dv Instituition "@ins"
. dv Title "\\$*"
..
.de h \"-- header
. nr t.l 0
. RT
. sp .6
. if \\n(.$ \{\
\\fb\\$*
.  RT
. \}
. dv mark "\\$*" \\n(.% \\n(nl 1
. ns
..
.de @n
.if \\n(1T .sp 1
.nr NS \\$1
.if !\\n(.$ .nr NS 1
.if !\\n(NS .nr NS 1
.nr H\\n(NS +1
.if !\\n(NS-4 .nr H5 0
.if !\\n(NS-3 .nr H4 0
.if !\\n(NS-2 .nr H3 0
.if !\\n(NS-1 .nr H2 0
.if !\\$1 .if \\n(.$ .nr H1 1
.ds SN \\n(H1.
.ti \\n(.iu
.if \\n(NS-1 .as SN \\n(H2.
.if \\n(NS-2 .as SN \\n(H3.
.if \\n(NS-3 .as SN \\n(H4.
.if \\n(NS-4 .as SN \\n(H5.
..
.de n \"-- numbered header
. RT
. sp .25
. @n \\$1
\\fb\\*(SN \\$2
. RT
. ns
. dv mark "\\*(SN \\$2" \\n(.% \\n(nl \\$1
..
.de ab \"-- abstract
. p
. ce
\\fr\\s(22\\v'-5p'\\D'l .7P'\\v'5p'\\h'-1p'd\\h'-2p'l\\h'-2p'\\v'-5p'\\D'l .75P'\\v'5p'\h'1.25p'\s0
. sp .3
..
.de ma \"-- mail
. RT
\fistegosha@gmail.com\fP
. ad c
..
.de d \"-- date
. RT
\n(dy.\?'\n(mo<10@0'\n(mo.20\n(yr
..
.de bl \"-- bulleted list
. p
. mk
. if \\n(.$>1 .nr t.i \\$2
. in +\\n[t.i]u+1n
. ie \\$1=\\0 \{\\h'|-\\n[t.i]u-1n'\\(em\}
. el \{\\h'|-\\n[t.i]u'\\$1\}
. br
. rt
..
.de l \"-- numbered list
. nr t.l +1
. ip \\n[t.l]. 1.3m
..
.de li \"-- alternate numbered list
. p
. nm 1 1 1 0
. nf
..
.de ( \"-- start footnote
. ff r +numr
. ie \\n[t.foot] .ne 2
. el .ne 1
. if !\\n[t.foot] .nr t.footpos 0\\n(FP+\\n(VSp
. da t.footdiv
. ev t.footenv
. RT
. ps -1.5
. vs -1.5
. nr t.foot +1
. if \\n[t.foot]=1 \\s5\\m[#ddd]\\D'l 2.5i'\\m[]\\s0
. ds t.footsign "\\n[t.foot]
. if \\n(.$>0 .ds t.footsign "\\$1
. in 1m
. ti -1.5n
\\s+3\\*[t.footsign]\\s-3
. sp -1
..
.de ) \"-- end footnote
. RT
. ev
. di
. ie t.footsign=\\(dg \{\\v'-.25'\\h'-.5n'\\s-2\\*[t.footsign]\\$*\\s+2\\h'-.3n'\\v'.25'\}
. el \{\\h'-.5n'\\*[t.footsign]\\$*\\h'-.5n'\}
. nr t.footpos -\\n(dn
. ch FT \\n[t.footpos]u
' br
..
.\" \h'-.5n'\s-3\u\\*[t.footsign]\d\s+3\h'1p'\\$1 this line is needed for font without numerators
.de FP
. if \\n[t.foot] \{\
.  ev t.footenv
'  nf
.  t.footdiv
.  rm t.footdiv
.  ev
. \}
. nr t.foot 0
. ch FT \\n(FPu
..
.\" marginal notes -----------------
.\" may be removed in favor of tmac.keep
.de ntl \"-- left marginal note
. RT
. mk
. ll 3.6c
. na
. vs 10
. po -8m
. cl #656577
\\s-2
..
.de nt \"-- right marginal note
. ntl
. po 6i
..
.de nte \"-- end note
\\s0
. rt
. RT
..
.\" Preprocessor macros
.de eq
. p
. di t.eqdiv
..
.de en
. di
. if \\n(dn \{\
.  sp .5
.  t.eqdiv
.  sp .5
. \}
..
.de PS
. br
. RT
. in (\\n(.lu-\\$2)/2u
. ne \\$1
..
.de PE
. in
..
.de ts
. br
. RT
. ll \\n(LLu+6cm \"5.5cm
. ps \\n(PS-.5
. sp .35 \".25
..
.de te
. sp .3
..
.\" TBL fix
.de BP
. ie '\\n(.z'' .bp \\$1
. el \!.BP \\$1
..
.\" ugrind setup
.de vS
. br
. ev ev-code
. sp .5v
. nf
. in 1v
. ft cr
. ps \\n(PS-2
..
.de vE
. br
. ev
..
.de k \"-- begin a keep
. keepbeg f
..
.de ke \"-- end a keep
. keepend
..
.\" rf refers
.Ff [%A {, %y}]      \" (Author, Year)
.Fr %a: {(%y)} {\fI%t\fr}. {\*Q%q\*U}. %n, %d. %c: %p. {Доступно на \m[#577eaa]%w\m[]}
.de c1 \"-- start code block
. p
. ev ev-code
. sp .35v
. nf
. if \\n[t.l]=1 .nm 1 1 .5 0
. in 1m
. ft cr
. ps 8
. ta 360uL +360uL
..
.de c2 \"-- end code block
. ev
. p
..
.\" initialization
.de init
. lg 1
. kn 1
. wh \\n(FPu FT
. hpf ../hyph/hyph-ru.pat.txt ../hyph/hyph-ru.hyp.txt ../hyph/hyph-ru.chr.txt
. hlm 1
. hy 4
. hycost 200 300 500
. hyp 10
. ss 11 0
. ssh 15
. pmll 30 15
..
.init
.blm p
.\" lsm ti pp \" does not work :[