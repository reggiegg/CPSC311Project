! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences math.parser math ;
IN: burgerstacktory
SYMBOL: game

TUPLE: gameuielements goalui actionsui stackui ingredientsui ;
TUPLE: ingredient name image ;
TUPLE: topbun < ingredient ;
TUPLE: rawmeat < ingredient ;
TUPLE: cookedmeat < ingredient ;
TUPLE: bottombum < ingredient ;
TUPLE: action function name description ; ! maybe an image
TUPLE: goal goalstate goaltext ;
TUPLE: stack stack ;
TUPLE: stacktory goal stack actions ;

GENERIC: grill ( ingredient -- ingredient )
GENERIC: swap ( stack -- stack )
GENERIC: serve ( stack -- stack )
GENERIC: cook ( stack -- stack )
GENERIC: execute ( action -- )

M: ingredient grill ; ! cook the Ingredient
M: rawmeat grill ; ! grill the meat
M: stack swap ; ! swap the top two ingredients
M: stack serve ; ! compare stack to goal
M: stack cook dup first grill [ rest ] dip prefix ; ! cook top ingredient
M: action execute  ; ! execute an action

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
    [ stack>> ] keep
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





