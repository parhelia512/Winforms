
/*===========================GroupBox Docs==============================
    GroupBox struct
        Constructor: new_groupbox() -> ^GroupBox
        Properties:
            All props from Control struct
        Functions:
            gbx
            gby
        Events:
            All events from Control struct
        
===============================================================================*/
//TODO - Use double buffering bkg fill when user changes the size of groubox.

package winforms

// import "core:fmt"
import "base:runtime"
import api "core:sys/windows"

PENWIDTH :i32: 4
HTTRANSPARENT :: -1
HTCLIENT :: 1


GroupBox :: struct
{
    using control : Control,
    _gbStyle: GroupBoxStyle,
    _bkBrush : HBRUSH,
    _hbmp: HBITMAP,
    _pen : HPEN,
    _memDC : HDC,
    _rct : RECT,
    _txtWidth : i32,
    _paintBkg : b64,
    _dbFill: b64,
    _getWidth: b64,
    _themeOff: b64,
    _controls : [dynamic]^Control,
    
}

// Groupbox control's constructor
new_groupbox :: proc{gb_ctor1, gb_ctor2}

gbx :: #force_inline proc(this: ^GroupBox, offset: i32) -> i32
{
    return this.xpos + offset
}

gby :: #force_inline proc(this: ^GroupBox, offset: i32) -> i32
{
    return this.ypos + offset
}

//==============================Private Functions==================================
@private gb_count : int = 1

@private gb_ctor :: proc(p : ^Control, txt : string, x, y, w, h : i32, gStyle: GroupBoxStyle) -> ^GroupBox
{
    // if WcGroupBoxW == nil do WcGroupBoxW = to_wstring()
    this := new(GroupBox) 
    this.kind = .Group_Box   
    control_base_init(this, p, x, y, w, h, &gb_count, txt)
    this._createHandleProc = gb_create_handle
    this._dbFill = true
    this._getWidth = true        
    return this
}

@private gb_ctor1 :: proc(parent : ^Control) -> ^GroupBox
{
    gb_txt : string = conc_num("GroupBox_", gb_count)
    this := gb_ctor(parent, gb_txt, 10, 10, 250, 250, .System)
    gb_count += 1
    // if this._ownerForm.createChilds do create_control(this)
    return this
}

@private gb_ctor2 :: proc(parent : ^Control,
                            txt : string,
                            x, y : i32, w: i32 = 200, h: i32 = 200, 
                            style: GroupBoxStyle = .System) -> ^GroupBox
{
    this := gb_ctor(parent, txt, x, y, w, h, style)
    gb_count += 1
    // if this._ownerForm.createChilds do create_control(this)
    return this
}

@private gb_create_handle :: proc(ctl: ^Control)
{
	this := cast(^GroupBox)ctl
	this._bkBrush = get_solid_brush(this.backColor)
    if this.foreColor != def_fgc.value {
        if this._gbStyle != .Classic do this._gbStyle = .Overriden
    }
    if this._gbStyle == .Overriden {
        this._getWidth = true
        this._pen = CreatePen(PS_SOLID, PENWIDTH, get_color_ref(this.backColor))
    }
    this._rct = RECT{0, 0, this.width, this.height}
    this._fcref = get_color_ref(this.foreColor)	
	create_control(ctl, this.width, this.height)
	if this._gbStyle == .Classic {
        SetWindowTheme(this.handle, EWCAPTR, EWCAPTR)
        this._themeOff = true
    }
	set_subclass(this, gb_wnd_proc)	
    if this._ownerForm._enablePrintPoint do this.onMouseUp = print_point_func
}


gbx_add_controls :: proc(this: ^GroupBox, items: ..^Control) {
    if this._isCreated {
        for item in items {
           append(&this._controls, item)
           if item.kind == .Label do item.backColor = this.backColor
        }
    }
}

gbx_set_backcolor :: proc(this: ^GroupBox, clr: uint)
{
    this.backColor = clr
    resetGdiObjects(this, true)
    check_redraw(this)
}

gbx_set_height :: proc(this: ^GroupBox, value: i32)
{
    this.height = value
    resetGdiObjects(this, false)
    if this._isCreated do control_setpos(this, SWP_NOZORDER)
}

gbx_set_width :: proc(this: ^GroupBox, value: i32)
{
    this.width = value
    resetGdiObjects(this, false)
    if this._isCreated do control_setpos(this, SWP_NOZORDER)
}

gbx_set_text :: proc(this: ^GroupBox, value: string)
{
    this.text = value
    widestring_update(&this._wtext, value)
    this._getWidth = true
    if this._isCreated do SetWindowText(this.handle, this._wtext.ptr)
    check_redraw(this)
}

gbx_set_font :: proc(this: ^GroupBox, fname: string, fsize: int, fweight: FontWeight = .Normal)
{
    font_change_font(&this.font, fname, fsize, fweight)
    this._getWidth = true
    ctl_send_msg(this.handle, WM_SETFONT, this.font.handle, 1)
    check_redraw(this)
}

gbx_set_font1 :: proc(this: ^GroupBox, value: ^Font) {
    font_clone(&this.font, value)
    this._getWidth = true
    ctl_send_msg(this.handle, WM_SETFONT, this.font.handle, 1)
    check_redraw(this)
}

gbx_set_style :: proc(this: ^GroupBox, value: GroupBoxStyle) {
    this._gbStyle = value
    if value == .Classic {
        if !this._themeOff {
            SetWindowTheme(this.handle, EWCAPTR, EWCAPTR)
            this._themeOff = true
        }
    } else if value == .Overriden {
        this._getWidth = true
        this._pen = CreatePen(PS_SOLID, PENWIDTH, get_color_ref(this.backColor))
    }
    check_redraw(this)
}


@private resetGdiObjects :: proc(this: ^GroupBox, brpn: b64) 
{
    if brpn {
        if this._bkBrush != nil do delete_gdi_object(this._bkBrush)
        this._bkBrush = get_solid_brush(this.backColor)
        if this._gbStyle == .Overriden {
            if this._pen != nil do delete_gdi_object(this._pen)        
            this._pen = CreatePen(PS_SOLID, PENWIDTH, get_color_ref(this.backColor))
        }
    }
    if this._memDC != nil do DeleteDC(this._memDC)
    if this._hbmp != nil do delete_gdi_object(this._hbmp)    
    this._dbFill = true
}

@private gbx_property_setter:: proc(this: ^GroupBox, prop: GroupBoxProps, value: $T)
{
	switch prop {
		case .Back_Color:
            when T == uint do gbx_set_backcolor(this, value)
        case .Font:
            when T == Font do gbx_set_font1(this, value)
		case .Height:
            when T == int do gbx_set_height(this, value)            
		case .Text:
            when T == string do gbx_set_text(this, value)
		case .Width:
            when T == int do gbx_set_width(this, value)
	}
}

@private gb_finalize :: proc(this: ^GroupBox)
{
    delete_gdi_object(this._bkBrush)
    delete_gdi_object(this._pen)
    delete_gdi_object(this._hbmp)
    DeleteDC(this._memDC)
    control_base_dtor(this) 
    delete(this._controls)  
    free(this)
}

@private gb_wnd_proc :: proc "stdcall" (hw: HWND, msg: u32, wp: WPARAM, lp: LPARAM,
                                    sc_id: UINT_PTR, ref_data: DWORD_PTR) -> LRESULT
{
    // context = runtime.default_context()
    context = global_context
    this := control_cast(GroupBox, ref_data)
     res := ctrl_common_msg_handler(this, hw, msg, wp, lp) 
    #partial switch res {
        case .Call_Def_Proc: return DefSubclassProc(hw, msg, wp, lp)
        case .Immediate_Return: return 1
    }
    //display_msg(msg)
    
    switch msg {
    case WM_NCDESTROY : 
        RemoveWindowSubclass(hw, gb_wnd_proc, sc_id)
        gb_finalize(this)

    case WM_NCHITTEST:
        hit := DefSubclassProc(hw, msg, wp, lp)
        if hit == HTTRANSPARENT do return HTCLIENT
        return hit

    case WM_PAINT :            
        if this._gbStyle == .Overriden {
            ret := DefSubclassProc(hw, msg, wp, lp)
            gfx := new_graphics(hw)
            defer gfx_destroy(gfx)
            gfx_draw_hline(gfx, this._pen, 10, 12, this._txtWidth)
            gfx_draw_text(gfx, this, 12, 0)
        }

    case CM_STATIC_COLOR:
        if this._gbStyle == .Classic {
            hdc := dir_cast(wp, HDC)
            api.SetBkMode(hdc, api.BKMODE.TRANSPARENT)                
            SetTextColor(hdc, get_color_ref(this.foreColor))
        }
        return dir_cast(this._bkBrush, LRESULT)

    case WM_GETTEXTLENGTH:
        if this._gbStyle == .Overriden do return 0

    case WM_NOTIFY :
        nm := dir_cast(lp, ^NMHDR)
        return SendMessage(nm.hwndFrom, CM_NOTIFY, wp, lp )
    
    case WM_CTLCOLOREDIT :
        ctl_hwnd := dir_cast(lp, HWND)
        return SendMessage(ctl_hwnd, CM_EDIT_COLOR, wp, lp)

    case WM_CTLCOLORSTATIC :
        ctl_hwnd := dir_cast(lp, HWND)
        return SendMessage(ctl_hwnd, CM_STATIC_COLOR, wp, lp)

    case WM_CTLCOLORLISTBOX :
            /* ================================================================================
            If user uses a ComboBox, it contains a ListBox in it.
            So, 'ctlHwnd' might be a handle of that ListBox. Or it might be a normal ListBox too.
            So, we need to check it before disptch this message to that listbox.
            Because, if it is from Combo's listbox, there is no Wndproc function for that ListBox. 
            =======================================================================================*/
            ctl_hwnd := dir_cast(lp, HWND)
            cmb_hwnd, okay := find_combo_data(this._ownerForm, ctl_hwnd)
            if okay  {
                // This message is from a combo's listbox. Divert it to that combo box.
                return SendMessage(cmb_hwnd, CM_COMBOLBCOLOR, wp, lp)
            } else {
                // This message is from a normal listbox. send it to it's wndproc.
                return SendMessage(ctl_hwnd, CM_LIST_COLOR, wp, lp)
            }

    case WM_ERASEBKGND:
        hdc := dir_cast(wp, HDC)
        if this._getWidth {
            sz : SIZE    
            select_gdi_object(hdc, this.font.handle)
            GetTextExtentPoint32(hdc, this._wtext.ptr, this._wtext.strLen, &sz)                
            this._txtWidth = sz.cx + 10
            this._getWidth = false
        }
        if this._dbFill {
            this._memDC = CreateCompatibleDC(hdc)
            this._hbmp = CreateCompatibleBitmap(hdc, i32(this.width), i32(this.height))
            select_gdi_object(this._memDC, this._hbmp)
            api.FillRect(this._memDC, &this._rct, this._bkBrush)  
            this._dbFill = false
        }
        BitBlt(hdc, 0, 0, i32(this.width), i32(this.height), this._memDC, 0, 0, SRCCOPY)
        return 1        

    case :
        return DefSubclassProc(hw, msg, wp, lp)
    }
    return DefSubclassProc(hw, msg, wp, lp)
}