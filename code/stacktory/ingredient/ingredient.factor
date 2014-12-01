USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math locals images.viewer 
stacktory.action ;

IN: stacktory.ingredient

TUPLE: ingredient name image ;

TUPLE: topbun < ingredient ;
TUPLE: rawmeat < ingredient ;
TUPLE: cookedmeat < ingredient ;
TUPLE: bottombun < ingredient ;

: <rawmeat> ( -- rawmeat )
    rawmeat new "Raw Meat" >>name 
    "rawpatty.jpg" <image-gadget> >>image ;

: <cookedmeat> ( -- cookedmeat )
    cookedmeat new "Cooked Meat" >>name 
    "grilledpatty.jpg" <image-gadget> >>image ;

: <topbun> ( -- topbun )
    topbun new "Top Bun (with Sesame Seeds)" >>name 
    "topbun.png" <image-gadget> >>image ;

: <bottombun> ( -- bottombun )
    bottombun new "Bottom Bun" >>name 
    "bottombun.png" <image-gadget> >>image ;


: ingredientsgadget ( ingredient -- gadget )
    drop <pane> dup [ "Stack" print ] with-pane { 250 500 } >>pref-dim ;

      ! [ image>> ] <pane> swap with-pane { 250 300 } >>pref-dim ;
M: ingredient grill ; ! cook the Ingredient
M: rawmeat grill drop <cookedmeat> ; ! grill the meat
    