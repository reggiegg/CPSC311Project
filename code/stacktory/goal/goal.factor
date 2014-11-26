! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.game ;

IN: stacktory.goal

TUPLE: goal goalstate goaltext ;

: <goal> ( goalstack goaltext -- goal )
    [ goal new ] dip
    >>goaltext
    swap >>goalstate
     ;

: goalgadget ( stacktory -- gadget ) gadget new ;
