! To run, type stacktory-window or type "stacktory" run at the listener

! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes  
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math combinators locals
images.viewer ui.gadgets.buttons.private
 ;

IN: burger

SYMBOL: game
SYMBOL: gamegadget

TUPLE: stacktory-gadget < gadget stacktory ;
TUPLE: gameuielements goalui actionsui stackui ingredientsui ;

TUPLE: stacktory goal stack actions ;


TUPLE: ingredient name image ;

TUPLE: topbun < ingredient ;
TUPLE: rawmeat < ingredient ;
TUPLE: cookedmeat < ingredient ;
TUPLE: bottombun < ingredient ;


TUPLE: goal goalstate goaltext ;



TUPLE: stack stack ;



TUPLE: action function name description ; ! maybe an image


GENERIC: grill ( ingredient -- ingredient )
GENERIC: iswap ( stack -- stack )
GENERIC: cook ( stack -- stack )
GENERIC: execute ( action -- x )

GENERIC: serve ( stack -- stack )

DEFER: <stack>
DEFER: <stacktory>


TUPLE: action-button < button stacktory ;
: <action-button> ( stacktory label quot: ( button -- ) -- action-button )
    action-button new-button border-button-theme  swap >>stacktory ;

: update-stacktory ( -- ) gamegadget get relayout-1 ;


! STUB:
: stackgadget ( stacktory -- gadget )
    stack>> stack>> dup dup
    <pile> 
    swap first image>> { 200 100 } >>pref-dim add-gadget 
    swap second image>> { 200 100 } >>pref-dim add-gadget
    swap third image>> { 200 100 } >>pref-dim add-gadget ;
    ! second ingredientsgadget 
    ! third ingredientsgadget ; 
    ! drop <pane> dup [ "Stack" print ] with-pane { 250 500 } >>pref-dim ;



: <makeswapbutton> ( stacktory -- gadget ) "Swap" [  stacktory>> [ iswap ] change-stack  ] <action-button> ;

: <makegrillbutton> ( stacktory -- gadget )  "Grill" [ stacktory>> [ cook ] change-stack  ] <action-button> ;

: <makeservebutton> ( stacktory -- gadget ) "Serve" [ stacktory>> [ serve ] change-stack  ] <action-button> ;

: makeactionbuttonslist ( stacktory -- listofbuttons ) 
    {
        [ <makegrillbutton> ]  
        [ <makeservebutton> ] 
        [ <makeswapbutton> ] 
    }     cleave
    3array
    ;

: buttongadget ( stacktory -- gadget )
    <pile> swap makeactionbuttonslist [ add-gadget ] each ; 










: <goal> ( goalstack goaltext -- goal ) goal boa ;

! STUB:
: goalgadget ( stacktory -- gadget )
    goal>> dup
    [ 
    "Your customer wants:"  print
    "---------------------" print
    goaltext>>  print 
    "---------------------" print
    "Recipe:" print
    "---------------------" print
    goalstate>>
    [ name>> print ]
    each
    "---------------------" print
]
    make-pane ;
    ! drop <pane> dup [ "Goal/Story" print ] with-pane { 250 100 } >>pref-dim ;



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
    ! gamegadget get 

    drop <pane> dup [ "Bag o ingredients" print ] with-pane { 250 500 } >>pref-dim ;

      ! [ image>> ] <pane> swap with-pane { 250 300 } >>pref-dim ;

: <stack> ( -- stack )
    stack new
    <rawmeat>
    <topbun>
    <bottombun>
    3array
    >>stack
     ;
    
: <stacktory> ( -- stacktory )
    stacktory new
    <stack> >>stack
    <topbun> <cookedmeat> <bottombun> 3array "A well cooked burger." <goal> >>goal ;





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
    swap makecomponents assemble add-gadget dup gamegadget set-global ;


: stacktory-window ( -- )
    [ <stacktory-gadget> makeworldattributes open-window ] with-ui ;

M: ingredient grill ; ! cook the Ingredient
M: rawmeat grill drop <cookedmeat> ; ! grill the meat

M: stack iswap dup stack>> [ first2 ] keep 2 tail rot prefix swap prefix >>stack ; ! swap the top two ingredients
M: stack cook dup stack>> dup first grill [ rest ] dip prefix >>stack ; ! cook top ingredient
M: action execute  ; ! execute an action


M: stack serve dup stack>> game get-global goal>> goalstate>> sequence= [ "You got it!" print ] [ "Not quite!" print ] if ; ! compare stack to goal





MAIN: stacktory-window


! : length ( lox -- n )
!     [ drop 1 ] map
!     0 [ + ] reduce ;