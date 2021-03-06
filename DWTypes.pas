unit DWTypes;

interface

uses Classes, System.SysUtils, OverbyteIcsHttpSrv, DWMarkupLinguageTag;

type
  TDWButtonStyle = (bsbsDefault, bsbsPrimary, bsbsSuccess, bsbsInfo, bsbsWarning, bsbsDanger,
    bsbsLink, bsbsClose);
  TDWBtnImagePosition = (bsbtimgLeft, bsbtimgRight, bsbtimgCenter);

{$REGION 'INPUT TYPES'}

type
  TDWInputType = (bsitText, bsitPassword, bsitDateTimeLocal, bsitDate, bsitMonth, bsitTime,
    bsitWeek, bsitNumber, bsitEmail, bsitUrl, bsitSearch, bsitTel, bsitColor, bsitHidden);

const
  aDWInputType: array [bsitText .. bsitHidden] of string = ('text', 'password', 'datetime-local',
    'date', 'month', 'time', 'week', 'number', 'email', 'url', 'search', 'tel', 'color', 'hidden');
{$ENDREGION}
{$REGION 'COMMON TYPES'}

const
  EOL = #13#10;

type
  TDWTextAlignment   = (bstaDefault, bstaLeft, bstaCenter, bstaRight, bstaJustify, bstaNowrap);
  TDWTextCase        = (bstcDefault, bstcLowercase, bstcUppercase, bstcCapitalize);
  TDWSize            = (bsszDefault, bsszLg, bsszMd, bsszSm, bsszXs);
  TDWRelativeSize    = (bsrzDefault, bsrzLg, bsrzSm);
  TDWResizeDirection = (bsrdDefault, bsrdNone, bsrdBoth, bsrdVertical, bsrdHorizontal);

const
  aDWRelativeSize: array [bsrzDefault .. bsrzSm] of string      = ('', 'lg', 'sm');
  aDWSize: array [bsszDefault .. bsszXs] of string              = ('', 'lg', 'md', 'sm', 'xs');
  aDWTextAlignment: array [bstaDefault .. bstaNowrap] of string = ('', 'text-left', 'text-center',
    'text-right', 'text-justify', 'text-nowrap');
  aDWTextCase: array [bstcDefault .. bstcCapitalize] of string = ('', 'text-lowercase',
    'text-uppercase', 'text-capitalize');
  aDWResizeDirection: array [bsrdDefault .. bsrdHorizontal] of string = ('', 'none', 'both',
    'vertical', 'horizontal');

type
  TDWGridVisibility = (bsgvDefault, bsgvBlock, bsgvInline, bsgvInlineBlock, bsgvHidden);
  TDWGridFloat      = (bsgfNone, bsgfLeft, bsgfRight);
{$ENDREGION}
{$REGION 'REGION TYPES'}

type

  TDWRegionBack = (bsrbDefault, bsrbPrimary, bsrbSuccess, bsrbInfo, bsrbWarning, bsrbDanger);

const
  aDWRegionBack: array [bsrbDefault .. bsrbDanger] of string = ('default', 'primary', 'success',
    'info', 'warning', 'danger');

type
  TDWRegionType = (bsrtNone, bsrtContainer, bsrtContainerFluid, bsrtRow, bsrtColumn, bsrtDropDown,
    bsrtDropDownMenu, bsrtFormGroup, bsrtJumbotron, bsrtPageHeader, bsrtWell, bsrtWellLarge,
    bsrtWellSmall, bsrtButtonToolbar, bsrtListGroup, bsrtModalContent, bsrtModalHeader,
    bsrtModalBody, bsrtModalFooter, bsrtPanelGroup, bsrtPanel, bsrtPanelBody, bsrtPanelHeading,
    bsrtPanelFooter);

const
  aDWRegionType: array [bsrtNone .. bsrtPanelFooter] of string = ('', 'container',
    'container-fluid', 'row', 'column', 'dropdown', 'dropdown-menu', 'form-group', 'jumbotron',
    'page-header', 'well', 'well well-lg', 'well well-sm', 'btn-toolbar', 'list-group',
    'modal-content', 'modal-header', 'modal-body', 'modal-footer', 'panel-group', 'panel',
    'panel-body', 'panel-heading', 'panel-footer');

type
  TDWRegionTagType = (bsttDiv, bsttH1, bsttH2, bsttH3, bsttH4, bsttH5, bsttH6, bsttP);

const
  aDWRegionTagType: array [bsttDiv .. bsttP] of string = ('div', 'h1', 'h2', 'h3', 'h4', 'h5',
    'h6', 'p');
{$ENDREGION}
{$REGION 'FORM TYPES'}

type
  TDWFormType = (bsftInline, bsftHorizontal, bsftVertical);

  TDWFormEncType = (bsfeDefault, bsfeMultipart, bsfeText);

  TDWInputFormSubmitEvent = procedure(aParams: TStrings) of object;
{$ENDREGION}

type
  TDWHttpAllowedFlag = (afBeginBy, afExactMatch, afDirList);

  TDWHttpMethod = (httpMethodNone, httpMethodGet, httpMethodPost, httpMethodHead, httpMethodOptions,
    httpMethodPut, httpMethodDelete, httpMethodTrace, httpMethodPatch, httpMethodConnect);
  PHttpGetFlag = ^THttpGetFlag;

{$REGION 'ASYNC EVENT TYPES'}
  { HTML Events see: http://www.w3schools.com/tags/ref_eventattributes.asp
    * Window Events
    onafterprint	script	Script to be run after the document is printed
    onbeforeprint	script	Script to be run before the document is printed
    onbeforeunload	script	Script to be run when the document is about to be unloaded
    onerror	script	Script to be run when an error occurs
    onhashchange	script	Script to be run when there has been changes to the anchor part of the a URL
    onload	script	Fires after the page is finished loading
    onmessage	script	Script to be run when the message is triggered
    onoffline	script	Script to be run when the browser starts to work offline
    ononline	script	Script to be run when the browser starts to work online
    onpagehide	script	Script to be run when a user navigates away from a page
    onpageshow	script	Script to be run when a user navigates to a page
    onpopstate	script	Script to be run when the window's history changes
    onresize	script	Fires when the browser window is resized
    onstorage	script	Script to be run when a Web Storage area is updated
    onunload	script	Fires once a page has unloaded (or the browser window has been closed)
    * Form Events
    onblur	script	Fires the moment that the element loses focus
    onchange	script	Fires the moment when the value of the element is changed
    oncontextmenu	script	Script to be run when a context menu is triggered
    onfocus	script	Fires the moment when the element gets focus
    oninput	script	Script to be run when an element gets user input
    oninvalid	script	Script to be run when an element is invalid
    onreset	script	Fires when the Reset button in a form is clicked
    onsearch	script	Fires when the user writes something in a search field (for <input="search">)
    onselect	script	Fires after some text has been selected in an element
    onsubmit	script	Fires when a form is submitted
    * Keyboard Events
    onkeydown	script	Fires when a user is pressing a key
    onkeypress	script	Fires when a user presses a key
    onkeyup	script	Fires when a user releases a key
    * Mouse Events
    onclick	script	Fires on a mouse click on the element
    ondblclick	script	Fires on a mouse double-click on the element
    ondrag	script	Script to be run when an element is dragged
    ondragend	script	Script to be run at the end of a drag operation
    ondragenter	script	Script to be run when an element has been dragged to a valid drop target
    ondragleave	script	Script to be run when an element leaves a valid drop target
    ondragover	script	Script to be run when an element is being dragged over a valid drop target
    ondragstart	script	Script to be run at the start of a drag operation
    ondrop	script	Script to be run when dragged element is being dropped
    onmousedown	script	Fires when a mouse button is pressed down on an element
    onmousemove	script	Fires when the mouse pointer is moving while it is over an element
    onmouseout	script	Fires when the mouse pointer moves out of an element
    onmouseover	script	Fires when the mouse pointer moves over an element
    onmouseup	script	Fires when a mouse button is released over an element
    onmousewheel	script	Deprecated. Use the onwheel attribute instead
    onscroll	script	Script to be run when an element's scrollbar is being scrolled
    onwheel	script	Fires when the mouse wheel rolls up or down over an element
    * ClippBoard Events
    oncopy	script	Fires when the user copies the content of an element
    oncut	script	Fires when the user cuts the content of an element
    onpaste	script	Fires when the user pastes some content in an element
    onabort	script	Script to be run on abort
    * Media Events
    oncanplay	script	Script to be run when a file is ready to start playing (when it has buffered enough to begin)
    oncanplaythrough	script	Script to be run when a file can be played all the way to the end without pausing for buffering
    oncuechange	script	Script to be run when the cue changes in a <track> element
    ondurationchange	script	Script to be run when the length of the media changes
    onemptied	script	Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
    onended	script	Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
    onerror	script	Script to be run when an error occurs when the file is being loaded
    onloadeddata	script	Script to be run when media data is loaded
    onloadedmetadata	script	Script to be run when meta data (like dimensions and duration) are loaded
    onloadstart	script	Script to be run just as the file begins to load before anything is actually loaded
    onpause	script	Script to be run when the media is paused either by the user or programmatically
    onplay	script	Script to be run when the media is ready to start playing
    onplaying	script	Script to be run when the media actually has started playing
    onprogress	script	Script to be run when the browser is in the process of getting the media data
    onratechange	script	Script to be run each time the playback rate changes (like when a user switches to a slow motion or fast forward mode)
    onseeked	script	Script to be run when the seeking attribute is set to false indicating that seeking has ended
    onseeking	script	Script to be run when the seeking attribute is set to true indicating that seeking is active
    onstalled	script	Script to be run when the browser is unable to fetch the media data for whatever reason
    onsuspend	script	Script to be run when fetching the media data is stopped before it is completely loaded for whatever reason
    ontimeupdate	script	Script to be run when the playing position has changed (like when the user fast forwards to a different point in the media)
    onvolumechange	script	Script to be run each time the volume is changed which (includes setting the volume to "mute")
    onwaiting	script	Script to be run when the media has paused but is expected to resume (like when the media pauses to buffer more data)
    * Misc Events
    onshow	script	Fires when a <menu> element is shown as a context menu
    ontoggle	script	Fires when the user opens or closes the <details> element
    *Bootstrap Modal Events --> https://getbootstrap.com/javascript/#modals-events
    onshow.bs.modal	This event fires immediately when the show instance method is called. If caused by a click, the clicked element is available as the relatedTarget property of the event.
    onshown.bs.modal	This event is fired when the modal has been made visible to the user (will wait for CSS transitions to complete). If caused by a click, the clicked element is available as the relatedTarget property of the event.
    onhide.bs.modal	This event is fired immediately when the hide instance method has been called.
    onhidden.bs.modal	This event is fired when the modal has finished being hidden from the user (will wait for CSS transitions to complete).
    onloaded.bs.modal	This event is fired when the modal has loaded content using the remote option.
    *TDWTabControl Events
    ontabclose.dw Fired when click in close button of one Tab
    *Bootstrap Tabs
    onshow.bs.tab	This event fires on tab show, but before the new tab has been shown. Use event.target and event.relatedTarget to target the active tab and the previous active tab (if available) respectively.
    onshown.bs.tab	This event fires on tab show after a tab has been shown. Use event.target and event.relatedTarget to target the active tab and the previous active tab (if available) respectively.
    onhide.bs.tab	This event fires when a new tab is to be shown (and thus the previous active tab is to be hidden). Use event.target and event.relatedTarget to target the current active tab and the new soon-to-be-active tab, respectively.
    onhidden.bs.tab	This event fires after a new tab is shown (and thus the previous active tab is hidden). Use event.target and event.relatedTarget to target the previous active tab and the new active tab, respectively.
    *Bootstrap Alerts
    onclose.bs.alert	This event fires immediately when the close instance method is called.
    onclosed.bs.alert	This event is fired when the alert has been closed (will wait for CSS transitions to complete).

  }
  // Developper: !!!!! ADD NEW ITEMS AT END and add to  TDWAsyncEventName too!!!!!!
  TDWAsyncEventType = (ae_none, ae_afterprint, ae_beforeprint, ae_beforeunload, ae_hashchange,
    onload, ae_message, ae_offline, ae_online, ae_pagehide, ae_pageshow, ae_popstate, onresize,
    ae_storage, ae_unload, ae_blur, ae_change, ae_contextmenu, ae_focus, ae_input, ae_invalid,
    ae_reset, ae_search, ae_select, ae_submit, ae_keydown, ae_keypress, ae_keyup, ae_click,
    ae_dblclick, ae_drag, ae_dragend, ae_dragenter, ae_dragleave, ae_dragover, ae_dragstart,
    ae_drop, ae_mousedown, ae_mousemove, ae_mouseout, ae_mouseover, ae_mouseup, ae_mousewheel,
    ae_scroll, ae_wheel, ae_copy, ae_cut, ae_paste, ae_canplay, ae_canplaythrough, ae_cuechange,
    ae_durationchange, ae_emptied, ae_ended, ae_error, ae_loadeddata, ae_loadedmetadata,
    ae_loadstart, ae_pause, ae_play, ae_playing, ae_progress, ae_ratechange, ae_seeked, ae_seeking,
    ae_stalled, ae_suspend, ae_timeupdate, ae_volumechange, ae_waiting, ae_show, ae_toggle,
    ae_show_bs_modal, ae_shown_bs_modal, ae_hide_bs_modal, ae_hidden_bs_modal, ae_loaded_bs_modal,
    ae_tabclose_dw, ae_show_bs_tab, ae_shown_bs_tab, ae_hide_bs_tab, ae_hidden_bs_tab,
    ae_close_bs_alert, ae_closed_bs_alert);

  TDWAsyncEventTypeSet = set of TDWAsyncEventType;

const
  TDWAsyncEventName: array [0 .. 83] of string = ('none', 'afterprint', 'beforeprint',
    'beforeunload', 'hashchange', 'onload', 'message', 'offline', 'online', 'pagehide', 'pageshow',
    'popstate', 'onresize', 'storage', 'unload', 'blur', 'change', 'contextmenu', 'focus', 'input',
    'invalid', 'reset', 'search', 'select', 'submit', 'keydown', 'keypress', 'keyup', 'click',
    'dblclick', 'drag', 'dragend', 'dragenter', 'dragleave', 'dragover', 'dragstart', 'drop',
    'mousedown', 'mousemove', 'mouseout', 'mouseover', 'mouseup', 'mousewheel', 'scroll', 'wheel',
    'copy', 'cut', 'paste', 'canplay', 'canplaythrough', 'cuechange', 'durationchange', 'emptied',
    'ended', 'error', 'loadeddata', 'loadedmetadata', 'loadstart', 'pause', 'play', 'playing',
    'progress', 'ratechange', 'seeked', 'seeking', 'stalled', 'suspend', 'timeupdate',
    'volumechange', 'waiting', 'show', 'toggle', 'show.bs.modal', 'shown.bs.modal', 'hide.bs.modal',
    'hidden.bs.modal', 'loaded.bs.modal', 'tabclose.dw', 'show.bs.tab', 'shown.bs.tab',
    'hide.bs.tab', 'hidden.bs.tab', 'close.bs.alert', 'closed.bs.alert');

  // Return the Name of aEventType
  // EX: "aEventType = ae_change"  return "change"
function AsyncEventTypeToName(aEventType: TDWAsyncEventType): string;
// Return the aEventType of a String
// EX: "AsyncEventname = 'change'"  return "ae_change"
function StringToAsyncEventType(const AsyncEventname: String): TDWAsyncEventType;
{$ENDREGION}
{$REGION 'PROCEDURE TYPES'}

type
  // Procedure for Control Async Events
  TDWAsyncProcedure = procedure(Sender: TObject; aParams: TStringList) of object;
  // Procedure for CallBack
  TDWCallbackProcedure  = procedure(aParams: TStringList) of object;
  TDWOnHtmlTagProcedure = procedure(aTag: TDWCustomElement) of object;

{$ENDREGION}

const
  NO_CACHE              = 'Pragma: no-cache' + #13#10 + 'Expires: -1' + #13#10;
  CNST_DEFAULTFONTNAME  = 'Tahoma';
  CNST_GLYPHICONSFONT   = 'GLYPHICONS Halflings';
  CNST_PROPORTIONALFONT = 'Courier New';

type
  TIWBSRenderingSortMethod = (bsrmSortYX, bsrmSortXY);

implementation

function AsyncEventTypeToName(aEventType: TDWAsyncEventType): string;
begin
  result := TDWAsyncEventName[Ord(aEventType)];
end;

function StringToAsyncEventType(const AsyncEventname: String): TDWAsyncEventType;
var
  i: Integer;
begin
  result := ae_none;
  for i  := Low(TDWAsyncEventName) to High(TDWAsyncEventName) do
    begin
      if SameText(AsyncEventname, TDWAsyncEventName[i]) then
        begin
          result := TDWAsyncEventType(i);
          break;
        end;
    end;
end;

end.
