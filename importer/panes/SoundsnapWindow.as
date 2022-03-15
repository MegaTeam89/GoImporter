package importer.panes
{
   import anifire.components.containers.SoundsnapCell;
   import anifire.constant.ServerConstants;
   import anifire.events.SoundsnapCellEvent;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.Tile;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.TextInput;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManager;
   
   use namespace mx_internal;
   
   public class SoundsnapWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundsnapWindow_Label1:Label;
      
      private var _1939997290_btnSearchSound:Button;
      
      private var _923610019_imageSoundsnap:Image;
      
      private var _1051725668_soundTileList:Tile;
      
      private var _2028921176_txtSoundsnap:TextInput;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bottom:importer;
      
      private var _uploadType:String = "sound";
      
      private var _289303483_searching:Boolean = false;
      
      private var _uploading:Boolean = false;
      
      private var _keywords:String;
      
      private var myTimer:Timer;
      
      private var _hasSoundsnap:Boolean = false;
      
      private var _hasMoreSoundsnaps:XML;
      
      private var lastPosition:Number = 0;
      
      private var _nextColor:Boolean = false;
      
      private var _selectedSoundsnapCell:SoundsnapCell;
      
      private var _embed_mxml____ico_soundsnap_swf_130014181:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundsnapWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":TextInput,
                  "id":"_txtSoundsnap",
                  "events":{
                     "enter":"___txtSoundsnap_enter",
                     "creationComplete":"___txtSoundsnap_creationComplete"
                  },
                  "stylesFactory":function():void
                  {
                     this.themeColor = 16742400;
                     this.fontSize = 16;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":178.5,
                        "y":115,
                        "width":285,
                        "enabled":true,
                        "height":28
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"_imageSoundsnap",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "source":_embed_mxml____ico_soundsnap_swf_130014181,
                        "x":470,
                        "y":42,
                        "scaleX":1.5,
                        "scaleY":1.5,
                        "scaleContent":true,
                        "autoLoad":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"_btnSearchSound",
                  "events":{"click":"___btnSearchSound_click"},
                  "stylesFactory":function():void
                  {
                     this.themeColor = 16742400;
                     this.fontSize = 16;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":475.5,
                        "y":115,
                        "width":85,
                        "useHandCursor":true,
                        "height":28
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Tile,
                  "id":"_soundTileList",
                  "stylesFactory":function():void
                  {
                     this.backgroundAlpha = 0.7;
                     this.cornerRadius = 8;
                     this.themeColor = 8960767;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "direction":"horizontal",
                        "width":490,
                        "height":355,
                        "x":116.5,
                        "y":153,
                        "horizontalScrollPolicy":"off"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"_SoundsnapWindow_Label1",
                  "stylesFactory":function():void
                  {
                     this.fontSize = 20;
                     this.fontWeight = "bold";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":33,
                        "y":51
                     };
                  }
               })]};
            }
         });
         this._embed_mxml____ico_soundsnap_swf_130014181 = SoundsnapWindow__embed_mxml____ico_soundsnap_swf_130014181;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundsnapWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_SoundsnapWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundsnapWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 90;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundsnapWindow._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function init(param1:Object) : void
      {
         if(param1 != null)
         {
            this._bottom = param1 as importer;
         }
      }
      
      public function setButtonStatus(param1:Boolean, param2:Boolean = true) : void
      {
         if(param2)
         {
            this._bottom.setButtonStatus(param1);
         }
         if(this._btnSearchSound != null)
         {
            this._btnSearchSound.enabled = param1;
         }
         if(this._txtSoundsnap != null)
         {
            this._txtSoundsnap.editable = param1;
         }
      }
      
      public function set searchText(param1:String) : void
      {
         if(this._txtSoundsnap != null)
         {
            this._txtSoundsnap.text = param1;
         }
      }
      
      public function searchSoundsnap(param1:String) : void
      {
         var _loc2_:URLVariables = null;
         var _loc3_:URLRequest = null;
         var _loc4_:URLLoader = null;
         if(param1 == null || param1 == this._keywords)
         {
            CursorManager.removeBusyCursor();
            return;
         }
         this._keywords = param1;
         if(this._bottom.trim(this._keywords).length < 2)
         {
            this._bottom.show(UtilDict.toDisplay("import","import_alertkeyword"),UtilDict.toDisplay("import","import_errtitle"));
            this.setButtonStatus(true);
         }
         else
         {
            this._searching = true;
            if(this._soundTileList != null)
            {
               this._soundTileList.removeAllChildren();
            }
            CursorManager.setBusyCursor();
            this.setButtonStatus(false,false);
            _loc2_ = new URLVariables();
            this._bottom.addFlashVarsToURLvar(_loc2_);
            _loc2_["keywords"] = this._keywords;
            _loc3_ = new URLRequest(ServerConstants.ACTION_SEARCH_SOUNDSNAP);
            _loc3_.method = URLRequestMethod.POST;
            _loc3_.data = _loc2_;
            (_loc4_ = new URLLoader()).dataFormat = URLLoaderDataFormat.TEXT;
            _loc4_.addEventListener(Event.COMPLETE,this.onSearchSoundsnapComplete);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.error);
            _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
            _loc4_.load(_loc3_);
         }
      }
      
      private function onSearchSoundsnapComplete(param1:Event) : void
      {
         var resultXML:XML = null;
         var soundXML:XML = null;
         var ssc:SoundsnapCell = null;
         var event:Event = param1;
         var loader:URLLoader = URLLoader(event.target);
         var data:String = loader.data;
         var checkCode:String = data.substr(0,1);
         if(checkCode == "0")
         {
            resultXML = new XML(data.substr(1));
            if(resultXML.children().length() > 0)
            {
               this._searching = true;
               for each(soundXML in resultXML.children())
               {
                  if(soundXML.children().length() == 1)
                  {
                     this.myTimer = new Timer(500,1);
                     this.myTimer.addEventListener(TimerEvent.TIMER,this.timerEventHandler);
                     this.myTimer.start();
                     this._hasMoreSoundsnaps = soundXML;
                  }
                  else
                  {
                     ssc = new SoundsnapCell();
                     ssc.title = soundXML.title;
                     ssc.duration = soundXML.duration;
                     ssc.url = soundXML.link;
                     ssc.tags = soundXML.tags;
                     ssc.addEventListener(SoundsnapCellEvent.ON_SELECTED_EVENT,this.onClickSoundsnapCell);
                     ssc.addEventListener(SoundsnapCellEvent.UPLOAD_SOUND_EVENT,this.uploadUserAssetByUrl);
                     ssc.addEventListener(SoundsnapCellEvent.STOP_PLAY_SOUND,function():void
                     {
                        setButtonStatus(true);
                     });
                     if(this._nextColor)
                     {
                        ssc.setBGColor();
                     }
                     this._nextColor = !this._nextColor;
                     this._soundTileList.addChild(ssc);
                  }
               }
               if(this._hasMoreSoundsnaps == null)
               {
                  if(this._soundTileList.verticalScrollBar != null && this._soundTileList.verticalScrollBar.hasEventListener(MouseEvent.MOUSE_MOVE))
                  {
                     this._soundTileList.verticalScrollBar.removeEventListener(MouseEvent.CLICK,this.loadMoreSoundsnaps);
                     this._soundTileList.verticalScrollBar.removeEventListener(MouseEvent.MOUSE_MOVE,this.loadMoreSoundsnaps);
                  }
               }
               this._hasSoundsnap = true;
               this._searching = false;
            }
            else
            {
               this._bottom.show(UtilDict.toDisplay("import","import_alertnoresult"),UtilDict.toDisplay("import","import_alertnoresulttitle"));
               this._hasSoundsnap = false;
            }
         }
         else
         {
            this._bottom.show(UtilDict.toDisplay("import","import_errsoundsnap") + " " + checkCode,null,true);
         }
         this.setButtonStatus(true);
      }
      
      private function timerEventHandler(param1:Event) : void
      {
         if(this._soundTileList.verticalScrollBar != null)
         {
            this._soundTileList.verticalScrollBar.addEventListener(MouseEvent.CLICK,this.loadMoreSoundsnaps);
            this._soundTileList.verticalScrollBar.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
            this._soundTileList.verticalScrollBar.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         }
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         this._soundTileList.verticalScrollBar.addEventListener(MouseEvent.MOUSE_MOVE,this.loadMoreSoundsnaps);
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         if(this._soundTileList.verticalScrollBar.hasEventListener(MouseEvent.MOUSE_MOVE))
         {
            this._soundTileList.verticalScrollBar.removeEventListener(MouseEvent.MOUSE_MOVE,this.loadMoreSoundsnaps);
         }
         this.loadMoreSoundsnaps(param1);
      }
      
      private function loadMoreSoundsnaps(param1:Event) : void
      {
         var _loc2_:URLVariables = null;
         var _loc3_:URLRequest = null;
         var _loc4_:URLLoader = null;
         if(this._hasMoreSoundsnaps != null && !this._searching)
         {
            if(this._soundTileList.verticalScrollBar.scrollPosition <= this.lastPosition)
            {
               this.lastPosition = this._soundTileList.verticalScrollBar.scrollPosition;
               return;
            }
            this.lastPosition = this._soundTileList.verticalScrollBar.scrollPosition;
            if(this._soundTileList.verticalScrollBar.scrollPosition / this._soundTileList.verticalScrollBar.maxScrollPosition > 0.95)
            {
               CursorManager.setBusyCursor();
               this._searching = true;
               _loc2_ = new URLVariables();
               this._bottom.addFlashVarsToURLvar(_loc2_);
               _loc2_["keywords"] = this._hasMoreSoundsnaps;
               _loc3_ = new URLRequest(ServerConstants.ACTION_SEARCH_SOUNDSNAP);
               _loc3_.method = URLRequestMethod.POST;
               _loc3_.data = _loc2_;
               (_loc4_ = new URLLoader()).dataFormat = URLLoaderDataFormat.TEXT;
               _loc4_.addEventListener(Event.COMPLETE,this.onSearchSoundsnapComplete);
               _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.error);
               _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
               _loc4_.load(_loc3_);
               this._hasMoreSoundsnaps = null;
            }
         }
      }
      
      private function onClickSoundsnapCell(param1:Event) : void
      {
         var _loc2_:SoundsnapCell = SoundsnapCell(param1.target);
         if(this._selectedSoundsnapCell != null)
         {
            this._selectedSoundsnapCell.stopSound();
         }
         this._selectedSoundsnapCell = _loc2_;
         this._bottom.title = _loc2_.title;
         this._bottom.tags = _loc2_.tags;
      }
      
      private function error(param1:Event) : void
      {
         this._bottom.show("Error:  " + param1.type + "\nCannot proceede","Error",true);
         this.setButtonStatus(true);
      }
      
      private function uploadUserAssetByUrl(param1:Event) : void
      {
         this._selectedSoundsnapCell = param1.target as SoundsnapCell;
         this._bottom.title = this._selectedSoundsnapCell.title;
         this._bottom.tags = this._selectedSoundsnapCell.tags;
         this._bottom.showPopUp(this.upload,"uploads");
      }
      
      public function upload() : void
      {
         var request:URLRequest = null;
         this.setButtonStatus(false);
         var variables:URLVariables = new URLVariables();
         this._bottom.addFlashVarsToURLvar(variables);
         variables["url"] = this._selectedSoundsnapCell.url;
         variables["title"] = this._bottom.title;
         variables["keywords"] = this._bottom.tags;
         variables["subtype"] = this._bottom.subtype;
         variables["is_published"] = !!this._bottom.isPublished ? "1" : "0";
         variables["source"] = "soundsnap";
         variables["type"] = "sound";
         request = new URLRequest(ServerConstants.ACTION_SAVE_SOUND_BY_URL);
         request.data = variables;
         request.method = URLRequestMethod.POST;
         var urlLoader:URLLoader = new URLLoader();
         urlLoader.addEventListener(Event.COMPLETE,this._bottom.onUploadCustomAssetComplete);
         urlLoader.addEventListener(Event.COMPLETE,function():void
         {
            setButtonStatus(true);
         });
         urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.error);
         urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
         urlLoader.load(request);
      }
      
      public function ___txtSoundsnap_enter(param1:FlexEvent) : void
      {
         this.searchSoundsnap(this._txtSoundsnap.text);
      }
      
      public function ___txtSoundsnap_creationComplete(param1:FlexEvent) : void
      {
         this._txtSoundsnap.text = this._keywords;
      }
      
      public function ___btnSearchSound_click(param1:MouseEvent) : void
      {
         this.searchSoundsnap(this._txtSoundsnap.text);
      }
      
      private function _SoundsnapWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return !_searching;
         },null,"_txtSoundsnap.editable");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_search");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSearchSound.label");
         result[2] = new Binding(this,function():Boolean
         {
            return !_searching;
         },null,"_btnSearchSound.enabled");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_swtitle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundsnapWindow_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSearchSound() : Button
      {
         return this._1939997290_btnSearchSound;
      }
      
      public function set _btnSearchSound(param1:Button) : void
      {
         var _loc2_:Object = this._1939997290_btnSearchSound;
         if(_loc2_ !== param1)
         {
            this._1939997290_btnSearchSound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSearchSound",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _imageSoundsnap() : Image
      {
         return this._923610019_imageSoundsnap;
      }
      
      public function set _imageSoundsnap(param1:Image) : void
      {
         var _loc2_:Object = this._923610019_imageSoundsnap;
         if(_loc2_ !== param1)
         {
            this._923610019_imageSoundsnap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_imageSoundsnap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _soundTileList() : Tile
      {
         return this._1051725668_soundTileList;
      }
      
      public function set _soundTileList(param1:Tile) : void
      {
         var _loc2_:Object = this._1051725668_soundTileList;
         if(_loc2_ !== param1)
         {
            this._1051725668_soundTileList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_soundTileList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtSoundsnap() : TextInput
      {
         return this._2028921176_txtSoundsnap;
      }
      
      public function set _txtSoundsnap(param1:TextInput) : void
      {
         var _loc2_:Object = this._2028921176_txtSoundsnap;
         if(_loc2_ !== param1)
         {
            this._2028921176_txtSoundsnap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtSoundsnap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _searching() : Boolean
      {
         return this._289303483_searching;
      }
      
      private function set _searching(param1:Boolean) : void
      {
         var _loc2_:Object = this._289303483_searching;
         if(_loc2_ !== param1)
         {
            this._289303483_searching = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_searching",_loc2_,param1));
            }
         }
      }
   }
}
