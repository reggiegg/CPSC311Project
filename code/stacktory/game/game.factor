! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.stack stacktory.ingredient stacktory.goal ;

IN: stacktory.game




TUPLE: stacktory goal stack actions ;

: <stacktory> ( -- stacktory )
    stacktory new
    <stack> >>stack
    <topbun> <cookedmeat> <bottombun> 3array "A well cooked burger." <goal> >>goal ;



