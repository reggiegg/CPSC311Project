! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: prettyprint math kernel accessors ui ui.gadgets ui.render colors.constants opengl
opengl.gl ui.gadgets.editors io images.viewer locals formatting combinators sequences
ui.gadgets.packs namespaces ui.gadgets.panes ui.gadgets.buttons ;
IN: cs311


TUPLE: super-gadget < gadget graham ;
: <super-gadget> ( -- gg ) super-gadget new ;

M: super-gadget pref-dim* ( gadget -- {xy} ) drop { 600 900 } ;


TUPLE: graham-gadget < gadget graham ;
: <graham-gadget> ( -- gg ) graham-gadget new ;

M: graham-gadget pref-dim* ( gadget -- {xy} ) drop { 800 600 } ;

M: graham-gadget draw-gadget* ( gadget -- )
    drop [
        20 20 1 glScalef        ! sets 1-pixel to be 20 pixels in gl
        COLOR: red gl-color     ! sets the currently-drawing colour as red
        { 3 4 }  { 1 2 }  gl-fill-rect  ! makes a rectangle at pos ( 3 4 ) of size ( 1 2 )
    ] do-matrix ;               ! causes this to be drawn on top of what's already there, instead of replacing it.... I THINK!

: play ( -- ) [ <graham-gadget> "Graham" open-window ] with-ui ;


! : endless-echo ( -- ) readln [ dup "q" = ] [
!     "That's very interesting. You said: " write write nl
!     "Now what would you like to say (q for quit)?: " write readln ]
!     until drop ;


! : fun ( -- )
!     "Hello, what would you like to say?: " write
!     endless-echo ;

DEFER: endless-echo
: write-and-echo ( output -- )   write readln endless-echo ;

: endless-echo ( input -- )
    dup "q" =
    [ drop  "~/image.jpg" image.  "Goodbye" write nl ]
    [ "That's very interesting. You said: " write write nl
      "Now what would you like to say (q for quit)?: " write-and-echo
    ] if ;

: fun ( -- )
    "Hello, what would you like to say?: " write-and-echo ;


! hanoi with standard write word and locals
! :: hanoi ( source dest extra num -- )
!     num 0 >
!     [ source extra dest num 1 - hanoi
!       "Move " write  source write " to " write  dest write "." write nl
!       extra dest source num 1 - hanoi
!     ] when ;




! locals again, but with formatting word (printf)     THIS ONE'S THE BEST
:: hanoi ( source dest extra num -- )
    num 0 >
    [ source extra dest num 1 - hanoi
      source dest "Move %s to %s.\n" printf
      extra dest source num 1 - hanoi
    ] when ;

: 3reverse ( x y z -- z y x ) swap rot ;

! using Factor's extended shuffle words (took over 1.5 hours to get it right)
! : hanoi ( source dest extra num -- )
!     dup 0 >
!     [ 1 -                                       ! s d e n'
!       [ swapd hanoi ] 4keep                     ! s d e n'  [ s e d n'  (hanoi) ]
!       [ 2dup "Move %s to %s.\n" printf ] 2dip   ! s d e n'  [ s d (...) ]
!       [ 3reverse ] dip hanoi                   ! e d s n'  (hanoi)
!     ] [ 4drop ] if ;


! ! using dataflow combinators
! : hanoi ( source dest extra num -- )
!     dup 0 >
!     [ 1 -                                        ! s d e n'
!       { [ swapd hanoi ]
!         [ 2drop "Move %s to %s.\n" printf ]
!         [ [ 3reverse ] dip hanoi ] }
!       4cleave ]
!     [ 4drop ] if ;

! ! locals again, but with formatting word (printf)     THIS ONE'S THE BEST
! :: hanoi-string ( source dest extra num sofar -- solution )
!     num 0 >
!     [ source extra dest  num 1 - sofar hanoi-string
!       source dest "%sMove %s to %s.\n" sprintf :> next-sofar
!       extra dest source  num 1 -  next-sofar hanoi-string
!     ] [ sofar ] if ;

! : hanoi ( source dest extra num -- )   "" hanoi-string write ;

! NOPE
! : hanoi-string ( source dest extra num string -- solution )
!     over 0 >
!     [ [ 1 - ] dip                                        ! s d e n' t
!       { [ [ swap ] 2dip hanoi-string ]
!         [ "Move %s to %s.\n" append 2nip sprintf ]
!         [ [ 3reverse ] dip hanoi ] }
!       4cleave ]
!     [ 4drop ] if ;


! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111

TUPLE: text-gadget < editor graham ;
: <text-gadget> ( -- tg ) text-gadget new-editor  dup "joe joe" swap set-editor-string ;

M: text-gadget pref-dim* ( gadget -- {xy} ) drop { 100 200 } ;


SYMBOL: p
: stuff ( -- )
    <super-gadget>
    <pile>
    <graham-gadget> add-gadget
    <text-gadget> add-gadget
    <pane> p set
    p get add-gadget
    add-gadget "Goodness!" open-window ;





! "~/Documents/ubc/courses/311/project/CPSC311Project/"
! {
!     "~/Documents/ubc/courses/311/project/CPSC311Project/topbun.png"
!     "~/Documents/ubc/courses/311/project/CPSC311Project/grilledpatty.png"
!     "~/Documents/ubc/courses/311/project/CPSC311Project/rawpatty.png"
!     "~/Documents/ubc/courses/311/project/CPSC311Project/bottombun.png"
! }


: burgerpic ( -- )
    <super-gadget>
    <shelf>

    <pile>
    <pane> dup { 200 200 } >>pref-dim  
    [ "Your goal is:\na WELL-COOKED plain hamburger!\n\n\n\n\nThis consists of:\nBottom Bun, Cooked Meat, Top Bun\n\n\n\n\n\n" write ] with-pane
    add-gadget

    {
      "topbun.png"
      "grilledpatty.png"
      "bottombun.png"
    }
    [ <image-gadget> add-gadget ] each
    add-gadget

    <pile> { 200 400 } >>pref-dim
    "SWAP" [ ] <border-button> { 100 50 } >>pref-dim add-gadget
    "COOK" [ ] <border-button> { 100 50 } >>pref-dim add-gadget
    "SERVE" [ ] <border-button> { 100 50 } >>pref-dim add-gadget
    add-gadget
    add-gadget "Hamburger Stacktory!" open-window ;


      ! "rawpatty.png"
