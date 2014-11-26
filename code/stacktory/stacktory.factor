! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math ;

IN: stacktory




SYMBOL: game



! game get-global goal>>

! : rendergoal ( goal -- gadget ) -- ;

TUPLE: gameuielements goalui actionsui stackui ingredientsui ;




DEFER: <cookedmeat>





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





