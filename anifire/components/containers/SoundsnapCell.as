package anifire.components.containers
{
   import anifire.events.SoundsnapCellEvent;
   import anifire.util.UtilDict;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.net.URLRequest;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.Label;
   import mx.controls.LinkButton;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class SoundsnapCell extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _2107234958_btnSound:LinkButton;
      
      private var _899774209_btnSound1:LinkButton;
      
      private var _841859586_btnUpload:Button;
      
      private var _1233296299_lblDuration:Label;
      
      private var _710712415_lblTitle:Label;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1464826535_title:String;
      
      private var _1901494541_duration:String;
      
      private var _tags:String = "";
      
      private var _url:String;
      
      private var _sound:Sound;
      
      private var _soundChannel:SoundChannel;
      
      private var _isPlaying:Boolean = false;
      
      private var _embed_mxml__________importer_btn_play_over_swf_602538158:Class;
      
      private var _embed_mxml__________importer_btn_stop_swf_957543726:Class;
      
      private var _embed_mxml__________importer_btn_play_swf_1561460038:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundsnapCell()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{
               "creationComplete":"___SoundsnapCell_Canvas1_creationComplete",
               "mouseOver":"___SoundsnapCell_Canvas1_mouseOver",
               "mouseOut":"___SoundsnapCell_Canvas1_mouseOut"
            },
            "stylesFactory":function():void
            {
               this.backgroundAlpha = 0.4;
               this.shadowDirection = "center";
               this.shadowDistance = 5;
               this.dropShadowColor = 0;
               this.dropShadowEnabled = true;
               this.letterSpacing = 0;
               this.backgroundColor = 16777215;
               this.cornerRadius = 8;
               this.themeColor = 16742400;
            },
            "propertiesFactory":function():Object
            {
               return {
                  "width":475,
                  "height":33,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Button,
                     "id":"_btnUpload",
                     "events":{"click":"___btnUpload_click"},
                     "stylesFactory":function():void
                     {
                        this.fontSize = 16;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":377,
                           "y":3,
                           "height":27,
                           "styleName":"btnBlack",
                           "width":95,
                           "visible":true
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":LinkButton,
                     "id":"_btnSound",
                     "events":{"click":"___btnSound_click"},
                     "stylesFactory":function():void
                     {
                        this.downSkin = _embed_mxml__________importer_btn_play_swf_1561460038;
                        this.upSkin = _embed_mxml__________importer_btn_play_swf_1561460038;
                        this.overSkin = _embed_mxml__________importer_btn_play_over_swf_602538158;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":343,
                           "y":3,
                           "visible":true,
                           "height":27,
                           "width":27
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":LinkButton,
                     "id":"_btnSound1",
                     "events":{"click":"___btnSound1_click"},
                     "stylesFactory":function():void
                     {
                        this.downSkin = _embed_mxml__________importer_btn_stop_swf_957543726;
                        this.upSkin = _embed_mxml__________importer_btn_stop_swf_957543726;
                        this.overSkin = _embed_mxml__________importer_btn_stop_swf_957543726;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":343,
                           "y":3,
                           "visible":false,
                           "height":27,
                           "width":27
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"_lblTitle",
                     "stylesFactory":function():void
                     {
                        this.fontSize = 15;
                        this.fontWeight = "normal";
                        this.textAlign = "center";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":0,
                           "y":6,
                           "width":263
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"_lblDuration",
                     "stylesFactory":function():void
                     {
                        this.textAlign = "center";
                        this.fontSize = 16;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":261,
                           "y":6,
                           "width":76
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__________importer_btn_play_over_swf_602538158 = SoundsnapCell__embed_mxml__________importer_btn_play_over_swf_602538158;
         this._embed_mxml__________importer_btn_stop_swf_957543726 = SoundsnapCell__embed_mxml__________importer_btn_stop_swf_957543726;
         this._embed_mxml__________importer_btn_play_swf_1561460038 = SoundsnapCell__embed_mxml__________importer_btn_play_swf_1561460038;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundsnapCell_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_containers_SoundsnapCellWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundsnapCell[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 475;
         this.height = 33;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",this.___SoundsnapCell_Canvas1_creationComplete);
         this.addEventListener("mouseOver",this.___SoundsnapCell_Canvas1_mouseOver);
         this.addEventListener("mouseOut",this.___SoundsnapCell_Canvas1_mouseOut);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundsnapCell._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundAlpha = 0.4;
            this.shadowDirection = "center";
            this.shadowDistance = 5;
            this.dropShadowColor = 0;
            this.dropShadowEnabled = true;
            this.letterSpacing = 0;
            this.backgroundColor = 16777215;
            this.cornerRadius = 8;
            this.themeColor = 16742400;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
         this.toolTip = param1;
      }
      
      public function get duration() : String
      {
         return this._duration;
      }
      
      public function set duration(param1:String) : void
      {
         this._duration = param1;
      }
      
      public function get tags() : String
      {
         return this._tags;
      }
      
      public function set tags(param1:String) : void
      {
         this._tags = param1;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(param1:String) : void
      {
         this._url = param1;
      }
      
      public function stopSound(param1:Event = null) : void
      {
         var ev:Event = param1;
         if(this._soundChannel != null)
         {
            this._isPlaying = false;
            this._btnSound1.visible = false;
            try
            {
               this._soundChannel.stop();
               this._sound.close();
            }
            catch(error:IOError)
            {
            }
            finally
            {
               this._sound = null;
               this._soundChannel = null;
               this.dispatchEvent(new SoundsnapCellEvent(SoundsnapCellEvent.STOP_PLAY_SOUND));
            }
         }
      }
      
      public function setBGColor() : void
      {
         this.setStyle("backgroundColor","#88BAFF");
      }
      
      private function init() : void
      {
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
      }
      
      private function dispatchCellEvent(param1:Event) : void
      {
         this.stopSound();
         this.dispatchEvent(new SoundsnapCellEvent(SoundsnapCellEvent.UPLOAD_SOUND_EVENT));
      }
      
      private function play() : void
      {
         var _loc1_:URLRequest = null;
         if(this._sound == null)
         {
            this._sound = new Sound();
         }
         if(this._isPlaying == true)
         {
            this.stopSound();
         }
         else
         {
            this._isPlaying = true;
            _loc1_ = new URLRequest(this.url);
            this._sound.load(_loc1_);
            this._soundChannel = this._sound.play();
            this._btnSound1.visible = true;
            this.dispatchEvent(new SoundsnapCellEvent(SoundsnapCellEvent.START_PLAY_SOUND));
            this._soundChannel.addEventListener(Event.SOUND_COMPLETE,this.stopSound);
         }
      }
      
      private function mouseOverHandler() : void
      {
         this.setStyle("shadowDistance","2");
      }
      
      private function mouseOutHandler() : void
      {
         this.setStyle("shadowDistance","0");
      }
      
      public function ___SoundsnapCell_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___SoundsnapCell_Canvas1_mouseOver(param1:MouseEvent) : void
      {
         this.mouseOverHandler();
      }
      
      public function ___SoundsnapCell_Canvas1_mouseOut(param1:MouseEvent) : void
      {
         this.mouseOutHandler();
      }
      
      public function ___btnUpload_click(param1:MouseEvent) : void
      {
         this.dispatchCellEvent(param1);
      }
      
      public function ___btnSound_click(param1:MouseEvent) : void
      {
         this.play();
      }
      
      public function ___btnSound1_click(param1:MouseEvent) : void
      {
         this.stopSound();
      }
      
      private function _SoundsnapCell_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","Upload");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnUpload.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _title;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_lblTitle.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = _duration;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_lblDuration.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSound() : LinkButton
      {
         return this._2107234958_btnSound;
      }
      
      public function set _btnSound(param1:LinkButton) : void
      {
         var _loc2_:Object = this._2107234958_btnSound;
         if(_loc2_ !== param1)
         {
            this._2107234958_btnSound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSound",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSound1() : LinkButton
      {
         return this._899774209_btnSound1;
      }
      
      public function set _btnSound1(param1:LinkButton) : void
      {
         var _loc2_:Object = this._899774209_btnSound1;
         if(_loc2_ !== param1)
         {
            this._899774209_btnSound1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSound1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnUpload() : Button
      {
         return this._841859586_btnUpload;
      }
      
      public function set _btnUpload(param1:Button) : void
      {
         var _loc2_:Object = this._841859586_btnUpload;
         if(_loc2_ !== param1)
         {
            this._841859586_btnUpload = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnUpload",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _lblDuration() : Label
      {
         return this._1233296299_lblDuration;
      }
      
      public function set _lblDuration(param1:Label) : void
      {
         var _loc2_:Object = this._1233296299_lblDuration;
         if(_loc2_ !== param1)
         {
            this._1233296299_lblDuration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lblDuration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _lblTitle() : Label
      {
         return this._710712415_lblTitle;
      }
      
      public function set _lblTitle(param1:Label) : void
      {
         var _loc2_:Object = this._710712415_lblTitle;
         if(_loc2_ !== param1)
         {
            this._710712415_lblTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lblTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _title() : String
      {
         return this._1464826535_title;
      }
      
      private function set _title(param1:String) : void
      {
         var _loc2_:Object = this._1464826535_title;
         if(_loc2_ !== param1)
         {
            this._1464826535_title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_title",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _duration() : String
      {
         return this._1901494541_duration;
      }
      
      private function set _duration(param1:String) : void
      {
         var _loc2_:Object = this._1901494541_duration;
         if(_loc2_ !== param1)
         {
            this._1901494541_duration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_duration",_loc2_,param1));
            }
         }
      }
   }
}
