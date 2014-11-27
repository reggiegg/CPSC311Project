! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
! USING: namespaces kernel accessors classes 
! ui.gestures ui ui.gadgets.worlds ui.gadgets 
! ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
! io sequences arrays math.parser math ;

IN: burgerstacktory.actions
DEFER: makebutton


TUPLE: action < button   { stack stack } { word function } { string name } { description }

button [ stacktory>> stack>> ] [ function>> ] cleave call update .

function ( stack -- stack )

: swap ( s -- s )  dup pop2 swap push2

! TODO Take in stacktory and use that stack
: <makeswapbutton> ( -- button ) "Swap" [ drop getstack iswap drop ] <border-button> ;

: <makegrillbutton> ( -- button ) "Grill" [ drop getstack cook  drop ] <border-button> ;

: <makeservebutton> ( -- button ) "Serve" [ drop getstack serve drop ] <border-button> ;

: makeactionbuttonslist ( -- listofbuttons ) 
    <makegrillbutton>  
    <makeservebutton>  
    <makeswapbutton> 
    3array
    ;

: makeactionbuttonsgadget ( -- gadget )
    <pile> makeactionbuttonslist [ add-gadget ] each ; 





