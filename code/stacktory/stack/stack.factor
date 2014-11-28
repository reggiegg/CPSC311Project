! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.game stacktory.ingredient stacktory.action ;

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

M: stack iswap dup stack>> [ first2 ] keep 2 tail rot prefix swap prefix >>stack ; ! swap the top two ingredients
M: stack cook dup stack>> dup first grill [ rest ] dip prefix >>stack ; ! cook top ingredient
M: stack serve dup stack>> game get-global goal>> goalstate>> sequence= [ "You got it!" print ] [ "Not quite!" print ] if ; ! compare stack to goal
