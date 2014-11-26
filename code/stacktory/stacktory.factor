! To run, type stacktory-window or type "stacktory" run at the listener

! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes  
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math combinators 
stacktory.goal stacktory.ingredient stacktory.stack stacktory.button stacktory.game ;

IN: stacktory

SYMBOL: game

TUPLE: stacktory-gadget < gadget stacktory ;
TUPLE: gameuielements goalui actionsui stackui ingredientsui ;



: update-stacktory ( -- ) game get relayout-1 ;


: <gameuielements> ( goalgadget actiongadget stackgadget ingredientsgadget -- gameuielements )
    gameuielements boa ;


: makeworldattributes ( -- world-attributes ) 
    T{ world-attributes { title "Burger Stacktory!" }  { pref-dim { 500 600 } } } ;


: assemble ( gameuielements -- shelfgadget )
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
    add-gadget ;


: makecomponents ( stacktory -- gameuielements )
    {
        [ goalgadget ]
        [ buttongadget ]
        [ stackgadget ]
        [ ingredientsgadget ]
    } cleave <gameuielements> ;



: <stacktory-gadget> ( -- stacktory-gadget )
    <stacktory> dup game set-global
    stacktory-gadget new over >>stacktory
    swap makecomponents assemble add-gadget ;


: stacktory-window ( -- )
    [ <stacktory-gadget> makeworldattributes open-window ] with-ui ;


MAIN: stacktory-window