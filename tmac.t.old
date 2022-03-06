.\" [t0ster30-1]
.\" Registers and their default values
.nr PS 10  \" font size
.nr VS 13  \" vertical spacing
.nr LL 5.95i  \" line length
.nr PO 1.1i   \" page offset
.nr FP -0.5v  \" footer position
.\" Internal registers
.nr en.in 0   \" current indentation
.nr en.ip 2m  \" IP indentation
.nr en.pi 2m  \" RS indentation
.nr en.pg 1   \" page numbering (0 disables)
.ds en.cl "0  \" header colour
.nr en.nl 0   \" list numbering
.nr vs.nl 1   \" numbered lines in code block (0 disables)
.
.de RT \" Reset variables
. br
. fi
. ft R
. ad pb
. ps \\n(PS
. vs \\n(VS
. ll \\n(LLu
. lt \\n(LLu
. po \\n(POu
. in \\n[en.in]u
. nr \\n[en.nl]
. cl 0
..
.\" Header and footer macros
.de FT  \" Page footer
. ev en.ft
. FP
' sp |\\n(.pu+\\n(FPu
. RT
. FT.pg
' bp
. ev
. if \\n(.t==(\\n(.p+(\\n(FP)) .HD
..
.de HD  \" Page header (called by FT)
. ev en.ft
. RT
. ev
. ns
. keepbop
..
.de FT.pg \" Footer page number
. ie \\n[en.pg]=1 'tl ''\s[+1]\>%\<\s0''
. el 'sp
..
.de HD.pg \" Header page number
' sp 3
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
.\" Paragraphs ---------------------
.\" p -- paragraph
.de p
. RT
. ne 1.5
..
.\" pp -- first-line indented paragraph
.de pp
. p
. ti +3n
..
.\" qp -- quoted paragraph
.de qp
. p
. in \\n[en.in]u+0.5i
. ll -\\n[en.ip]u
..
.\" ip -- indented paragraph
.de ip
. p
. if \\n(.$>1 .nr en.ip \\$2
. in +\\n[en.ip]u
\h'|-\\n[en.ip]u'\\$1
. sp -1
..
.\" qs -- quote start
.de qs
. br
. if \\n(.$ .nr en.pi \\$1
. nr en.in +\\n[en.pi]
. p
. ft I
..
.\" qe -- quote end
.de qe
. br
. if \\n(.$ .nr en.pi \\$1
. nr en.in -\\n[en.pi]
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
. dv mark "\\$*" \\n(.% \\n(nl \\$*
..
.\" t -- title
.de t
. RT
. ft HD
. sp 3
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
.\" a -- author
.de a
. RT
. ft R
. in 1n
\{\s[9]AUTHOR\s0
. br
. dv Author "AUTHOR"\}
..
.\" ai -- author’s institution
.de ai
. RT
. in 1n
. ft I
\{\s[8.5]INSTITUTION\s0\}
..
.\" ab -- abstract
.de ab
. ad c
\f[R]\s[12.5]\h'2.1p'\v'-3p'\D'l 0.65P'\v'3p'\h'-2.1p'\
\h'1.7p'd\h'-1.7p'l\
\h'-1.25p'\v'-3p'\D'l 0.65P'\v'3p'\h'1.25p'\s0
. ns
\\fI\\$1\\s[8.25]
. ad pr
. ns
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
. in +\\n[en.ip]u
. ie \\n(.$=0 \{\h'|-\\n[en.ip]u+1n'\(em\}
. el \{\h'|-\\n[en.ip]u+1.5n'\\$1\}
. br
. rt
..
.\" n -- numbered list
.de n
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
. ad p
. nr en.footnum +1
. if \\n[en.footnum]=1 \s[5]\m[#dddddd]\D'l 3i'\m[]\s0
. ds en.footsign "\\n[en.footnum]
. if \\n(.$>0 .ds en.footsign "\\$1
. in 2n
. ti -1.5n
\s[+0.5]\\*[en.footsign]\s[-0.5]
. sp -1
..
.\" ) -- end footnote
.de )
. in 0
. ev
. di
.\" \h'-0.5n'\s-3\u\\*[en.footsign]\d\s+3\h'1p'\\$1
\h'-0.5n'\\*[en.footsign]\h'-0.5n'\\$1 \"comment out this line and uncomment upper to use your usual font
. nr en.footpos -\\n(dn
. ch FT \\n[en.footpos]u
. ff R -numr
..
.de FP
. if \\n[en.footnum] \{\
. ev en.footenv
' nf
. en.footdiv
. rm en.footdiv
. ev
. \}
. nr en.footnum 0
. ch FT \\n(FPu
..
.\" Marginal notes -----------------
.\" may be eventually removed for tmac.keep
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
. p
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
.de EQ \" eqn start
. RT
. nf
. di en.eqdiv
..
.de EN \" eqn end
. di
. if \\n(dn \{\
. sp .5
. ce
. en.eqdiv
. sp .5
. \}
. fi
..
.de PS \" pic start
. br
. RT
. in (\\n(.lu-\\$2)/2u
. ne \\$1
..
.de PE \" pic end
. in
. RT
..
.de TS \" tbl start
. RT
..
.\" Citations
.ds ct [\\$1]
.\" rf refers
.Ff [%A {, %y}]      \" (Author, Year)
.Fr %a: {(%y)} {\fI%t\fR}. {\*Q%q\*U}. %n, %d. %c: %p. {Available at \m[#577eaa]%w\m[]}
.\" c1 -- start code block
.\" c2 -- end code block
.de c1
. RT
. ev ev-code
. sp .15v
. nf
. if \\n[vs.nl]=1 .nm 1 1 0.5 0
. in 1m
. ft CR
. ps 8
. ta 360uL 720uL 1080uL 1440uL 1800uL
..
.de c2 \" code block end
. ev
. RT
..
.\" Initialization
.de init
. lg 1
. kn 1
. wh \\n(FPu FT
. hpf ../hyph/hyph-en-gb.pat.txt ../hyph/hyph-en-gb.hyp.txt ../hyph/hyph-en-gb.chr.txt
. hlm 2
. hy 5
. hycost 800
. hyp 10
. ss 11 0
. ssh 15
. pmll 20 10
..
.init
