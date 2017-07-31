
{*******************************************************}
{                                                       }
{       Delphi Runtime Library                          }
{       Windows 32bit API Interface Unit                }
{                                                       }
{       Copyright (c) 1996 Borland International        }
{                                                       }
{*******************************************************}

unit OleCtl;

{ NOPACKAGEUNIT}

interface

uses Windows, Messages, Ole2;

const

{ OLE control status codes }

  CTL_E_ILLEGALFUNCTIONCALL       = $800A0000 + 5;
  CTL_E_OVERFLOW                  = $800A0000 + 6;
  CTL_E_OUTOFMEMORY               = $800A0000 + 7;
  CTL_E_DIVISIONBYZERO            = $800A0000 + 11;
  CTL_E_OUTOFSTRINGSPACE          = $800A0000 + 14;
  CTL_E_OUTOFSTACKSPACE           = $800A0000 + 28;
  CTL_E_BADFILENAMEORNUMBER       = $800A0000 + 52;
  CTL_E_FILENOTFOUND              = $800A0000 + 53;
  CTL_E_BADFILEMODE               = $800A0000 + 54;
  CTL_E_FILEALREADYOPEN           = $800A0000 + 55;
  CTL_E_DEVICEIOERROR             = $800A0000 + 57;
  CTL_E_FILEALREADYEXISTS         = $800A0000 + 58;
  CTL_E_BADRECORDLENGTH           = $800A0000 + 59;
  CTL_E_DISKFULL                  = $800A0000 + 61;
  CTL_E_BADRECORDNUMBER           = $800A0000 + 63;
  CTL_E_BADFILENAME               = $800A0000 + 64;
  CTL_E_TOOMANYFILES              = $800A0000 + 67;
  CTL_E_DEVICEUNAVAILABLE         = $800A0000 + 68;
  CTL_E_PERMISSIONDENIED          = $800A0000 + 70;
  CTL_E_DISKNOTREADY              = $800A0000 + 71;
  CTL_E_PATHFILEACCESSERROR       = $800A0000 + 75;
  CTL_E_PATHNOTFOUND              = $800A0000 + 76;
  CTL_E_INVALIDPATTERNSTRING      = $800A0000 + 93;
  CTL_E_INVALIDUSEOFNULL          = $800A0000 + 94;
  CTL_E_INVALIDFILEFORMAT         = $800A0000 + 321;
  CTL_E_INVALIDPROPERTYVALUE      = $800A0000 + 380;
  CTL_E_INVALIDPROPERTYARRAYINDEX = $800A0000 + 381;
  CTL_E_SETNOTSUPPORTEDATRUNTIME  = $800A0000 + 382;
  CTL_E_SETNOTSUPPORTED           = $800A0000 + 383;
  CTL_E_NEEDPROPERTYARRAYINDEX    = $800A0000 + 385;
  CTL_E_SETNOTPERMITTED           = $800A0000 + 387;
  CTL_E_GETNOTSUPPORTEDATRUNTIME  = $800A0000 + 393;
  CTL_E_GETNOTSUPPORTED           = $800A0000 + 394;
  CTL_E_PROPERTYNOTFOUND          = $800A0000 + 422;
  CTL_E_INVALIDCLIPBOARDFORMAT    = $800A0000 + 460;
  CTL_E_INVALIDPICTURE            = $800A0000 + 481;
  CTL_E_PRINTERERROR              = $800A0000 + 482;
  CTL_E_CANTSAVEFILETOTEMP        = $800A0000 + 735;
  CTL_E_SEARCHTEXTNOTFOUND        = $800A0000 + 744;
  CTL_E_REPLACEMENTSTOOLONG       = $800A0000 + 746;

  CTL_E_CUSTOM_FIRST = $800A0000 + 600;

{ IClassFactory2 status codes }

  CLASS_E_NOTLICENSED = CLASSFACTORY_E_FIRST + 2;

{ IConnectionPoint status codes }

  CONNECT_E_FIRST = $80040200;
  CONNECT_E_LAST  = $8004020F;
  CONNECT_S_FIRST = $00040200;
  CONNECT_S_LAST  = $0004020F;

  CONNECT_E_NOCONNECTION  = CONNECT_E_FIRST + 0;
  CONNECT_E_ADVISELIMIT   = CONNECT_E_FIRST + 1;
  CONNECT_E_CANNOTCONNECT = CONNECT_E_FIRST + 2;
  CONNECT_E_OVERRIDDEN    = CONNECT_E_FIRST + 3;

{ DllRegisterServer/DllUnregisterServer status codes }

  SELFREG_E_FIRST = $80040200;
  SELFREG_E_LAST  = $80040200;
  SELFREG_S_FIRST = $00040200;
  SELFREG_S_LAST  = $00040200;

  SELFREG_E_TYPELIB = SELFREG_E_FIRST + 0;
  SELFREG_E_CLASS   = SELFREG_E_FIRST + 1;

{ IPerPropertyBrowsing status codes }

  PERPROP_E_FIRST = $80040200;
  PERPROP_E_LAST  = $8004020F;
  PERPROP_S_FIRST = $00040200;
  PERPROP_S_LAST  = $0004020F;

  PERPROP_E_NOPAGEAVAILABLE = PERPROP_E_FIRST + 0;

{ Additional OLEMISC constants }

  OLEMISC_INVISIBLEATRUNTIME = $00000400;
  OLEMISC_ALWAYSRUN          = $00000800;
  OLEMISC_ACTSLIKEBUTTON     = $00001000;
  OLEMISC_ACTSLIKELABEL      = $00002000;
  OLEMISC_NOUIACTIVATE       = $00004000;
  OLEMISC_ALIGNABLE          = $00008000;
  OLEMISC_SIMPLEFRAME        = $00010000;
  OLEMISC_SETCLIENTSITEFIRST = $00020000;
  OLEMISC_IMEMODE            = $00040000;

{ Additional OLEIVERB constants }

  OLEIVERB_PROPERTIES = -7;

{ Additional variant type tags for property sets }

  VT_STREAMED_PROPSET = 73;  { Stream contains a property set }
  VT_STORED_PROPSET   = 74;  { Storage contains a property set }
  VT_BLOB_PROPSET     = 75;  { Blob contains a property set }

{ Variant type tags that are just aliases for others }

  VT_COLOR          = VT_I4;
  VT_XPOS_PIXELS    = VT_I4;
  VT_YPOS_PIXELS    = VT_I4;
  VT_XSIZE_PIXELS   = VT_I4;
  VT_YSIZE_PIXELS   = VT_I4;
  VT_XPOS_HIMETRIC  = VT_I4;
  VT_YPOS_HIMETRIC  = VT_I4;
  VT_XSIZE_HIMETRIC = VT_I4;
  VT_YSIZE_HIMETRIC = VT_I4;
  VT_TRISTATE       = VT_I2;
  VT_OPTEXCLUSIVE   = VT_BOOL;
  VT_FONT           = VT_DISPATCH;
  VT_PICTURE        = VT_DISPATCH;
  VT_HANDLE         = VT_I4;

{ Reflected window message IDs }

  OCM__BASE = WM_USER + $1C00;

  OCM_COMMAND           = OCM__BASE + WM_COMMAND;
  OCM_CTLCOLORBTN       = OCM__BASE + WM_CTLCOLORBTN;
  OCM_CTLCOLOREDIT      = OCM__BASE + WM_CTLCOLOREDIT;
  OCM_CTLCOLORDLG       = OCM__BASE + WM_CTLCOLORDLG;
  OCM_CTLCOLORLISTBOX   = OCM__BASE + WM_CTLCOLORLISTBOX;
  OCM_CTLCOLORMSGBOX    = OCM__BASE + WM_CTLCOLORMSGBOX;
  OCM_CTLCOLORSCROLLBAR = OCM__BASE + WM_CTLCOLORSCROLLBAR;
  OCM_CTLCOLORSTATIC    = OCM__BASE + WM_CTLCOLORSTATIC;
  OCM_DRAWITEM          = OCM__BASE + WM_DRAWITEM;
  OCM_MEASUREITEM       = OCM__BASE + WM_MEASUREITEM;
  OCM_DELETEITEM        = OCM__BASE + WM_DELETEITEM;
  OCM_VKEYTOITEM        = OCM__BASE + WM_VKEYTOITEM;
  OCM_CHARTOITEM        = OCM__BASE + WM_CHARTOITEM;
  OCM_COMPAREITEM       = OCM__BASE + WM_COMPAREITEM;
  OCM_HSCROLL           = OCM__BASE + WM_HSCROLL;
  OCM_VSCROLL           = OCM__BASE + WM_VSCROLL;
  OCM_PARENTNOTIFY      = OCM__BASE + WM_PARENTNOTIFY;

{ TControlInfo.dwFlags masks }

  CTRLINFO_EATS_RETURN = 1;  { Control doesn't send Return to container }
  CTRLINFO_EATS_ESCAPE = 2;  { Control doesn't send Escape to container }

{ IOleControlSite.TransformCoords flags }

  XFORMCOORDS_POSITION            = 1;
  XFORMCOORDS_SIZE                = 2;
  XFORMCOORDS_HIMETRICTOCONTAINER = 4;
  XFORMCOORDS_CONTAINERTOHIMETRIC = 8;

{ IPropertyPageSite.OnStatusChange flags }

  PROPPAGESTATUS_DIRTY    = 1;  { Values in page have changed }
  PROPPAGESTATUS_VALIDATE = 2;  { Appropriate time to validate/apply }

{ Picture attributes }

  PICTURE_SCALABLE    = 1;
  PICTURE_TRANSPARENT = 2;

{ TPictDesc.picType values }

  PICTYPE_UNINITIALIZED = -1;
  PICTYPE_NONE          = 0;
  PICTYPE_BITMAP        = 1;
  PICTYPE_METAFILE      = 2;
  PICTYPE_ICON          = 3;
  PICTYPE_ENHMETAFILE   = 4;

{ Standard dispatch ID constants }

  DISPID_AUTOSIZE      = -500;
  DISPID_BACKCOLOR     = -501;
  DISPID_BACKSTYLE     = -502;
  DISPID_BORDERCOLOR   = -503;
  DISPID_BORDERSTYLE   = -504;
  DISPID_BORDERWIDTH   = -505;
  DISPID_DRAWMODE      = -507;
  DISPID_DRAWSTYLE     = -508;
  DISPID_DRAWWIDTH     = -509;
  DISPID_FILLCOLOR     = -510;
  DISPID_FILLSTYLE     = -511;
  DISPID_FONT          = -512;
  DISPID_FORECOLOR     = -513;
  DISPID_ENABLED       = -514;
  DISPID_HWND          = -515;
  DISPID_TABSTOP       = -516;
  DISPID_TEXT          = -517;
  DISPID_CAPTION       = -518;
  DISPID_BORDERVISIBLE = -519;

  DISPID_REFRESH  = -550;
  DISPID_DOCLICK  = -551;
  DISPID_ABOUTBOX = -552;

  DISPID_CLICK      = -600;
  DISPID_DBLCLICK   = -601;
  DISPID_KEYDOWN    = -602;
  DISPID_KEYPRESS   = -603;
  DISPID_KEYUP      = -604;
  DISPID_MOUSEDOWN  = -605;
  DISPID_MOUSEMOVE  = -606;
  DISPID_MOUSEUP    = -607;
  DISPID_ERROREVENT = -608;

  DISPID_AMBIENT_BACKCOLOR         = -701;
  DISPID_AMBIENT_DISPLAYNAME       = -702;
  DISPID_AMBIENT_FONT              = -703;
  DISPID_AMBIENT_FORECOLOR         = -704;
  DISPID_AMBIENT_LOCALEID          = -705;
  DISPID_AMBIENT_MESSAGEREFLECT    = -706;
  DISPID_AMBIENT_SCALEUNITS        = -707;
  DISPID_AMBIENT_TEXTALIGN         = -708;
  DISPID_AMBIENT_USERMODE          = -709;
  DISPID_AMBIENT_UIDEAD            = -710;
  DISPID_AMBIENT_SHOWGRABHANDLES   = -711;
  DISPID_AMBIENT_SHOWHATCHING      = -712;
  DISPID_AMBIENT_DISPLAYASDEFAULT  = -713;
  DISPID_AMBIENT_SUPPORTSMNEMONICS = -714;
  DISPID_AMBIENT_AUTOCLIP          = -715;

{ Dispatch ID constants for fonts }

  DISPID_FONT_NAME    = 0;
  DISPID_FONT_SIZE    = 2;
  DISPID_FONT_BOLD    = 3;
  DISPID_FONT_ITALIC  = 4;
  DISPID_FONT_UNDER   = 5;
  DISPID_FONT_STRIKE  = 6;
  DISPID_FONT_WEIGHT  = 7;
  DISPID_FONT_CHARSET = 8;

{ Dispatch ID constants for pictures }

  DISPID_PICT_HANDLE = 0;
  DISPID_PICT_HPAL   = 2;
  DISPID_PICT_TYPE   = 3;
  DISPID_PICT_WIDTH  = 4;
  DISPID_PICT_HEIGHT = 5;
  DISPID_PICT_RENDER = 6;

type

  PTextMetricOle = PTextMetricW;
  TTextMetricOle = TTextMetricW;

  TOleColor = Longint;

  OLE_XPOS_PIXELS  = Longint;
  OLE_YPOS_PIXELS  = Longint;
  OLE_XSIZE_PIXELS = Longint;
  OLE_YSIZE_PIXELS = Longint;

  OLE_XPOS_HIMETRIC  = Longint;
  OLE_YPOS_HIMETRIC  = Longint;
  OLE_XSIZE_HIMETRIC = Longint;
  OLE_YSIZE_HIMETRIC = Longint;

  OLE_XPOS_CONTAINER  = Single;
  OLE_YPOS_CONTAINER  = Single;
  OLE_XSIZE_CONTAINER = Single;
  OLE_YSIZE_CONTAINER = Single;

  OLE_TRISTATE = (triUnchecked, triChecked, triGray);

  OLE_OPTEXCLUSIVE = Bool;

  OLE_CANCELBOOL = Bool;

  OLE_ENABLEDEFAULTBOOL = Bool;

  OLE_HANDLE = Longint;

{ Registration function types }

  TDLLRegisterServer = function: HResult stdcall;
  TDLLUnregisterServer = function: HResult stdcall;

{ TPointF structure }

  PPointF = ^TPointF;
  TPointF = record
    x: Single;
    y: Single;
  end;

{ TControlInfo structure }

  PControlInfo = ^TControlInfo;
  TControlInfo = record
    cb: Longint;
    hAccel: HAccel;
    cAccel: Word;
    dwFlags: Longint;
  end;

{ Forward declarations }

  IOleControl = class;
  IOleControlSite = class;
  ISimpleFrameSite = class;
  IPersistStreamInit = class;
  IPropertyNotifySink = class;
  IProvideClassInfo = class;
  IConnectionPointContainer = class;
  IEnumConnectionPoints = class;
  IConnectionPoint = class;
  IEnumConnections = class;
  IClassFactory2 = class;
  ISpecifyPropertyPages = class;
  IPerPropertyBrowsing = class;
  IPropertyPageSite = class;
  IPropertyPage = class;
  IPropertyPage2 = class;
  IFont = class;
  IFontDisp = class;
  IPicture = class;
  IPictureDisp = class;

{ IOleControl interface }

  IOleControl = class(IUnknown)
  public
    function GetControlInfo(var ci: TControlInfo): HResult; virtual; stdcall; abstract;
    function OnMnemonic(msg: PMsg): HResult; virtual; stdcall; abstract;
    function OnAmbientPropertyChange(dispid: TDispID): HResult; virtual; stdcall; abstract;
    function FreezeEvents(bFreeze: BOOL): HResult; virtual; stdcall; abstract;
  end;

{ IOleControlSite interface }

  IOleControlSite = class(IUnknown)
  public
    function OnControlInfoChanged: HResult; virtual; stdcall; abstract;
    function LockInPlaceActive(fLock: BOOL): HResult; virtual; stdcall; abstract;
    function GetExtendedControl(var disp: IDispatch): HResult; virtual; stdcall; abstract;
    function TransformCoords(var ptlHimetric: TPoint; var ptfContainer: TPointF;
      flags: Longint): HResult; virtual; stdcall; abstract;
    function TranslateAccelerator(msg: PMsg; grfModifiers: Longint): HResult;
       virtual; stdcall; abstract;
    function OnFocus(fGotFocus: BOOL): HResult; virtual; stdcall; abstract;
    function ShowPropertyFrame: HResult; virtual; stdcall; abstract;
  end;

{ ISimpleFrameSite interface }

  ISimpleFrameSite = class(IUnknown)
  public
    function PreMessageFilter(wnd: HWnd; msg, wp, lp: Integer;
      var res: Integer; var Cookie: Longint): HResult;
      virtual; stdcall; abstract;
    function PostMessageFilter(wnd: HWnd; msg, wp, lp: Integer;
      var res: Integer; Cookie: Longint): HResult;
      virtual; stdcall; abstract;
  end;

{ IPersistStreamInit interface }

  IPersistStreamInit = class(IPersistStream)
  public
    function InitNew: HResult; virtual; stdcall; abstract;
  end;

{ IPropertyNotifySink interface }

  IPropertyNotifySink = class(IUnknown)
  public
    function OnChanged(dispid: TDispID): HResult; virtual; stdcall; abstract;
    function OnRequestEdit(dispid: TDispID): HResult; virtual; stdcall; abstract;
  end;

{ IProvideClassInfo interface }

  IProvideClassInfo = class(IUnknown)
  public
    function GetClassInfo(var ti: ITypeInfo): HResult; virtual; stdcall; abstract;
  end;

{ IConnectionPointContainer interface }

  IConnectionPointContainer = class(IUnknown)
  public
    function EnumConnectionPoints(var enum: IEnumConnectionPoints): HResult;
      virtual; stdcall; abstract;
    function FindConnectionPoint(const iid: TIID;
      var cp: IConnectionPoint): HResult; virtual; stdcall; abstract;
  end;

{ IEnumConnectionPoints interface }

  IEnumConnectionPoints = class(IUnknown)
  public
    function Next(celt: Longint; var elt;
      pceltFetched: PLongint): HResult; virtual; stdcall; abstract;
    function Skip(celt: Longint): HResult; virtual; stdcall; abstract;
    function Reset: HResult; virtual; stdcall; abstract;
    function Clone(var enum: IEnumConnectionPoints): HResult;
      virtual; stdcall; abstract;
  end;

{ IConnectionPoint interface }

  IConnectionPoint = class(IUnknown)
  public
    function GetConnectionInterface(var iid: TIID): HResult; virtual; stdcall; abstract;
    function GetConnectionPointContainer(var cpc: IConnectionPointContainer): HResult;
      virtual; stdcall; abstract;
    function Advise(unkSink: IUnknown; var dwCookie: Longint): HResult; virtual; stdcall; abstract;
    function Unadvise(dwCookie: Longint): HResult; virtual; stdcall; abstract;
    function EnumConnections(var enum: IEnumConnections): HResult; virtual; stdcall; abstract;
  end;

{ TConnectData structure }

  PConnectData = ^TConnectData;
  TConnectData = record
    pUnk: IUnknown;
    dwCookie: Longint;
  end;

{ IEnumConnections interface }

  IEnumConnections = class(IUnknown)
  public
    function Next(celt: Longint; var elt;
      pceltFetched: PLongint): HResult; virtual; stdcall; abstract;
    function Skip(celt: Longint): HResult; virtual; stdcall; abstract;
    function Reset: HResult; virtual; stdcall; abstract;
    function Clone(var enum: IEnumConnections): HResult; virtual; stdcall; abstract;
  end;

{ TLicInfo structure }

  PLicInfo = ^TLicInfo;
  TLicInfo = record
    cbLicInfo: Longint;
    fRuntimeKeyAvail: BOOL;
    fLicVerified: BOOL;
  end;

{ IClassFactory2 interface }

  IClassFactory2 = class(IClassFactory)
    function GetLicInfo(var licInfo: TLicInfo): HResult; virtual; stdcall; abstract;
    function RequestLicKey(dwResrved: Longint; var bstrKey: TBStr): HResult;
      virtual; stdcall; abstract;
    function CreateInstanceLic(unkOuter: IUnknown; unkReserved: IUnknown;
      const iid: TIID; bstrKey: TBStr; var vObject): HResult; virtual; stdcall; abstract;
  end;

{ TCAUUID structure - a counted array of TGUID }

  PGUIDList = ^TGUIDList;
  TGUIDList = array[0..65535] of TGUID;

  PCAGUID = ^TCAGUID;
  TCAGUID = record
    cElems: Longint;
    pElems: PGUIDList;
  end;

{ TCAPOleStr structure - a counted array of POleStr }

  PCAPOleStr = ^TCAPOleStr;
  TCAPOleStr = record
    cElems: Longint;
    pElems: POleStrList;
  end;

{ TCALongint - a counted array of Longint }

  PLongintList = ^TLongintList;
  TLongintList = array[0..65535] of Longint;

  PCALongint = ^TCALongint;
  TCALongint = record
    cElems: Longint;
    pElems: PLongintList;
  end;

{ TOCPFIParams - parameters for OleCreatePropertyFrameIndirect }

  POCPFIParams = ^TOCPFIParams;
  TOCPFIParams = record
    cbStructSize: Longint;
    hWndOwner: HWnd;
    x: Integer;
    y: Integer;
    lpszCaption: POleStr;
    cObjects: Longint;
    pObjects: Pointer;
    cPages: Longint;
    pPages: Pointer;
    lcid: TLCID;
    dispidInitialProperty: TDispID;
  end;

{ TPropPageInfo structure - information about a property page }

  PPropPageInfo = ^TPropPageInfo;
  TPropPageInfo = record
    cb: Longint;
    pszTitle: POleStr;
    size: TSize;
    pszDocString: POleStr;
    pszHelpFile: POleStr;
    dwHelpContext: Longint;
  end;

{ ISpecifyPropertyPages interface }

  ISpecifyPropertyPages = class(IUnknown)
  public
    function GetPages(var pages: TCAGUID): HResult; virtual; stdcall; abstract;
  end;

{ IPerPropertyBrowsing interface }

  IPerPropertyBrowsing = class(IUnknown)
  public
    function GetDisplayString(dispid: TDispID; var bstr: TBStr): HResult;
      virtual; stdcall; abstract;
    function MapPropertyToPage(dispid: TDispID; var clsid: TCLSID): HResult;
      virtual; stdcall; abstract;
    function GetPredefinedStrings(dispid: TDispID; var caStringsOut: TCAPOleStr;
      var caCookiesOut: TCALongint): HResult; virtual; stdcall; abstract;
    function GetPredefinedValue(dispid: TDispID; dwCookie: Longint;
      var varOut: Variant): HResult; virtual; stdcall; abstract;
  end;

{ IPropertyPageSite interface }

  IPropertyPageSite = class(IUnknown)
  public
    function OnStatusChange(flags: Longint): HResult; virtual; stdcall; abstract;
    function GetLocaleID(var localeID: TLCID): HResult; virtual; stdcall; abstract;
    function GetPageContainer(var unk: IUnknown): HResult; virtual; stdcall; abstract;
    function TranslateAccelerator(msg: PMsg): HResult; virtual; stdcall; abstract;
  end;

{ IPropertyPage interface }

  IPropertyPage = class(IUnknown)
  public
    function SetPageSite(pageSite: IPropertyPageSite): HResult; virtual; stdcall; abstract;
    function Activate(hwndParent: HWnd; const rc: TRect; bModal: BOOL): HResult;
      virtual; stdcall; abstract;
    function Deactivate: HResult; virtual; stdcall; abstract;
    function GetPageInfo(var pageInfo: TPropPageInfo): HResult; virtual; stdcall; abstract;
    function SetObjects(cObjects: Longint; unk: IUnknown): HResult; virtual; stdcall; abstract;
    function Show(nCmdShow: Integer): HResult; virtual; stdcall; abstract;
    function Move(const rect: TRect): HResult; virtual; stdcall; abstract;
    function IsPageDirty: HResult; virtual; stdcall; abstract;
    function Apply: HResult; virtual; stdcall; abstract;
    function Help(pszHelpDir: POleStr): HResult; virtual; stdcall; abstract;
    function TranslateAccelerator(msg: PMsg): HResult; virtual; stdcall; abstract;
  end;

{ IPropertyPage2 interface }

  IPropertyPage2 = class(IPropertyPage)
  public
    function EditProperty(dispid: TDispID): HResult; virtual; stdcall; abstract;
  end;

{ IFont interface }

  IFont = class(IUnknown)
  public
    function get_Name(var name: TBStr): HResult; virtual; stdcall; abstract;
    function put_Name(name: TBStr): HResult; virtual; stdcall; abstract;
    function get_Size(var size: TCurrency): HResult; virtual; stdcall; abstract;
    function put_Size(size: TCurrency): HResult; virtual; stdcall; abstract;
    function get_Bold(var bold: BOOL): HResult; virtual; stdcall; abstract;
    function put_Bold(bold: BOOL): HResult; virtual; stdcall; abstract;
    function get_Italic(var italic: BOOL): HResult; virtual; stdcall; abstract;
    function put_Italic(italic: BOOL): HResult; virtual; stdcall; abstract;
    function get_Underline(var underline: BOOL): HResult; virtual; stdcall; abstract;
    function put_Underline(underline: BOOL): HResult; virtual; stdcall; abstract;
    function get_Strikethrough(var strikethrough: BOOL): HResult; virtual; stdcall; abstract;
    function put_Strikethrough(strikethrough: BOOL): HResult; virtual; stdcall; abstract;
    function get_Weight(var weight: Smallint): HResult; virtual; stdcall; abstract;
    function put_Weight(weight: Smallint): HResult; virtual; stdcall; abstract;
    function get_Charset(var charset: Smallint): HResult; virtual; stdcall; abstract;
    function put_Charset(charset: Smallint): HResult; virtual; stdcall; abstract;
    function get_hFont(var font: HFont): HResult; virtual; stdcall; abstract;
    function Clone(var font: IFont): HResult; virtual; stdcall; abstract;
    function IsEqual(fontOther: IFont): HResult; virtual; stdcall; abstract;
    function SetRatio(cyLogical, cyHimetric: Longint): HResult; virtual; stdcall; abstract;
    function QueryTextMetrics(var tm: TTextMetricOle): HResult; virtual; stdcall; abstract;
    function AddRefHfont(font: HFont): HResult; virtual; stdcall; abstract;
    function ReleaseHfont(font: HFont): HResult; virtual; stdcall; abstract;
  end;

{ IFontDisp interface }

  IFontDisp = class(IDispatch);

{ TFontDesc structure }

  PFontDesc = ^TFontDesc;
  TFontDesc = record
    cbSizeofstruct: Integer;
    lpstrName: POleStr;
    cySize: Comp;
    sWeight: Smallint;
    sCharset: Smallint;
    fItalic: BOOL;
    fUnderline: BOOL;
    fStrikethrough: BOOL;
  end;

{ IPicture interface }

  IPicture = class(IUnknown)
  public
    function get_Handle(var handle: OLE_HANDLE): HResult;  virtual; stdcall; abstract;
    function get_hPal(var handle: OLE_HANDLE): HResult; virtual; stdcall; abstract;
    function get_Type(var typ: Smallint): HResult; virtual; stdcall; abstract;
    function get_Width(var width: OLE_XSIZE_HIMETRIC): HResult; virtual; stdcall; abstract;
    function get_Height(var height: OLE_YSIZE_HIMETRIC): HResult; virtual; stdcall; abstract;
    function Render(dc: HDC; x, y, cx, cy: Longint;
      xSrc: OLE_XPOS_HIMETRIC; ySrc: OLE_YPOS_HIMETRIC;
      cxSrc: OLE_XSIZE_HIMETRIC; cySrc: OLE_YSIZE_HIMETRIC;
      const rcWBounds: TRect): HResult; virtual; stdcall; abstract;
    function set_hPal(hpal: OLE_HANDLE): HResult; virtual; stdcall; abstract;
    function get_CurDC(var dcOut: HDC): HResult; virtual; stdcall; abstract;
    function SelectPicture(dcIn: HDC; var hdcOut: HDC;
      var bmpOut: OLE_HANDLE): HResult; virtual; stdcall; abstract;
    function get_KeepOriginalFormat(var fkeep: BOOL): HResult; virtual; stdcall; abstract;
    function put_KeepOriginalFormat(fkeep: BOOL): HResult; virtual; stdcall; abstract;
    function PictureChanged: HResult; virtual; stdcall; abstract;
    function SaveAsFile(stream: IStream; fSaveMemCopy: BOOL;
      var cbSize: Longint): HResult; virtual; stdcall; abstract;
    function get_Attributes(dwAttr: Longint): HResult; virtual; stdcall; abstract;
  end;

{ IPictureDisp interface }

  IPictureDisp = class(IDispatch);

{ TPictDesc structure }

  PPictDesc = ^TPictDesc;
  TPictDesc = record
    cbSizeofstruct: Integer;
    picType: Integer;
    case Integer of
      PICTYPE_BITMAP: (
        hbitmap: THandle;       { Bitmap }
        hpal: THandle);         { Accompanying palette }
      PICTYPE_METAFILE: (
        hMeta: THandle;         { Metafile }
        xExt, yExt: Integer);   { Extent }
      PICTYPE_ICON: (
        hIcon: THandle);        { Icon }
  end;

const

{ Standard interface IDs }

  IID_IPropertyNotifySink: TGUID = (
    D1:$9BFBBC02;D2:$EFF1;D3:$101A;D4:($84,$ED,$00,$AA,$00,$34,$1D,$07));
  IID_IClassFactory2: TGUID = (
    D1:$B196B28F;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IProvideClassInfo: TGUID = (
    D1:$B196B283;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IConnectionPointContainer: TGUID = (
    D1:$B196B284;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IEnumConnectionPoints: TGUID = (
    D1:$B196B285;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IConnectionPoint: TGUID = (
    D1:$B196B286;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IEnumConnections: TGUID = (
    D1:$B196B287;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IOleControl: TGUID = (
    D1:$B196B288;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IOleControlSite: TGUID = (
    D1:$B196B289;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_ISimpleFrameSite: TGUID = (
    D1:$742B0E01;D2:$14E6;D3:$101B;D4:($91,$4E,$00,$AA,$00,$30,$0C,$AB));
  IID_IPersistStreamInit: TGUID = (
    D1:$7FD52380;D2:$4E07;D3:$101B;D4:($AE,$2D,$08,$00,$2B,$2E,$C7,$13));
  IID_IPropertyFrame: TGUID = (
    D1:$B196B28A;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_ISpecifyPropertyPages: TGUID = (
    D1:$B196B28B;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IPerPropertyBrowsing: TGUID = (
    D1:$376BD3AA;D2:$3845;D3:$101B;D4:($84,$ED,$08,$00,$2B,$2E,$C7,$13));
  IID_IPropertyPageSite: TGUID = (
    D1:$B196B28C;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IPropertyPage: TGUID = (
    D1:$B196B28D;D2:$BAB4;D3:$101A;D4:($B6,$9C,$00,$AA,$00,$34,$1D,$07));
  IID_IPropertyPage2: TGUID = (
    D1:$01E44665;D2:$24AC;D3:$101B;D4:($84,$ED,$08,$00,$2B,$2E,$C7,$13));
  IID_IFont: TGUID = (
    D1:$BEF6E002;D2:$A874;D3:$101A;D4:($8B,$BA,$00,$AA,$00,$30,$0C,$AB));
  IID_IFontDisp: TGUID = (
    D1:$BEF6E003;D2:$A874;D3:$101A;D4:($8B,$BA,$00,$AA,$00,$30,$0C,$AB));
  IID_IPicture: TGUID = (
    D1:$7BF80980;D2:$BF32;D3:$101A;D4:($8B,$BB,$00,$AA,$00,$30,$0C,$AB));
  IID_IPictureDisp: TGUID = (
    D1:$7Bf80981;D2:$BF32;D3:$101A;D4:($8B,$BB,$00,$AA,$00,$30,$0C,$AB));

{ Standard class IDs }

  CLSID_CFontPropPage: TGUID = (
    D1:$2542f180;D2:$3532;D3:$1069;D4:($a2,$cd,$00,$aa,$00,$34,$b5,$0b));
  CLSID_CColorPropPage: TGUID = (
    D1:$ddf5a600;D2:$b9c0;D3:$101a;D4:($af,$1a,$00,$aa,$00,$34,$b5,$0b));
  CLSID_CPicturePropPage: TGUID = (
    D1:$fc7af71d;D2:$fc74;D3:$101a;D4:($84,$ed,$08,$00,$2b,$2e,$c7,$13));
  CLSID_PersistPropset: TGUID = (
    D1:$fb8f0821;D2:$0164;D3:$101b;D4:($84,$ed,$08,$00,$2b,$2e,$c7,$13));
  CLSID_ConvertVBX: TGUID = (
    D1:$fb8f0822;D2:$0164;D3:$101b;D4:($84,$ed,$08,$00,$2b,$2e,$c7,$13));
  CLSID_StdFont: TGUID = (
    D1:$fb8f0823;D2:$0164;D3:$101b;D4:($84,$ed,$08,$00,$2b,$2e,$c7,$13));
  CLSID_StdPicture: TGUID = (
    D1:$fb8f0824;D2:$0164;D3:$101b;D4:($84,$ed,$08,$00,$2b,$2e,$c7,$13));

{ Property frame APIs }

function OleCreatePropertyFrame(hwndOwner: HWnd; x, y: Integer;
  lpszCaption: POleStr; cObjects: Integer; pObjects: Pointer;
  cPages: Integer; pPageCLSIDs: Pointer; lcid: TLCID; dwReserved: Longint;
  pvReserved: Pointer): HResult; stdcall;

function OleCreatePropertyFrameIndirect(var Params: TOCPFIParams): HResult; stdcall;

{ Standard type APIs }

function OleTranslateColor(clr: TOleColor; hpal: HPalette;
 var colorref: TColorRef): HResult; stdcall;

function OleCreateFontIndirect(var FontDesc: TFontDesc; const iid: TIID;
  var vObject): HResult; stdcall;

function OleCreatePictureIndirect(var PictDesc: TPictDesc; const iid: TIID;
  fOwn: BOOL; var vObject): HResult; stdcall;

function OleLoadPicture(stream: IStream; lSize: Longint; fRunmode: BOOL;
  const iid: TIID; var vObject): HResult; stdcall;

function OleIconToCursor(hinstExe: THandle; hIcon: THandle): HCursor; stdcall;

implementation

const
  olepro32 = 'olepro32.dll';

{ Externals from olepro32.dll }

function OleCreatePropertyFrame;            external olepro32 name 'OleCreatePropertyFrame';
function OleCreatePropertyFrameIndirect;    external olepro32 name 'OleCreatePropertyFrameIndirect';
function OleTranslateColor;                 external olepro32 name 'OleTranslateColor';
function OleCreateFontIndirect;             external olepro32 name 'OleCreateFontIndirect';
function OleCreatePictureIndirect;          external olepro32 name 'OleCreatePictureIndirect';
function OleLoadPicture;                    external olepro32 name 'OleLoadPicture';
function OleIconToCursor;                   external olepro32 name 'OleIconToCursor';

end.
