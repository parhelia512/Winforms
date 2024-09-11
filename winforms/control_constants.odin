
// Constants used for diff controls - Created on 31-Aug-2024 20:01

package winforms

// Button constants.
    MOUSE_CLICKED :: 0b1
    MOUSE_OVER :: 0b1000000
    BTN_FOCUSED :: 0b10000
    ROUND_FACTOR : i32 : 5
    txtFlag : UINT= DT_SINGLELINE | DT_VCENTER | DT_CENTER | DT_HIDEPREFIX

// End of Button constants.

// Calendar constants.
    MCM_FIRST :: 0x1000
    MCM_GETMINREQRECT :: (MCM_FIRST + 9)
    MCM_SETCOLOR :: (MCM_FIRST + 10)
    MCM_GETCALENDARGRIDINFO :: (MCM_FIRST + 24)

    MCN_FIRST :: 4294966550
    MCN_GETDAYSTATE :: (MCN_FIRST + 3)
    MCN_SELCHANGE :: (MCN_FIRST - 3)
    MCN_SELECT :: MCN_FIRST
    MCN_VIEWCHANGE :: (MCN_FIRST-4)

    MCMV_MONTH :: 0
    MCMV_YEAR :: 1
    MCMV_DECADE :: 2
    MCMV_CENTURY :: 3
    MCMV_MAX :: MCMV_CENTURY

    MCGIP_CALENDARBODY :: 6
    MCGIP_CALENDAR :: 4
    MCGIF_RECT :: 0x2
// End of Calendar constants.


// ContextMenu constants.
    TPM_RETURNCMD :: 0x0100
    TPM_FLAG : u32: TPM_LEFTBUTTON | TPM_RETURNCMD
    SRCCOPY : DWORD : 0x00CC0020
// End of ContextMenu constants.

// DTP constants.
    ICC_DATE_CLASSES :: 0x100
    DTM_GETIDEALSIZE :: (DTM_FIRST+15)
    DtnFirst :: u64(4294966556)
    DTN_DATETIMECHANGE :: u64(4294966537) //DTN_FIRST2-6
    DTN_DROPDOWN :: u64(4294967280) //u64(18446744073709550862) // DTN_FIRST2 - 1
    DTN_CLOSEUP :: u64(140728898419983) //u64(18446744073709550863) //DTN_FIRST2
    DTN_USERSTRINGW :: u64(18446744073709550871) //(DTN_FIRST-5)
    DTN_WMKEYDOWNW :: u64(18446744073709550872)   //(DTN_FIRST-4)
    DTN_FORMATW :: u64(18446744073709550873) //(DTN_FIRST-3)
    DTN_FORMATQUERYW :: u64(18446744073709550874) //(DTN_FIRST-2)
    DtnUserStr :: DtnFirst - 5

    DTM_FIRST :: 0x1000
    DTM_SETFORMATW :: DTM_FIRST + 50
	DTM_SETFORMATA :: 0x1005
    DTM_GETDATETIMEPICKERINFO :: DTM_FIRST + 14
    DTM_SETMCCOLOR :: DTM_FIRST + 6
    DTM_GETMCSTYLE :: (DTM_FIRST + 12)
    DTM_SETMCSTYLE  :: (DTM_FIRST + 11)
    DTM_SETSYSTEMTIME :: (DTM_FIRST + 2)

    MCSC_BACKGROUND :: 0
    MCSC_TEXT :: 1
    MCSC_TITLEBK :: 2
    CSC_TITLETEXT :: 3
    MCSC_MONTHBK :: 4
    MCSC_TRAILINGTEXT :: 5

    MCS_DAYSTATE :: 0x1
    MCS_MULTISELECT :: 0x2
    MCS_WEEKNUMBERS :: 0x4
    MCS_NOTODAYCIRCLE :: 0x8
    MCS_NOTODAY :: 0x10
    MCS_NOTRAILINGDATES :: 0x40
    MCS_SHORTDAYSOFWEEK :: 0x80
    MCS_NOSELCHANGEONNAV :: 0x100

    subVal : i32 = -1
    myDtnfirst : u64 : 4294966556
    myDtnFirst2 : u64 : 4294966543
    myDtnDropdown : u64 : 4294966542
    myDtnCloseup := myDtnFirst2

    DTS_UPDOWN :: 0x1
    DTS_SHOWNONE :: 0x2
    DTS_SHORTDATEFORMAT :: 0x0
    DTS_LONGDATEFORMAT :: 0x4
    DTS_SHORTDATECENTURYFORMAT :: 0xc
    DTS_TIMEFORMAT :: 0x9
    DTS_APPCANPARSE :: 0x10
    DTS_RIGHTALIGN :: 0x20

// End of DTP constants.

// GroupBox constants.
    gbstyle : DWORD : WS_CHILD | WS_VISIBLE | BS_GROUPBOX
    gbexstyle : DWORD : WS_EX_CONTROLPARENT | WS_EX_LEFT | WS_EX_TRANSPARENT
// End of GroupBox constants.

// Form Constants
    menuTxtFlag :: DT_LEFT | DT_SINGLELINE | DT_VCENTER

// End of Form constants

// ListBox constants.
    LBS_DISABLENOSCROLL :: 4096
    LBS_EXTENDEDSEL :: 0x800
    LBS_HASSTRINGS :: 64
    LBS_MULTICOLUMN :: 512
    LBS_MULTIPLESEL :: 8
    LBS_NODATA :: 0x2000
    LBS_NOINTEGRALHEIGHT :: 256
    LBS_NOREDRAW :: 4
    LBS_NOSEL :: 0x4000
    LBS_NOTIFY :: 1
    LBS_OWNERDRAWFIXED :: 16
    LBS_OWNERDRAWVARIABLE :: 32
    LBS_SORT :: 2
    LBS_STANDARD :: 0xa00003
    LBS_USETABSTOPS :: 128
    LBS_WANTKEYBOARDINPUT :: 0x400

    LB_ADDFILE :: 406
    LB_ADDSTRING :: 384
    LB_DELETESTRING :: 386
    LB_DIR :: 397
    LB_ERR :: -1
    LB_FINDSTRING :: 399
    LB_FINDSTRINGEXACT :: 418
    LB_GETANCHORINDEX :: 413
    LB_GETCARETINDEX :: 415
    LB_GETCOUNT :: 395
    LB_GETCURSEL :: 392
    LB_GETHORIZONTALEXTENT :: 403
    LB_GETITEMDATA :: 409
    LB_GETITEMHEIGHT :: 417
    LB_GETITEMRECT :: 408
    LB_GETLOCALE :: 422
    LB_GETSEL :: 391
    LB_GETSELCOUNT :: 400
    LB_GETSELITEMS :: 401
    LB_GETTEXT :: 393
    LB_GETTEXTLEN :: 394
    LB_GETTOPINDEX :: 398
    LB_INITSTORAGE :: 424
    LB_INSERTSTRING :: 385
    LB_ITEMFROMPOINT :: 425
    LB_RESETCONTENT :: 388
    LB_SELECTSTRING :: 396
    LB_SELITEMRANGE :: 411
    LB_SELITEMRANGEEX :: 387
    LB_SETANCHORINDEX :: 412
    LB_SETCARETINDEX :: 414
    LB_SETCOLUMNWIDTH :: 405
    LB_SETCOUNT :: 423
    LB_SETCURSEL :: 390
    LB_SETHORIZONTALEXTENT :: 404
    LB_SETITEMDATA :: 410
    LB_SETITEMHEIGHT :: 416
    LB_SETLOCALE :: 421
    LB_SETSEL :: 389
    LB_SETTABSTOPS :: 402
    LB_SETTOPINDEX :: 407
    LB_GETLISTBOXINFO :: 434


    LBN_DBLCLK :: 2
    LBN_ERRSPACE :: -2
    LBN_KILLFOCUS :: 5
    LBN_SELCANCEL :: 3
    LBN_SELCHANGE :: 1
    LBN_SETFOCUS :: 4
// End of ListBox constants.

// ListView constants.
    LVS_ICON :: 0x0
		LVS_REPORT :: 0x1
		LVS_SMALLICON :: 0x2
		LVS_LIST :: 0x3
		LVS_TYPEMASK :: 0x3
		LVS_SINGLESEL :: 0x4
		LVS_SHOWSELALWAYS :: 0x8
		LVS_SORTASCENDING :: 0x10
		LVS_SORTDESCENDING :: 0x20
		LVS_SHAREIMAGELISTS :: 0x40
		LVS_NOLABELWRAP :: 0x80
		LVS_AUTOARRANGE :: 0x100
		LVS_EDITLABELS :: 0x200
		LVS_OWNERDATA :: 0x1000
		LVS_NOSCROLL :: 0x2000
		LVS_ALIGNTOP :: 0x0
		LVS_ALIGNLEFT :: 0x800
		LVS_ALIGNMASK :: 0xc00


		LVS_EX_GRIDLINES :: 0x1
		LVS_EX_SUBITEMIMAGES :: 0x2
		LVS_EX_CHECKBOXES :: 0x4
		LVS_EX_TRACKSELECT :: 0x8
		LVS_EX_HEADERDRAGDROP :: 0x10
		LVS_EX_FULLROWSELECT :: 0x20
		LVS_EX_ONECLICKACTIVATE :: 0x40
		LVS_EX_TWOCLICKACTIVATE :: 0x80
		LVS_EX_FLATSB :: 0x100
		LVS_EX_REGIONAL :: 0x200
		LVS_EX_INFOTIP :: 0x400
		LVS_EX_UNDERLINEHOT :: 0x800
		LVS_EX_UNDERLINECOLD :: 0x1000
		LVS_EX_MULTIWORKAREAS :: 0x2000
		LVS_EX_LABELTIP :: 0x4000
		LVS_EX_BORDERSELECT :: 0x8000
		LVS_EX_DOUBLEBUFFER :: 0x10000
		LVS_EX_HIDELABELS :: 0x20000
		LVS_EX_SINGLEROW :: 0x40000
		LVS_EX_SNAPTOGRID :: 0x80000
		LVS_EX_SIMPLESELECT :: 0x100000
		LVS_NOCOLUMNHEADER  :: 0x4000
		LVS_NOSORTHEADER    :: 0x8000

		LVCF_FMT :: 0x1
		LVCF_WIDTH :: 0x2
		LVCF_TEXT :: 0x4
		LVCF_SUBITEM :: 0x8
		LVCF_IMAGE :: 0x10
		LVCF_ORDER :: 0x20

		LVCFMT_LEFT :: 0x0
		LVCFMT_RIGHT :: 0x1
		LVCFMT_CENTER :: 0x2
		LVCFMT_JUSTIFYMASK :: 0x3
		LVCFMT_IMAGE :: 0x800
		LVCFMT_BITMAP_ON_RIGHT :: 0x1000
		LVCFMT_COL_HAS_IMAGES :: 0x8000

		LVIF_DI_SETITEM :: 0x1000
		LVIF_TEXT :: 0x1
		LVIF_IMAGE :: 0x2
		LVIF_PARAM :: 0x4
		LVIF_STATE :: 0x8
		LVIF_INDENT :: 0x10
		LVIF_NORECOMPUTE :: 0x800
		LVIF_GROUPID :: 0x100
		LVIF_COLUMNS :: 0x200

		LVM_FIRST :: 0x1000

		LVM_SETEXTENDEDLISTVIEWSTYLE :: (LVM_FIRST+54)
		LVM_INSERTCOLUMNW :: (LVM_FIRST+97)
		LVM_INSERTITEM :: (LVM_FIRST+77)
		LVM_SETITEMTEXT :: (LVM_FIRST+116)
		LVM_SETIMAGELIST :: (LVM_FIRST+3)

        LVN_ITEMCHANGING :: (LVN_FIRST-0)
        LVN_ITEMCHANGED :: (LVN_FIRST-1)
	// Const1

	// U64_MAX := max(u64)
		LVN_FIRST :: 4294967196 //(U64_MAX - 100) + 1

		LV_WM_SETREDRAW :: 0x000B
		LVN_COLUMNCLICK ::      (LVN_FIRST-8)

		DEF_HDR_TXT_FLAG : UINT: DT_SINGLELINE | DT_VCENTER | DT_CENTER | DT_NOPREFIX

		HDM_FIRST ::0x1200
		HDM_LAYOUT :: (HDM_FIRST + 5)
		HDM_HITTEST ::(HDM_FIRST + 6)
		HDM_GETITEMRECT :: (HDM_FIRST + 7)


// End of ListView constants.

// Menu constants.

// End of Menu constants.

// NumberPicker constants.
    UD_MAXVAL :: 0x7fff
    UD_MINVAL :: (-UD_MAXVAL)
    ICC_UPDOWN_CLASS :: 0x10
    UDS_WRAP :: 0x1
    UDS_SETBUDDYINT :: 0x2
    UDS_ALIGNRIGHT :: 0x4
    UDS_ALIGNLEFT :: 0x8
    UDS_AUTOBUDDY :: 0x10
    UDS_ARROWKEYS :: 0x20
    UDS_HORZ :: 0x40
    UDS_NOTHOUSANDS :: 0x80
    UDS_HOTTRACK :: 0x100
    DCX_WINDOW1 : u32 : 0x00000001
    DCX_INTERSECTRGN1 : u32 : 0x00000080 
    ETO_OPAQUE : u32 :    0x0002
    EN_UPDATE :: 1024
    UDN_FIRST :: (UINT_MAX - 721)
    UDN_DELTAPOS :: (UDN_FIRST - 1)
    swp_flag : DWORD: SWP_SHOWWINDOW | SWP_NOACTIVATE | SWP_NOZORDER

// End of NumberPicker constants.

// ProgressBar Constants
    ICC_PROGRESS_CLASS :: 0x20
    PBS_SMOOTH :: 0x1
    PBS_VERTICAL :: 0x4
    PBS_MARQUEE :: 0x8
    PBM_SETBKCOLOR :: (0x2000 + 1)
    PBM_SETMARQUEE :: (WM_USER + 10)

    TMT_FILLCOLOR :: 3802
    DTT_COLORPROP :: 128
    DTT_SHADOWCOLOR :: 4
// End of ProgressBar Constants

// TextBox constants.
    EN_SETFOCUS :: 256
    UIS_CLEAR :: 2
    UISF_HIDEFOCUS :: 0x1
    TBSTYLE :: WS_CHILD | WS_VISIBLE | ES_LEFT | WS_TABSTOP | 
                 ES_AUTOHSCROLL | WS_OVERLAPPED |
                 WS_CLIPCHILDREN|WS_CLIPSIBLINGS
    TBEXSTYLE :: WS_EX_LEFT | WS_EX_LTRREADING  | WS_EX_CLIENTEDGE

// End of TextBox constants.

// TrackBar Constants
    TBS_AUTOTICKS :: 0x1
    TBS_VERT :: 0x2
    TBS_HORZ :: 0x0
    TBS_TOP :: 0x4
    TBS_BOTTOM :: 0x0
    TBS_LEFT :: 0x4
    TBS_RIGHT :: 0x0
    TBS_BOTH :: 0x8
    TBS_NOTICKS :: 0x10
    TBS_ENABLESELRANGE :: 0x20
    TBS_FIXEDLENGTH :: 0x40
    TBS_NOTHUMB :: 0x80
    TBS_TOOLTIPS :: 0x100
    TBS_REVERSED :: 0x200
    TBS_DOWNISLEFT :: 0x400

    THUMB_LINE_LOW :: 0
    THUMB_LINE_HIGH :: 1
    THUMB_PAGE_LOW :: 2
    THUMB_PAGE_HIGH :: 3
    TB_THUMBPOSITION :: 4
    TB_THUMBTRACK :: 5

    TBCD_TICS : u32 : 0x1
    TBCD_THUMB : u32 : 0x2
    TBCD_CHANNEL : u32 : 0x3

    BIG_CHANNEL_EDGE :: BF_ADJUST | BF_RECT | BF_FLAT
    _def_tkb_width :: 150
    _def_tkb_height :: 30
// End of TrackBar Constants

// TreeView Constants
    ICC_TREEVIEW_CLASSES :: 0x2
    TVS_HASBUTTONS :: 0x1
    TVS_HASLINES :: 0x2
    TVS_LINESATROOT :: 0x4
    TVS_EDITLABELS :: 0x8
    TVS_DISABLEDRAGDROP :: 0x10
    TVS_SHOWSELALWAYS :: 0x20
    TVS_RTLREADING :: 0x40
    TVS_NOTOOLTIPS :: 0x80
    TVS_CHECKBOXES :: 0x100
    TVS_TRACKSELECT :: 0x200
    TVS_SINGLEEXPAND :: 0x400
    TVS_INFOTIP :: 0x800
    TVS_FULLROWSELECT :: 0x1000
    TVS_NOSCROLL :: 0x2000
    TVS_NONEVENHEIGHT :: 0x4000
    TVS_NOHSCROLL :: 0x8000
    TVS_EX_NOSINGLECOLLAPSE :: 0x1

    TVIS_STATEIMAGEMASK :: 0xF000
    TVIS_USERMASK :: 0xF000

    // The +1 is needed. Add always +1 to this type of expressions.
    TVI_ROOT :: HTREEITEM(cast(UINT_PTR)(U64MAX - 0x10000) + 1) 
    TVI_FIRST :: HTREEITEM(cast(UINT_PTR)(U64MAX - 0xffff) + 1)
    TVI_LAST :: HTREEITEM(cast(UINT_PTR)(U64MAX - 0xfffe) + 1)
    TVI_SORT :: HTREEITEM(cast(UINT_PTR)(U64MAX - 0xfffd) + 1)

    TVIF_CHILDREN :: 0x40
    TVIF_DI_SETITEM :: 0x1000
    TVIF_HANDLE :: 0x10
    TVIF_IMAGE :: 0x2
    TVIF_INTEGRAL :: 0x80
    TVIF_PARAM :: 0x4
    TVIF_SELECTEDIMAGE :: 0x20
    TVIF_STATE :: 0x8
    TVIF_TEXT :: 0x1

    TVE_COLLAPSE      :: 1
    TVE_EXPAND        :: 2
    TVE_TOGGLE        :: 3
    TVE_COLLAPSERESET :: 0x8000

    TVNA_ADD :: 1
    TVNA_ADDFIRST :: 2
    TVNA_ADDCHILD :: 3
    TVNA_ADDCHILDFIRST :: 4
    TVNA_INSERT :: 5

    TVIML_FLAG :: 0x00000020 | 0x00000001

    TV_FIRST :: 0x1100
    TVN_FIRST :: 4294966896
    TVM_DELETEITEM :: (TV_FIRST+1)
    TVM_EXPAND  :: TV_FIRST + 2
    TVM_INSERTITEMW :: (TV_FIRST + 50)
    TVM_SETIMAGELIST :: (TV_FIRST + 9)
    TVM_SETBKCOLOR :: (TV_FIRST + 29)
    TVM_SETTEXTCOLOR :: (TV_FIRST + 30)
    TVM_SETLINECOLOR :: (TV_FIRST + 40)

    TVN_KEYDOWN :: (TVN_FIRST-12)
    TVN_SINGLEEXPAND :: (TVN_FIRST-15)
    TVN_ITEMCHANGINGW ::  (TVN_FIRST-17)
    TVN_ITEMCHANGEDW  :: (TVN_FIRST-19)

    TVN_SELCHANGINGW :: (TVN_FIRST-50)
    TVN_SELCHANGEDW  :: (TVN_FIRST-51)
    TVN_GETDISPINFOW ::(TVN_FIRST-52)
    TVN_ITEMEXPANDINGW :: (TVN_FIRST-54)
    TVN_ITEMEXPANDEDW :: (TVN_FIRST-55)
    TVN_DELETEITEMW :: (TVN_FIRST-58)
    TVN_BEGINLABELEDITW :: (TVN_FIRST-59)
    TVN_ENDLABELEDITW :: (TVN_FIRST-60)

    NM_TVSTATEIMAGECHANGING :: 4294967272 //(NM_FIRST-24) // it is equal to (max(u32) - 24) + 1

    TVC_UNKNOWN  :: 0x0
    TVC_BYMOUSE :: 0x1
    TVC_BYKEYBOARD :: 0x2
// End of TreeView Constants