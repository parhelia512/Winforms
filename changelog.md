
Winforms changelog

v1.1.207 (15-May-2026)
    Eliminated the need to call create_handle for Form.
    Added onHandleCreated event for Form.
    Fine tuned NumberPicker border drawing.



v1.1.206 (08-May-2026)
    Improved NumberPicker border drawing
    Added onHandleCreated event for all controls
    GroupBox is now a parent control. It is no more transparent to mouse events.

v1.0.206 (15-Apr-2026)
    Fixed bug in mouse hover event.

v1.0.205 (04-Mar-2026)
    Mouse enter and mouse leave logic improved. 
        Combined controls like ComboBox & NumberPicker now provide bug free mouse enter and mouse leave events.

    
v1.0.204 (01-Mar-2026)
    Removed redundant code in wndproc functions. 
        Implemented base type message handling system and thus avoid hundred of lines of redundant code.