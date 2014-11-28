! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math io.styles hashtables ;

IN: stacktory.goal

TUPLE: goal goalstate goaltext ;

: <goal> ( goalstack goaltext -- goal ) goal boa ;

! STUB:
: goalgadget ( stacktory -- gadget )
    goal>> dup
    [ 
    "Your customer wants:"  print
    "---------------------" print
    goaltext>>  print 
    "---------------------" print
    "Recipe:" print
    "---------------------" print
    goalstate>>
    [ name>> print ]
    each
    "---------------------" print
]
    make-pane ;
    ! drop <pane> dup [ "Goal/Story" print ] with-pane { 250 100 } >>pref-dim ;
