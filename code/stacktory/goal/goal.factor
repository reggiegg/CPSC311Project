! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math  ;

IN: stacktory.goal

TUPLE: goal goalstate goaltext ;

: <goal> ( goalstack goaltext -- goal )
    [ goal new ] dip
    >>goaltext
    swap >>goalstate
     ;

! STUB:
: goalgadget ( stacktory -- gadget )
    drop <pane> dup [ "Goal/Story" print ] with-pane { 250 100 } >>pref-dim ;

