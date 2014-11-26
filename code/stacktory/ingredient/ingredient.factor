USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math ;

IN: stacktory.ingredient

TUPLE: ingredient name image ;

TUPLE: topbun < ingredient ;
TUPLE: rawmeat < ingredient ;
TUPLE: cookedmeat < ingredient ;
TUPLE: bottombun < ingredient ;

: <rawmeat> ( -- rawmeat )
    rawmeat new "Raw Meat" >>name ;

: <cookedmeat> ( -- cookedmeat )
    cookedmeat new "Cooked Meat" >>name ;

: <topbun> ( -- topbun )
    topbun new "Top Bun (with Sesame Seeds)" >>name ;

: <bottombun> ( -- bottombun )
    bottombun new "Bottom Bun" >>name ;

! STUB:
: ingredientsgadget ( stacktory -- gadget )
    drop <pane> dup [ "Ingredients" print ] with-pane { 250 300 } >>pref-dim ;