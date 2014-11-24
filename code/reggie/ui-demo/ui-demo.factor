USING: namespaces kernel accessors classes 
ui.gestures ui ui.gadgets.worlds ui.gadgets 
ui.gadgets.panes ui.gadgets.packs ui.gadgets.buttons 
io sequences math.parser math ;

IN: ui-demo
DEFER: makebutton

: clickme ( button -- ) parents 3 swap nth dup [ "counter" get-global dup 1 + "counter" set-global number>string print ] with-pane <pane-stream> makebutton swap write-gadget ;
: up ( gadget -- ) gadget-child [ "You Pressed Up!" print ] with-pane ;
: down ( gadget -- ) gadget-child [ "You Pressed Down!" print ] with-pane ;
: left ( gadget -- ) gadget-child [ "You Pressed Left!" print ] with-pane ;
: right ( gadget -- ) gadget-child [ "You Pressed Right!" print ] with-pane ;
: makebutton ( -- button ) "Click me!" [ clickme ] <border-button> ;
: display ( -- ) "Here is a game" print ;
: makeworldattributes ( -- world-attributes ) T{ world-attributes { title "Button!" } { pref-dim { 200 55 } } } ;

: makewindow ( -- )
    1 "counter" set-global
    <pane>
    dup <pane-stream> swap
    makeworldattributes open-window* swap
    makebutton swap write-gadget 
    class-of 
    H{
     { T{ key-down f f "UP" } [ up ] }
     { T{ key-down f f "DOWN" } [ down ] }
     { T{ key-down f f "LEFT" } [ left ] }
     { T{ key-down f f "RIGHT" } [ right ] }
      } set-gestures ; 

MAIN: makewindow