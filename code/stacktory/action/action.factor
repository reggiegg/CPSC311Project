! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences arrays math.parser math stacktory.ingredient stacktory.stack ;

IN: stacktory.action


DEFER: game

TUPLE: action function name description ; ! maybe an image


GENERIC: grill ( ingredient -- ingredient )
GENERIC: iswap ( stack -- stack )
GENERIC: cook ( stack -- stack )
GENERIC: execute ( action -- x )

GENERIC: serve ( stack -- stack )

! M: ingredient grill ; ! cook the Ingredient
! M: rawmeat grill drop <cookedmeat> ; ! grill the meat

! M: stack iswap dup stack>> [ first2 ] keep 2 tail rot prefix swap prefix >>stack ; ! swap the top two ingredients
! M: stack cook dup stack>> dup first grill [ rest ] dip prefix >>stack ; ! cook top ingredient
! M: action execute  ; ! execute an action


! M: stack serve dup stack>> game get-global goal>> goalstate>> sequence= [ "You got it!" print ] [ "Not quite!" print ] if ; ! compare stack to goal
