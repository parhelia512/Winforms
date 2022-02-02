

package main

import "core:fmt" 
import "core:mem"
//import "core:runtime"

import  ui "winforms"

// Global declarations

    Control :: ui.Control
    Form :: ui.Form
    MouseEventArgs :: ui.MouseEventArgs
    EventArgs :: ui.EventArgs
    KeyEventArgs :: ui.KeyEventArgs

    print :: fmt.println
    ptf :: fmt.printf
    pt :: fmt.print

    frm : ui.Form
    b1 : ui.Button 
    tb : ui.TextBox
    lb : ui.Label
    cb : ui.CheckBox
    mb : ui.ComboBox
    dp : ui.DateTimePicker
    //gb : ui.GroupBox
    lbx : ui.ListBox
    np : ui.NumberPicker
    pb : ui.ProgressBar
    pb2 : ui.ProgressBar
    rb : ui.RadioButton
    rb2 : ui.RadioButton
    cnt : int
    gec : int = 1
//

main :: proc() {   
    // Old code 
    track: mem.Tracking_Allocator
    mem.tracking_allocator_init(&track, context.allocator)
    context.allocator = mem.tracking_allocator(&track)
    using ui
    { // FORM
        frm = new_form(txt = "Odin is fun")    
        frm.font = new_font("Tahoma", 13)         
        frm.width = 700
        frm.right_click = btn_clk 
        frm.load = form_load 
        frm.mouse_click = frm_click  
        create_form(&frm)
    }       

    { // TEXTBOX
        tb = new_textbox(&frm)    
        tb.text = "Simple tb" 
       // tb.back_color = 0x8CC6C6
        //tb.focus_rect_color = 0x00FF00  
        create_textbox(&tb)
    }       

    { // LABEL
        lb = new_label(&frm, "Just a label")
        lb.ypos = 50
        lb.xpos = 10
        //lb.back_color = 0x000000
        lb.fore_color = 0x0000FF
        create_label(&lb)
    }
    { // CHECKBOX
        cb = new_checkbox(&frm, "Select Me", 175, 50)
        
        //cb.text_alignment = .right
        cb.fore_color = 0x008000
        //cb.back_color = 0xFF8000
        // cb.back_color = 0x00FF00
        create_checkbox(&cb)  
    }
    
    { // COMBOBOX 1
        mb = new_combobox(&frm)
        mb.xpos = 220
        mb.ypos = 10
        // mb.combo_style = .lb_combo
        mb.back_color = 0xE6E600
        mb.fore_color = 0x0000A0
        //mb.combo_style =.lb_combo   
        combo_add_items(&mb, "Vinod", "Vinayak", "Malu", "സിനിമ", 150, 25.1, 1000, b1.handle)
        // add_combo_item(&mb, 4568)
        //mb.list_closed = cbMleave   
        create_combo(&mb)
    }

    { // COMBO 2
         //ptf("combo hwnd - %s\n", fmt.tprint(mb.handle))
        cmb := new_combobox(&frm)
        cmb.xpos = 380
        cmb.ypos = 10
        cmb.combo_style = .lb_combo
        combo_add_items(&cmb, "Vinod", "Vinayak", "Malu", "സിനിമ", 150, 25.1, 1000, b1.handle)
        create_combo(&cmb)
    }
        
    { // BUTTON1
         b1 = new_button(&frm, "Color Btn", 10, 100)        
        b1.back_color = 0x800080
        b1.fore_color = 0xFFFFFF
        create_button(&b1)
    }      

    { // Button 2
        b2 := new_button(&frm, "Gradient Btn", 10, 150,)
        set_button_gradient(&b2, 0xDCE35B, 0x45B649)
        b2.mouse_click = grad_btn_click
        create_button(&b2)

        b3 := new_button(&frm, "Normal Btn", 10, 200,)  
        b3.mouse_click = gen_events      
        create_button(&b3)
    }
    { // DTP
        dp = new_datetimepicker(parent= &frm, w=140, h=25, x=175, y=100)
        // dp.xpos = 170
        // dp.ypos = 100
        // dp.text_changed = dtp_tb
        dp.format = .custom
        //dp.show_updown = true
        dp.format_string = "dd-MM-yyyy"
        //dp.short_day_names = true
        //dp.right_align = true
        create_datetimepicker(&dp)
    }

    // old code
    { // list box
        lbx = new_listbox(&frm)
        lbx.xpos = 330
        lbx.ypos = 50
        lbx.height = 120
        lbx.multi_selection = true
        lbx.key_preview = true    
        lbx.font = new_font("Calibri", 14) 
        lbx.back_color = 0xE4EB72
        lbx.fore_color = 0x0000A0
        //lbx.mouse_leave = gen_events  
        // lbx.selection_changed = dtp_tb
        listbox_add_items(&lbx, "Odin is amazing", "Try it", "It's a Better C", "And It's awesome")
        create_listbox(&lbx)
    }

    // NumberPicker
    {
        np = new_numberpicker(&frm, 175, 145, 100, 25)
      //  np.font = new_font("Hack", 14, true)
       // np.button_alignment = .left
        np.text_alignment = .center
        np.back_color = 0x8080FF
        np.fore_color = 0xFFFFFF
       np.step = 0.25
        np.auto_rotate = true
        //np.hide_selection = true
       // np.format_string = "%.3f"
        np.decimal_precision = 2
        // np.mouse_enter = gen_events
        //np.mouse_leave = gen_events
        //np.mouse_move = test_proc
        create_numberpicker(&np)
    }

    { // ProgressBar
        pb = new_progressbar(&frm, 175, 185, 200, 25)
        create_progressbar(&pb)

        pb2 = new_progressbar(&frm, 175, 215, 200, 25)
        progressbar_set_theme(&pb2, true, 0x8080FF)
        
        create_progressbar(&pb2)
    }
    
    { // Radio Button
        rb = new_radiobutton(&frm, "Radio 1", 525, 10, 120, 25)

        rb.fore_color = 0xA91655
        rb.checked = true
        create_radiobutton(&rb)

        rb2 = new_radiobutton(&frm, "Radio Button Model 1", 525, 40)
        rb2.fore_color = 0x0000FF
        create_radiobutton(&rb2)
    }

   
  
    start_form() 
    for _, v in track.allocation_map { ptf("%v leaked %v bytes\n", v.location, v.size) }
    for bf in track.bad_free_array { ptf("%v allocation %p was freed badly\n", bf.location, bf.memory) }  
    
}

form_load :: proc(s : ^Control, e : ^EventArgs) {
   // ui.control_set_focus(tb)
    print("loaded")
    ui.progressbar_set_value(&pb, 25)
    ui.progressbar_set_value(&pb2, 35)
}

test_proc :: proc(s : ^Control, e : ^MouseEventArgs) {          
    print("Your event worked successfully...", cnt )    
    cnt += 1
    print("----------------------------------------") 
}

btn_clk :: proc(s : ^Control, e : ^EventArgs) {  // connected to frm click
    print("form  clicked")
    ui.progressbar_pause_marquee(&pb)
} 

frm_click :: proc(s : ^Control, e : ^EventArgs) {
    ui.radiobutton_set_autocheck(&rb2, false)
}


mouse_events :: proc(s : ^Control, e : ^MouseEventArgs) {  
    //f.msg_box("You clicked on button")
    print("Mouse up  on worked")
} 

gen_events :: proc(s : ^Control, e : ^EventArgs) {   
    ptf(" general event worked [%d]\n", gec)
    //ui.control_enable(&np, false)
    gec += 1

}

cbMmove :: proc(s : ^Control, e : ^MouseEventArgs) {  
    print("cb mouse moving...")
}

cbMleave :: proc(s : ^Control, e : ^EventArgs) {
   
}
dtp_tb :: proc(s : ^Control, e : string) {
    print(" this is dtp value - ", e)
}

grad_btn_click :: proc(s : ^Control, e : ^EventArgs) {   
    ptf(" general event worked [%d]\n", gec)
    //ui.control_visibile(&mb, false)
    

}

