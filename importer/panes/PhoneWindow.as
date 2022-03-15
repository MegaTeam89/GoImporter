package importer.panes
{
   import anifire.constant.ServerConstants;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.getDefinitionByName;
   import importer.panes.voiceRecord.PhoneRecordController;
   import importer.panes.voiceRecord.PhoneRecordEvent;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class PhoneWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _PhoneWindow_Label1:Label;
      
      public var _PhoneWindow_Label2:Label;
      
      public var _PhoneWindow_Label3:Label;
      
      private var _894799851_btnSubmit:Button;
      
      private var _923610019_imageSoundsnap:Image;
      
      private var _1470843244_myVox:Canvas;
      
      private var _739400877phoneRecordInfo:Text;
      
      private var _2108636111phoneRecordStatus:Text;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _soundUrl:String = "";
      
      private var _bottom:importer;
      
      private var _246668073_htmlText:String;
      
      private var _91291148_text:String;
      
      public var isOpen:Boolean = false;
      
      private var _phoneRecordController:PhoneRecordController = null;
      
      private var _embed_mxml____ico_phone_swf_722535565:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PhoneWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"_imageSoundsnap",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "source":_embed_mxml____ico_phone_swf_722535565,
                        "y":24,
                        "width":75,
                        "height":75,
                        "scaleContent":true,
                        "autoLoad":true,
                        "x":47
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"_myVox",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":115,
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off",
                        "enabled":true,
                        "percentWidth":100,
                        "label":"Record Now",
                        "left":5,
                        "right":5,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"phoneRecordStatus",
                           "stylesFactory":function():void
                           {
                              this.color = 967233;
                              this.fontSize = 20;
                              this.textAlign = "center";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":573,
                                 "height":34,
                                 "x":75,
                                 "y":306
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"phoneRecordInfo",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":500,
                                 "x":157.5,
                                 "y":48,
                                 "height":231
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"_btnSubmit",
                           "events":{"click":"___btnSubmit_click"},
                           "stylesFactory":function():void
                           {
                              this.themeColor = 16742400;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"btnBlack",
                                 "width":89,
                                 "buttonMode":true,
                                 "x":317.5,
                                 "y":344,
                                 "enabled":false
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Label,
                           "id":"_PhoneWindow_Label1",
                           "stylesFactory":function():void
                           {
                              this.fontSize = 16;
                              this.fontWeight = "bold";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "x":157.5,
                                 "y":10,
                                 "width":442.5
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"_PhoneWindow_Label2",
                  "stylesFactory":function():void
                  {
                     this.fontSize = 26;
                     this.fontWeight = "bold";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":120,
                        "y":46
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"_PhoneWindow_Label3",
                  "stylesFactory":function():void
                  {
                     this.fontSize = 12;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":122,
                        "y":78
                     };
                  }
               })]};
            }
         });
         this._embed_mxml____ico_phone_swf_722535565 = PhoneWindow__embed_mxml____ico_phone_swf_722535565;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._PhoneWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_PhoneWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PhoneWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PhoneWindow._watcherSetupUtil = param1;
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
            this.dispatchEvent(new Event("inited"));
         }
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
         this._bottom.setButtonStatus(param1);
         this._btnSubmit.enabled = param1;
      }
      
      public function startPhone() : void
      {
         if(this._bottom != null)
         {
            this.startPhoneRecord();
         }
         else
         {
            this.addEventListener("inited",this.startPhoneRecord);
         }
      }
      
      private function get phoneRecordController() : PhoneRecordController
      {
         return this._phoneRecordController;
      }
      
      private function set phoneRecordController(param1:PhoneRecordController) : void
      {
         this._phoneRecordController = param1;
      }
      
      private function convertSecToTimeString(param1:Number) : String
      {
         var _loc2_:Number = param1 % 60;
         if(_loc2_ < 10)
         {
            return param1 / 60 + ":0" + _loc2_;
         }
         return param1 / 60 + ":" + param1 % 60;
      }
      
      private function onPhoneRecordStatusChange(param1:PhoneRecordEvent) : void
      {
         var _loc2_:Date = null;
         switch(param1.type)
         {
            case PhoneRecordEvent.PHONE_RECORD_SOUND_FILE_READY:
               this.isOpen = false;
               this.phoneRecordController = null;
               this._soundUrl = param1.soundUrl;
               this._btnSubmit.enabled = true;
               this.showPhoneRecordMsg(UtilDict.toDisplay("import","import_pwcomplete"));
               this.showPhoneRecordStatus("");
               if(this._bottom.title == "untitled" || this._bottom.title == "")
               {
                  _loc2_ = new Date();
                  this._bottom.title = _loc2_.getFullYear() + "/" + (_loc2_.getMonth() + 1) + "/" + _loc2_.getDate() + " " + _loc2_.getHours() + ":" + _loc2_.getMinutes() + " (" + UtilDict.toDisplay("import","import_pwduration") + ": " + this.convertSecToTimeString(param1.soundLengthInSecond) + ")";
               }
               break;
            case PhoneRecordEvent.PHONE_RECORD_PHONENUM_DETAIL_READY:
               this.isOpen = true;
               this.showPhoneRecordMsg("<ol><font size=\'20\'>" + "<li>" + UtilDict.toDisplay("import","import_pwstep1") + " <span style=\"color: rgb(51, 204, 0);\">1-" + param1.phoneNum + "</span>" + "</li><br>" + "<li>" + UtilDict.toDisplay("import","import_pwstep2") + " <span style=\"color: rgb(51, 204, 0);\">" + param1.pin + "#</span>" + "</li><br>" + "<li>" + UtilDict.toDisplay("import","import_pwstep3") + "</li><br>" + "<li>" + UtilDict.toDisplay("import","import_pwstep4") + "</li><br>" + "<li>" + UtilDict.toDisplay("import","import_pwstep5") + "</li>" + "</font></ol>");
               break;
            case PhoneRecordEvent.PHONE_RECORD_USER_PHONE_IN:
               this.showPhoneRecordStatus(UtilDict.toDisplay("import","import_pinverify"));
               break;
            case PhoneRecordEvent.PHONE_RECORD_USER_RECORDING:
               this.showPhoneRecordStatus("Recording...");
               break;
            case PhoneRecordEvent.PHONE_RECORD_USER_HANG_UP_INCOMPLETE:
               this.isOpen = false;
               this.showPhoneRecordStatus(UtilDict.toDisplay("import","import_pwerragain"));
               break;
            case PhoneRecordEvent.PHONE_RECORD_SESSION_EXPIRED:
            case PhoneRecordEvent.PHONE_RECORD_ERROR:
               this.isOpen = false;
               this.showPhoneRecordStatus(UtilDict.toDisplay("import","import_pwerrback"));
         }
      }
      
      public function startPhoneRecord(param1:Event = null) : void
      {
         if(this.phoneRecordController == null)
         {
            this.phoneRecordController = new PhoneRecordController(this._bottom);
            this.phoneRecordController.addEventListener(PhoneRecordEvent.PHONE_RECORD_PHONENUM_DETAIL_READY,this.onPhoneRecordStatusChange);
            this.phoneRecordController.addEventListener(PhoneRecordEvent.PHONE_RECORD_USER_PHONE_IN,this.onPhoneRecordStatusChange);
            this.phoneRecordController.addEventListener(PhoneRecordEvent.PHONE_RECORD_USER_RECORDING,this.onPhoneRecordStatusChange);
            this.phoneRecordController.addEventListener(PhoneRecordEvent.PHONE_RECORD_SOUND_FILE_READY,this.onPhoneRecordStatusChange);
            this.phoneRecordController.addEventListener(PhoneRecordEvent.PHONE_RECORD_USER_HANG_UP_INCOMPLETE,this.onPhoneRecordStatusChange);
            this.phoneRecordController.addEventListener(PhoneRecordEvent.PHONE_RECORD_SESSION_EXPIRED,this.onPhoneRecordStatusChange);
            this.phoneRecordController.addEventListener(PhoneRecordEvent.PHONE_RECORD_ERROR,this.onPhoneRecordStatusChange);
         }
         this.showPhoneRecordMsg(UtilDict.toDisplay("import","import_pwpleasewait"));
         this.phoneRecordController.startPhoneRecord();
         if(this._btnSubmit != null)
         {
            this._btnSubmit.enabled = false;
         }
      }
      
      public function showPhoneRecordMsg(param1:String) : void
      {
         this._htmlText = param1;
      }
      
      public function showPhoneRecordStatus(param1:String) : void
      {
         this._text = param1;
      }
      
      public function close() : void
      {
         if(this.phoneRecordController != null)
         {
            this._phoneRecordController.stopPhoneRecord();
            this.phoneRecordController = null;
         }
         this.isOpen = false;
      }
      
      private function submit() : void
      {
         this._bottom.showPopUp(this.upload,"uploads");
      }
      
      public function upload() : void
      {
         var request:URLRequest = null;
         this.setButtonStatus(false);
         var variables:URLVariables = new URLVariables();
         this._bottom.addFlashVarsToURLvar(variables);
         variables["url"] = this._soundUrl;
         variables["title"] = this._bottom.title;
         variables["keywords"] = this._bottom.tags;
         variables["subtype"] = this._bottom.subtype;
         variables["is_published"] = !!this._bottom.isPublished ? "1" : "0";
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
      
      private function error(param1:Event) : void
      {
         this._bottom.show("Error:  " + param1.type + "\nCannot proceede\n","Error",true);
         this.setButtonStatus(true);
      }
      
      public function ___btnSubmit_click(param1:MouseEvent) : void
      {
         this.submit();
      }
      
      private function _PhoneWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _text;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"phoneRecordStatus.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _htmlText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"phoneRecordInfo.htmlText");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_pwsubmit");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSubmit.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_pwinfo1");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_PhoneWindow_Label1.text");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_pwinfo2");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_PhoneWindow_Label2.text");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_pwinfo3");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_PhoneWindow_Label3.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSubmit() : Button
      {
         return this._894799851_btnSubmit;
      }
      
      public function set _btnSubmit(param1:Button) : void
      {
         var _loc2_:Object = this._894799851_btnSubmit;
         if(_loc2_ !== param1)
         {
            this._894799851_btnSubmit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSubmit",_loc2_,param1));
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
      public function get _myVox() : Canvas
      {
         return this._1470843244_myVox;
      }
      
      public function set _myVox(param1:Canvas) : void
      {
         var _loc2_:Object = this._1470843244_myVox;
         if(_loc2_ !== param1)
         {
            this._1470843244_myVox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_myVox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get phoneRecordInfo() : Text
      {
         return this._739400877phoneRecordInfo;
      }
      
      public function set phoneRecordInfo(param1:Text) : void
      {
         var _loc2_:Object = this._739400877phoneRecordInfo;
         if(_loc2_ !== param1)
         {
            this._739400877phoneRecordInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"phoneRecordInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get phoneRecordStatus() : Text
      {
         return this._2108636111phoneRecordStatus;
      }
      
      public function set phoneRecordStatus(param1:Text) : void
      {
         var _loc2_:Object = this._2108636111phoneRecordStatus;
         if(_loc2_ !== param1)
         {
            this._2108636111phoneRecordStatus = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"phoneRecordStatus",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _htmlText() : String
      {
         return this._246668073_htmlText;
      }
      
      private function set _htmlText(param1:String) : void
      {
         var _loc2_:Object = this._246668073_htmlText;
         if(_loc2_ !== param1)
         {
            this._246668073_htmlText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_htmlText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _text() : String
      {
         return this._91291148_text;
      }
      
      private function set _text(param1:String) : void
      {
         var _loc2_:Object = this._91291148_text;
         if(_loc2_ !== param1)
         {
            this._91291148_text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_text",_loc2_,param1));
            }
         }
      }
   }
}
