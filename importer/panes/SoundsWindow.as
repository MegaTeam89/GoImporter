package importer.panes
{
   import anifire.constant.AnimeConstants;
   import anifire.managers.FeatureManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilLicense;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.LinkButton;
   import mx.controls.Text;
   import mx.controls.TextInput;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class SoundsWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundsWindow_Label1:Label;
      
      public var _SoundsWindow_Label2:Label;
      
      public var _SoundsWindow_Label3:Label;
      
      public var _SoundsWindow_Label4:Label;
      
      public var _SoundsWindow_Text3:Text;
      
      private var _2110219823_btnPhone:LinkButton;
      
      private var _280490948_btnSoundsnap:Button;
      
      private var _923610019_imageSoundsnap:Image;
      
      private var _384588720_soundNonUploadableNotice:Canvas;
      
      private var _327318201_txtSearch:TextInput;
      
      private var _1847246922_txtSoundNonUploadable:Text;
      
      private var _1564649305_txtSoundUploadable:Text;
      
      private var _22440074_vsUploadS:UploadFileWindow;
      
      private var _653889493soundsnapPanel:VBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bottom:importer;
      
      private var _2945332_tts:Boolean;
      
      private var _embed_mxml____ico_soundsnap_swf_130014181:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundsWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"_soundNonUploadableNotice",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "visible":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"_txtSoundNonUploadable",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"txtSoundUploadDisabled",
                                 "width":388,
                                 "height":136,
                                 "selectable":false
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_txtSoundUploadable",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"txtSoundUploadEnabled",
                                 "width":545,
                                 "height":41,
                                 "selectable":false
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.verticalGap = 20;
                     this.paddingLeft = 72;
                     this.paddingRight = 72;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":128,
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":VBox,
                           "id":"soundsnapPanel",
                           "stylesFactory":function():void
                           {
                              this.horizontalAlign = "center";
                              this.verticalGap = 10;
                              this.paddingBottom = 5;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "styleName":"WhiteBox",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"stickWeb",
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "id":"_SoundsWindow_Label1",
                                             "propertiesFactory":function():Object
                                             {
                                                return {"styleName":"stickWebText"};
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":TextInput,
                                          "id":"_txtSearch",
                                          "events":{"enter":"___txtSearch_enter"},
                                          "stylesFactory":function():void
                                          {
                                             this.borderColor = 8947848;
                                             this.themeColor = 8947848;
                                             this.fontSize = 14;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "width":285,
                                                "height":28,
                                                "editable":true,
                                                "enabled":true
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Button,
                                          "id":"_btnSoundsnap",
                                          "events":{"click":"___btnSoundsnap_click"},
                                          "stylesFactory":function():void
                                          {
                                             this.themeColor = 16742400;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "maxWidth":150,
                                                "styleName":"btnBlack",
                                                "buttonMode":true
                                             };
                                          }
                                       })]};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":Label,
                                          "id":"_SoundsWindow_Label2",
                                          "stylesFactory":function():void
                                          {
                                             this.fontSize = 13;
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Image,
                                          "id":"_imageSoundsnap",
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "source":_embed_mxml____ico_soundsnap_swf_130014181,
                                                "width":105,
                                                "height":35,
                                                "scaleContent":true,
                                                "autoLoad":true,
                                                "x":527
                                             };
                                          }
                                       })]};
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":VBox,
                           "stylesFactory":function():void
                           {
                              this.horizontalAlign = "center";
                              this.verticalGap = 10;
                              this.paddingBottom = 10;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "styleName":"WhiteBox",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"stickComputer",
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "id":"_SoundsWindow_Label3",
                                             "propertiesFactory":function():Object
                                             {
                                                return {"styleName":"stickComputerText"};
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":UploadFileWindow,
                                    "id":"_vsUploadS",
                                    "events":{
                                       "show":"___vsUploadS_show",
                                       "creationComplete":"___vsUploadS_creationComplete"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"upload_message":false};
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":HBox,
                           "stylesFactory":function():void
                           {
                              this.horizontalGap = 20;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "visible":false,
                                 "includeInLayout":false,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":VBox,
                                    "events":{"click":"___SoundsWindow_VBox4_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalAlign = "center";
                                       this.verticalGap = 5;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "visible":false,
                                          "percentWidth":100,
                                          "mouseChildren":false,
                                          "buttonMode":true,
                                          "styleName":"WhiteBox",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Canvas,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "styleName":"stickPhone",
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":Label,
                                                      "id":"_SoundsWindow_Label4",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"styleName":"stickPhoneText"};
                                                      }
                                                   })]
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Text,
                                             "id":"_SoundsWindow_Text3",
                                             "stylesFactory":function():void
                                             {
                                                this.fontSize = 12;
                                                this.fontWeight = "bold";
                                                this.textAlign = "center";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "x":398,
                                                   "y":401,
                                                   "selectable":false,
                                                   "percentWidth":100
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":LinkButton,
                                             "id":"_btnPhone",
                                             "events":{"click":"___btnPhone_click"},
                                             "stylesFactory":function():void
                                             {
                                                this.fontStyle = "italic";
                                                this.color = 8960767;
                                                this.fontSize = 17;
                                                this.themeColor = 16777215;
                                                this.fontAntiAliasType = "normal";
                                                this.fontWeight = "bold";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "x":471,
                                                   "y":458
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._embed_mxml____ico_soundsnap_swf_130014181 = SoundsWindow__embed_mxml____ico_soundsnap_swf_130014181;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundsWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_SoundsWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundsWindow[param1];
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
         SoundsWindow._watcherSetupUtil = param1;
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
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         if(param1 == null)
         {
            return;
         }
         this._bottom = param1 as importer;
         if(this._vsUploadS != null)
         {
            this._vsUploadS.init(this._bottom);
         }
         if(!UtilLicense.isSoundUploadable)
         {
            _loc2_ = 0;
            while(_loc2_ < this.numChildren)
            {
               _loc3_ = this.getChildAt(_loc2_);
               _loc3_.visible = false;
               _loc2_++;
            }
            this._soundNonUploadableNotice.visible = true;
            this._txtSoundNonUploadable.text = UtilDict.toDisplay("go",AnimeConstants.SOUND_NON_UPLOADABLE_MSG) + " " + this._bottom.licensorName;
         }
      }
      
      public function set ttsEnabled(param1:Boolean) : void
      {
         this._tts = param1;
      }
      
      public function noTTS(param1:Event = null) : void
      {
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
         this._bottom.setButtonStatus(param1);
      }
      
      private function onTTSHandler() : void
      {
      }
      
      private function onPhoneHandler() : void
      {
         this._bottom.doPhone();
      }
      
      public function ___txtSearch_enter(param1:FlexEvent) : void
      {
         this._bottom.doSearchSoundsnap(this._txtSearch.text);
      }
      
      public function ___btnSoundsnap_click(param1:MouseEvent) : void
      {
         this._bottom.doSearchSoundsnap(this._txtSearch.text);
      }
      
      public function ___vsUploadS_show(param1:FlexEvent) : void
      {
         this._vsUploadS.init(this._bottom);
      }
      
      public function ___vsUploadS_creationComplete(param1:FlexEvent) : void
      {
         this._vsUploadS.init(this._bottom);
         this._vsUploadS.filter = "sounds";
      }
      
      public function ___SoundsWindow_VBox4_click(param1:MouseEvent) : void
      {
         this.onPhoneHandler();
      }
      
      public function ___btnPhone_click(param1:MouseEvent) : void
      {
         this.onPhoneHandler();
      }
      
      private function _SoundsWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",AnimeConstants.SOUND_UPLOADABLE_MSG);
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtSoundUploadable.text");
         result[1] = new Binding(this,function():Boolean
         {
            return FeatureManager.shouldSoundSnapBeShown;
         },null,"soundsnapPanel.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return FeatureManager.shouldSoundSnapBeShown;
         },null,"soundsnapPanel.includeInLayout");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = "+ " + UtilDict.toDisplay("import","From the web");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundsWindow_Label1.text");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_search");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSoundsnap.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_poweredby");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundsWindow_Label2.text");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = "+ " + UtilDict.toDisplay("import","From your computer");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundsWindow_Label3.text");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = "+ " + UtilDict.toDisplay("import","Record via phone");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundsWindow_Label4.text");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_pwinfo3");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundsWindow_Text3.text");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_goforit");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnPhone.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPhone() : LinkButton
      {
         return this._2110219823_btnPhone;
      }
      
      public function set _btnPhone(param1:LinkButton) : void
      {
         var _loc2_:Object = this._2110219823_btnPhone;
         if(_loc2_ !== param1)
         {
            this._2110219823_btnPhone = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPhone",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSoundsnap() : Button
      {
         return this._280490948_btnSoundsnap;
      }
      
      public function set _btnSoundsnap(param1:Button) : void
      {
         var _loc2_:Object = this._280490948_btnSoundsnap;
         if(_loc2_ !== param1)
         {
            this._280490948_btnSoundsnap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSoundsnap",_loc2_,param1));
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
      public function get _soundNonUploadableNotice() : Canvas
      {
         return this._384588720_soundNonUploadableNotice;
      }
      
      public function set _soundNonUploadableNotice(param1:Canvas) : void
      {
         var _loc2_:Object = this._384588720_soundNonUploadableNotice;
         if(_loc2_ !== param1)
         {
            this._384588720_soundNonUploadableNotice = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_soundNonUploadableNotice",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtSearch() : TextInput
      {
         return this._327318201_txtSearch;
      }
      
      public function set _txtSearch(param1:TextInput) : void
      {
         var _loc2_:Object = this._327318201_txtSearch;
         if(_loc2_ !== param1)
         {
            this._327318201_txtSearch = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtSearch",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtSoundNonUploadable() : Text
      {
         return this._1847246922_txtSoundNonUploadable;
      }
      
      public function set _txtSoundNonUploadable(param1:Text) : void
      {
         var _loc2_:Object = this._1847246922_txtSoundNonUploadable;
         if(_loc2_ !== param1)
         {
            this._1847246922_txtSoundNonUploadable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtSoundNonUploadable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtSoundUploadable() : Text
      {
         return this._1564649305_txtSoundUploadable;
      }
      
      public function set _txtSoundUploadable(param1:Text) : void
      {
         var _loc2_:Object = this._1564649305_txtSoundUploadable;
         if(_loc2_ !== param1)
         {
            this._1564649305_txtSoundUploadable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtSoundUploadable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vsUploadS() : UploadFileWindow
      {
         return this._22440074_vsUploadS;
      }
      
      public function set _vsUploadS(param1:UploadFileWindow) : void
      {
         var _loc2_:Object = this._22440074_vsUploadS;
         if(_loc2_ !== param1)
         {
            this._22440074_vsUploadS = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vsUploadS",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundsnapPanel() : VBox
      {
         return this._653889493soundsnapPanel;
      }
      
      public function set soundsnapPanel(param1:VBox) : void
      {
         var _loc2_:Object = this._653889493soundsnapPanel;
         if(_loc2_ !== param1)
         {
            this._653889493soundsnapPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundsnapPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _tts() : Boolean
      {
         return this._2945332_tts;
      }
      
      private function set _tts(param1:Boolean) : void
      {
         var _loc2_:Object = this._2945332_tts;
         if(_loc2_ !== param1)
         {
            this._2945332_tts = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tts",_loc2_,param1));
            }
         }
      }
   }
}
