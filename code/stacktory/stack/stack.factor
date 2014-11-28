! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.game stacktory.ingredient 
prettyprint ;

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
    stack>> stack>> dup dup
    <pile> 
    swap first image>> { 200 100 } >>pref-dim add-gadget 
    swap second image>> { 200 100 } >>pref-dim add-gadget
    swap third image>> { 200 100 } >>pref-dim add-gadget ;
    ! second ingredientsgadget 
    ! third ingredientsgadget ; 
    ! drop <pane> dup [ "Stack" print ] with-pane { 250 500 } >>pref-dim ;