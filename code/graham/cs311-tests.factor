! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test cs311 ;
IN: cs311.tests


[ "Move a to b.\n" ] [ "a" "b" "c" 1 "" hanoi-string ] unit-test

[ """
Move a to c.
Move a to b.
Move c to b.
""" ]
[ "a" "b" "c" 2 "\n" hanoi-string ] unit-test

[ "Move a to b.\nMove a to c.\nMove b to c.\nMove a to b.\nMove c to a.\nMove c to b.\nMove a to b.\n" ]
[ "a" "b" "c" 3 "" hanoi-string ] unit-test

