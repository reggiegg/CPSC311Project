! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.action stacktory.game locals stacktory.stack combinators ;

IN: stacktory.button

DEFER: update-stacktory
DEFER: makeswapbutton
DEFER: makegrillbutton
DEFER: makeservebutton

:: <makeswapbutton> ( stacktory -- gadget ) "Swap" [ drop stacktory stack>> iswap stacktory stack<< "swap" print ] <border-button> ;

:: <makegrillbutton> ( stacktory -- gadget )  "Grill" [ drop stacktory stack>> cook stacktory stack<< ] <border-button> ;

:: <makeservebutton> ( stacktory -- gadget ) "Serve" [ drop stacktory stack>> serve stacktory stack<< ] <border-button> ;

: makeactionbuttonslist ( stacktory -- listofbuttons ) 
    { [ <makegrillbutton> ]  
    [ <makeservebutton> ] 
    [ <makeswapbutton> ] }
    cleave
    3array
    ;

: buttongadget ( stacktory -- gadget )
    <pile> swap makeactionbuttonslist [ add-gadget ] each ; 
