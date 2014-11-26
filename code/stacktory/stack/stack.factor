! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.game stacktory.ingredient ;

IN: stacktory.stack

TUPLE: stack stack ;


: <stack> ( -- stack )
    stack new
    <rawmeat>
    <topbun>
    <bottombun>
    3array
    >>stack
     ;

! STUB:
: stackgadget ( stacktory -- gadget )
    drop <pane> dup [ "Stack" print ] with-pane { 250 500 } >>pref-dim ;