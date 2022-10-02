.\" BASE MACROS
.\" Registers and their default values
.nr PS 10 \" font size
.nr VS 13 \" vertical spacing
.nr PO 1.1i \" left indent
.nr LL 6i+1n \" line length
.nr FP -1cm \" footer position
.\" Internal registers
.nr en.in 0   \" current indentation
.nr en.ip 1m  \" IP indentation
.nr en.pi 1m  \" RS indentation
.nr en.pg 1   \" page numbering (0 disables)
.nr vs.nl 1   \" numbered lines in code block (0 disables)
.ds en.cl "0  \" header colour
.ds TX \fRT\\h’-0.1667m’\\v’0.20v’E\\v’-0.20v’\\h’-0.125m’X\fP
.ds LX \fRL\\h’-0.36m’\\v’-0.15v’\s-2A\s0\\h’-0.15m’\\v’0.15v’\fP\*(TX
.
.de RT \" Reset variables
. fi
. ft R
. ff R -*
. ad p
. ps \\n(PS
. vs \\n(VS
. ll \\n(LLu
. lt \\n(LLu
. po \\n(POu
. in \\n[en.in]u
. cl 0
..
.\" Header and footer macros
.de FT.pg \" Footer page number
. ff R +tnum
. ie \\n[en.pg]=1 'tl '''\s+4\>%\<\s-4'
. el 'sp
..
.de HD  \" Page header (called by FT)
. ev en.ft
. RT
. sp 1.3cm
. HD.pg
. ev
. ns
. keepbop
..
.de FT  \" Page footer
. ev en.ft
. FP
' sp |\\n(.pu+\\n(FPu
. RT
' sp
. FT.pg
' bp
. ev
. if \\n(.t==(\\n(.p+(\\n(FP)) .HD
..
.\" Font styles --------------------
.\" r -- regular font
.de r
\\$3\\fR\\$1\fP\\$2
..
.\" i -- italic font
.de i
\\$3\\fI\\$1\fP\\$2
..
.\" b -- bold font
.de b
\\$3\\fB\\$1\fP\\$2
..
.\" ul -- underline
.de ul
\\$3\Z'\\$1'\v'.1m'\D'l \w'\\$1'u 0'\v'-.1m'\\$2
..
.\" xl -- strikeout
.de xl
\\$3\\Z'\\$1'\\v'-.23m'\\D'l \\w'\\$1'u 0'\v'.25m'\\$2
..
.de bx
. ie n \f[I]\\$1\f[P]
. el \\$3\\Z'\\$1'\\v'+0.1m'\\D'l 0 -0.9m'\
\\v'+0.9m'\\D'l \\w'\\$1'u 0'\
\\v'-0.9m'\\h'-\\w'\\$1'u 0'\\D'l \\w'\\$1'u 0'\
\\D'l 0 +0.9m'\\v'-0.1m'\\$2
..
.\" \\v'0.1m'\\D'p 0 -0.9m \\w 0 0 0.9m \\w 0'\\v'-0.1m'
.de box
\[br]\\$*\[br]\l'|0\[rn]'\l'|0\[ul'
..
.de XXL
. ie n \f[I]\\$1\f[P]
.\" . el \\Z'\\$1'\\v'-.125m'\\D'l \\w'\\$1'u 0'\\v'-.295m'\\h'-\\w'\\$1'u 0'\\D'l \\w'\\$1'u 0'\v'.42m'
. el \\Z'\\$1'\\v'-.125m'\\D'l \\w'\\$1'u 0'\\v'-.195m'\\h'-\\w'\\$1'u 0'\\D'l \\w'\\$1'u 0'\v'.32m'
..
.\" Paragraphs ---------------------
.\" p -- paragraph
.de p
. RT
. ne 2
..
.\" pp -- first-line indented paragraph
.de pp
. p
. ti +3n
..
.\" ip -- indented paragraph
.de ip
. p
. if \\n(.$>1 .nr en.ip \\$2
. in +\\n[en.ip]u
\h'|-\\n[en.ip]u'\\$1
. sp -1
..
.\" xp -- backindented paragraph
.de xp
. RT
. IP
. ti -2m
..
.\" hp -- hanging indent paragraph
.de hp
. p
. mk
. po -1m
\\$1\~
. br
. po
. rt
..
.\" qp -- quoted paragraph
.de qp
. p
. in \\n[en.in]u+0.5i
. ll -0.5i
..
.\" qs -- quote start
.de qs
. p
. if \\n(.$ .nr en.pi \\$1
. nr en.in +\\n[en.pi]
. ft I
..
.\" qe -- quote end
.de qe
. br
. if \\n(.$ .nr en.pi \\$1
. nr en.in -\\n[en.pi]
..
.\" t -- title
.de t
. RT
. ft HD
' sp 1.3cm
. ad l
. ps \\n(PS+6
. vs \\n(VS+6
. fi
. if \\n(.$ \{\
\\$*
.  p
. \}
. dv Title "\\$*
..
.\" h -- header
.de h
. p
. sp 0.9
. cl \\*[en.cl]
. ft B
. if \\n(.$ \{\
\\$*
.  p
. \}
. dv mark "\\$*" \\n(.% \\n(nl 1
..
.de @n
.RT
.if \\n(1T .sp 1
.RT
.ne 1.5
.ne 4
.ft B
.if n .ul 1000
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
.\"n -- numbered heading
.de n
. RT
. sp 0.25v
. @n \\$1
\\*(SN \\$2
. br
. ns
. dv mark "\\*(SN \\$2" \\n(.% \\n(nl \\$1
..
.\" a -- author
.de a
. sp 0.5v
. RT
. ft R
. in 1n
. ps 9
. dv Author "-@author@-"
..
.\" ai -- author’s institution
.de ai
. RT
. in 1n
. ft I
. ps 9
. dv Institution "-@institution@-"
..
.\" ab -- abstract
.de ab
. p
. ce
\f[R]\s[22]\v'-5p'\D'l 0.7P'\v'5p'\h'-1p'd\h'-2p'l\h'-2p'\v'-5p'\D'l 0.75P'\v'5p'\h'1.25p'\s0
. sp 0.3
..
.\" ma -- mail
.de ma
.RT
\fIstegosha@gmail.com\fP
. ad c
..
.\" d -- date
.de d
. RT
\n(dy.\?'\n(mo<10@0'\n(mo.20\n(yr
..
.\" bl -- bulleted list
.de bl
. p
. mk
. if \\n(.$>1 .nr en.ip \\$2
. in +\\n[en.ip]u+1n
. ie \\$1=\0 \{\h'|-\\n[en.ip]u-1n'\(em\}
. el \{\h'|-\\n[en.ip]u'\\$1\}
. br
. rt
..
.\" l -- numbered list
.de l
. nr en.nl +1
. bl \\n[en.nl].
..
.\" Footnotes ----------------------
.\" ( -- start footnote
.de (
. ff R +numr
. ie \\n[en.footnum] .ne 2
. el .ne 1
. if !\\n[en.footnum] .nr en.footpos 0\\n(FP+\\n(VSp
. da en.footdiv
. ev en.footenv
. RT
. ps -1.5
. vs -1.5
. ad pl
. nr en.footnum +1
. if \\n[en.footnum]=1 \s[5]\m[#dddddd]\D'l 2.5i'\m[]\s0
. ds en.footsign "\\n[en.footnum]
. if \\n(.$>0 .ds en.footsign "\\$1
. in 2n
. ti -1.5n
\s+3\\*[en.footsign]\s-3
. sp -1
..
.de )
. in 0
. ev
. di
\h'-0.5n'\\*[en.footsign]\h'-0.5n'
. nr en.footpos -\\n(dn
. ch FT \\n[en.footpos]u
' br
..
.\" \h'-0.5n'\s-3\u\\*[en.footsign]\d\s+3\h'1p'\\$1 this line is needed for font without numerators
.de FP
. if \\n[en.footnum] \{\
.  ev en.footenv
'  nf
.  en.footdiv
.  rm en.footdiv
.  ev
. \}
. nr en.footnum 0
. ch FT \\n(FPu
..
.\" Marginal notes -----------------
.\" may be removed for tmac.keep
.\" notl -- left marginal note
.de notl
. p
. mk
. ll 3.05c
. na
. vs 10
. po -7.35m
. cl #656577
\s[-2]
..
.\" notr -- right marginal note
.de notr
. notl
. po 7.15i
..
.\" note -- end note
.de note
\s0
. rt
. RT
..
.\" Preprocessor macros
.de EQ
. RT
. nf
. di en.eqdiv
..
.de EN
. di
. if \\n(dn \{\
.  sp .5
.  ce
.  en.eqdiv
.  sp .5
. ad c
. \}
. fi
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
.de TS
. br
. RT
. sp .25
..
.de TE
. sp .55
..
.\" TBL fix
.de BP
. ie '\\n(.z'' .bp \\$1
. el \!.BP \\$1
..
.
.\" ugrind setup
.de vS
. br
. ev ev-code
. nr ev-code 1
. sp .5v
. nf
. in 1v
. ft CR
. ps 8
..
.de vE
. br
. ev
. rr ev-code
..
.\" Citations
.ds ct [\\$1]
.\" rf refers
.Ff [%A {, %y}]      \" (Author, Year)
.Fr %a: {(%y)} {\fI%t\fR}. {\*Q%q\*U}. %n, %d. %c: %p. {Доступно на \m[#577eaa]%w\m[]}
.\" c1 -- start code block
.de c1
. RT
. ev ev-code
. sp .15v
. nf
. if \\n[vs.nl]=1 .nm 1 1 0.5 0
. in 1m
. ft CR
. ps 8
. ta 360uL 720uL 1440uL
..
.\" c2 -- end code block
.de c2 \" code block end
. ev
. RT
..
.de vS
. c1
..
.de vE
. c2
..
.\" Initialization
.de init
. lg 1
. kn 1
. wh \\n(FPu FT
. hpf /home/eg0rka/doc/roff/hyph/hyph-ru.pat.txt /home/eg0rka/doc/roff/hyph/hyph-ru.hyp.txt /home/eg0rka/doc/roff/hyph/hyph-ru.chr.txt
. hlm 2
. hy 2
. hycost 100 200 400
. hyp 10
. ss 11 0
. ssh 15
. pmll 20 10
.\". pl 841.995p
.\". pw 595.35p
..
.\"de 2c \" a try for two-column mode
.\"'nr L1 \\n(LL*7/15)
.\" alternate numbered list
.\" .p
.\" .nm 1 1 1 0
.\" .nf
.\" ....
.\" .nm
.init