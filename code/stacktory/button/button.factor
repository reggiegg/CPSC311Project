! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.action stacktory.game ;

IN: stacktory.button

DEFER: update-stacktory

! STUB:
: buttongadget ( stacktory -- gadget )
    drop <pane> dup [ "Actions" print ] with-pane { 250 300 } >>pref-dim ;