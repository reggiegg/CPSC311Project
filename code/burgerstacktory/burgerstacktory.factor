! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences math.parser math ;
IN: burgerstacktory
SYMBOL: game
SYMBOL: stack

TUPLE: gamestate gameuielements ;
TUPLE: gameuielements goalui actionsui stackui ingredientsui ;
TUPLE: superingredient image name ;
TUPLE: ingredient < superingredient image name ;
TUPLE: action function name description ; ! maybe an image
TUPLE: goal goalstate goaltext ;
TUPLE: stacktory goal stack actions ;



: <gamestate> ( gameuielements -- game )
    gamestate boa ;
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





