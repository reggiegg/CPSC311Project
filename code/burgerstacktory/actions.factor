! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
! USING: namespaces kernel accessors classes 
! ui.gestures ui ui.gadgets.worlds ui.gadgets 
! ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
! io sequences arrays math.parser math ;

IN: burgerstacktory.actions

TUPLE: action < button   { stack stack } { word function } { string name } { description }

button [ stacktory>> stack>> ] [ function>> ] cleave call update .

function ( stack -- stack )

: swap ( s -- s )  dup pop2 swap push2





