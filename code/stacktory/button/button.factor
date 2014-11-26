! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arraesys math.parser math stacktory.action stacktory.game ;

IN: stacktory.button

: buttongadget ( stacktory -- gadget ) gadget new ;
