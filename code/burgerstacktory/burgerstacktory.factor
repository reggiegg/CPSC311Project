! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math ;
IN: burgerstacktory
SYMBOL: game

TUPLE: gameuielements goalui actionsui stackui ingredientsui ;
TUPLE: ingredient name image ;
TUPLE: topbun < ingredient ;
TUPLE: rawmeat < ingredient ;
TUPLE: cookedmeat < ingredient ;
TUPLE: bottombun < ingredient ;
TUPLE: action function name description ; ! maybe an image
TUPLE: goal goalstate goaltext ;
TUPLE: stack stack ;
TUPLE: stacktory goal stack actions ;

GENERIC: grill ( ingredient -- ingredient )
GENERIC: iswap ( stack -- stack )
GENERIC: serve ( stack -- stack )
GENERIC: cook ( stack -- stack )
GENERIC: execute ( action -- x )

DEFER: <cookedmeat>
M: ingredient grill ; ! cook the Ingredient
M: rawmeat grill drop <cookedmeat> ; ! grill the meat
M: stack iswap dup stack>> [ first2 ] keep 2 tail rot prefix swap prefix >>stack ; ! swap the top two ingredients
M: stack serve dup stack>> game get-global goal>> goalstate>> sequence= [ "You got it!" print ] [ "Not quite!" print ] if ; ! compare stack to goal
M: stack cook dup stack>> dup first grill [ rest ] dip prefix >>stack ; ! cook top ingredient
M: action execute  ; ! execute an action

: <rawmeat> ( -- rawmeat )
    rawmeat new "Raw Meat" >>name ;

: <cookedmeat> ( -- cookedmeat )
    cookedmeat new "Cooked Meat" >>name ;

: <topbun> ( -- topbun )
    topbun new "Top Bun (with Sesame Seeds)" >>name ;

: <bottombun> ( -- bottombun )
    bottombun new "Bottom Bun" >>name ;

: <goal> ( goalstack goaltext -- goal )
    [ goal new ] dip
    >>goaltext
    swap >>goalstate
     ;

: <stack> ( -- stack )
    stack new
    <rawmeat>
    <topbun>
    <bottombun>
    3array
    >>stack
     ;

: <stacktory> ( -- )
    stacktory new
    <stack> >>stack
    <topbun> <cookedmeat> <bottombun> 3array "A well cooked burger." <goal> >>goal
    game set-global
     ;

: getstack ( -- stack )
    game get-global stack>> ;

: viewstack ( stack -- stack )
    dup stack>> [ name>> print ] each ;

: <gameuielements> ( goalgadget actiongadget stackgadget ingredientsgadget -- gameuielements )
    gameuielements boa ;

: makeworldattributes ( -- world-attributes ) T{ world-attributes { title "Burger Stacktory!" } } ;

: fakeui ( -- gameuielements )
    <pane> dup [ "Goal/Story" print ] with-pane { 250 100 } >>pref-dim 
    <pane> dup [ "Actions" print ] with-pane { 250 300 } >>pref-dim
    <pane> dup [ "Stack" print ] with-pane { 250 500 } >>pref-dim
    <pane> dup [ "Ingredients" print ] with-pane { 250 300 } >>pref-dim 
    <gameuielements>
     ;

: renderui ( gameuielements -- )
    <shelf> swap
    <pile> swap
    [ goalui>> ] keep
    [ add-gadget ] dip
    [ stackui>> ] keep
    [ add-gadget ] dip
    [ add-gadget ] dip
    <pile> swap
    [ actionsui>> ] keep
    [ add-gadget ] dip
    ingredientsui>>
    add-gadget
    add-gadget
    makeworldattributes
    open-window ;

: makeitso ( -- )
    fakeui
    renderui ;





