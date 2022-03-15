package anifire.components.studio
{
   import anifire.event.RemoveFromStage;
   import anifire.util.UtilDict;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.containers.Box;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.effects.Fade;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class PhotoRenderer extends Box
   {
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _94442_bm:Bitmap = null;
      
      private var _myTitle:String;
      
      private var _photoID:String;
      
      private var myImage:Image;
      
      private var _fade:Fade;
      
      private var currentSize:String = "max";
      
      private var _3655356xPos:int = 0;
      
      private var _3685147yPos:int = 0;
      
      private var _14800837bmWidth:int = 0;
      
      private var _891820718bmHeight:int = 0;
      
      private var uploadBtn:Button;
      
      private var myLabel:Label;
      
      private var myTimer:Timer = null;
      
      private var removedFromStage:RemoveFromStage = null;
      
      public function PhotoRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Box,
            "stylesFactory":function():void
            {
               this.borderStyle = "none";
               this.paddingLeft = 3;
               this.paddingRight = 3;
               this.paddingTop = 5;
               this.paddingBottom = 5;
               this.themeColor = 8960767;
            }
         });
         super();
         mx_internal::_document = this;
         this.buttonMode = true;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
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
            this.borderStyle = "none";
            this.paddingLeft = 3;
            this.paddingRight = 3;
            this.paddingTop = 5;
            this.paddingBottom = 5;
            this.themeColor = 8960767;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function set _3076010data(param1:Object) : void
      {
         var _loc2_:Canvas = null;
         var _loc3_:Label = null;
         super.data = param1;
         if(param1 != null && param1.bm == null)
         {
            this.removeAllChildren();
            _loc2_ = new Canvas();
            _loc2_.horizontalScrollPolicy = "off";
            _loc2_.verticalScrollPolicy = "off";
            _loc2_.setStyle("backgroundColor","White");
            _loc2_.setStyle("borderStyle","solid");
            _loc2_.setStyle("borderThickness",1);
            _loc2_.setStyle("cornerRadius",8);
            _loc2_.setStyle("dropShadowEnabled",true);
            _loc2_.setStyle("shadowDirection","center");
            _loc2_.percentHeight = 100;
            _loc2_.percentWidth = 100;
            _loc3_ = new Label();
            _loc3_.text = "Loading...";
            _loc3_.buttonMode = true;
            _loc3_.useHandCursor = true;
            _loc3_.mouseChildren = false;
            _loc2_.addChild(_loc3_);
            _loc3_.x = 54;
            _loc3_.y = 79;
            this.addChild(_loc2_);
            if(this.myTimer == null)
            {
               this.myTimer = new Timer(1500);
               this.myTimer.addEventListener(TimerEvent.TIMER,this.onTimerHandler);
               this.myTimer.start();
            }
         }
         else
         {
            this._bm = param1.bm;
            this.getPhotoPosition();
            this._myTitle = param1.title;
            this._photoID = param1.photoID;
            this.init();
         }
      }
      
      private function resetBitmapSize(param1:Event) : void
      {
         if(param1.target is RemoveFromStage)
         {
            if(this.removedFromStage != null && this.removedFromStage.hasEventListener("RemoveFromStage"))
            {
               this.removedFromStage.removeEventListener("RemoveFromStage",this.resetBitmapSize);
               this.removedFromStage = null;
            }
         }
         else if(this.hasEventListener(Event.REMOVED_FROM_STAGE))
         {
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.resetBitmapSize);
         }
         this._bm.height = this.bmHeight;
         this._bm.width = this.bmWidth;
         this._bm.x = this.xPos;
         this._bm.y = this.yPos;
      }
      
      private function onTimerHandler(param1:TimerEvent = null) : void
      {
         if(this.data != null && this.data.bm != null)
         {
            if(this.myTimer != null)
            {
               this.myTimer.stop();
               if(this.myTimer.hasEventListener(TimerEvent.TIMER))
               {
                  this.myTimer.removeEventListener(TimerEvent.TIMER,this.onTimerHandler);
                  this.myTimer = null;
               }
            }
         }
         else
         {
            dispatchEvent(new Event("loadNextSet",true,true));
         }
      }
      
      private function init() : void
      {
         this.removeAllChildren();
         var _loc1_:Canvas = new Canvas();
         _loc1_.horizontalScrollPolicy = "off";
         _loc1_.verticalScrollPolicy = "off";
         _loc1_.setStyle("backgroundColor","White");
         _loc1_.setStyle("borderStyle","solid");
         _loc1_.setStyle("borderThickness",1);
         _loc1_.setStyle("cornerRadius",8);
         _loc1_.setStyle("dropShadowEnabled",true);
         _loc1_.setStyle("shadowDirection","center");
         this.setStyle("cornerRadius",8);
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         this.uploadBtn = new Button();
         this.uploadBtn.label = UtilDict.toDisplay("import","Upload");
         this.uploadBtn.addEventListener(MouseEvent.CLICK,this.uploadBtnHandler);
         this.uploadBtn.width = 89;
         this.uploadBtn.x = 45.5;
         this.uploadBtn.y = 138;
         this.uploadBtn.styleName = "btnBlack";
         this.uploadBtn.visible = false;
         this.uploadBtn.setStyle("themeColor","#ff7800");
         _loc1_.addEventListener(ChildExistenceChangedEvent.CHILD_ADD,this.addPhotoEffect);
         this.myLabel = new Label();
         this.myLabel.percentWidth = 100;
         this.myLabel.text = this._myTitle;
         this.toolTip = this._myTitle;
         this.myLabel.buttonMode = true;
         this.myLabel.useHandCursor = true;
         this.myLabel.mouseChildren = false;
         this.myLabel.visible = false;
         this.myLabel.addEventListener(FlexEvent.SHOW,this.fadeEffectHandler);
         this.myLabel.addEventListener(FlexEvent.HIDE,this.fadeEffectHandler);
         this.uploadBtn.addEventListener(FlexEvent.SHOW,this.fadeEffectHandler);
         this.uploadBtn.addEventListener(FlexEvent.HIDE,this.fadeEffectHandler);
         this._fade = new Fade();
         this._fade.targets = [this.uploadBtn,this.myLabel];
         this._fade.duration = 250;
         this._fade.addEventListener(EffectEvent.EFFECT_START,this.effectStartHandler);
         this._fade.addEventListener(EffectEvent.EFFECT_END,this.effectEndHandler);
         this.myImage = new Image();
         this.myImage.addChild(this._bm);
         this._bm.x = this.xPos;
         this._bm.y = this.yPos;
         this.myImage.percentHeight = 100;
         this.myImage.percentWidth = 100;
         _loc1_.addChild(this.myImage);
         _loc1_.addChild(this.myLabel);
         _loc1_.addChild(this.uploadBtn);
         this.addChild(_loc1_);
      }
      
      private function fadeEffectHandler(param1:FlexEvent) : void
      {
         if(param1.type == FlexEvent.SHOW)
         {
            this._fade.alphaFrom = 0;
            this._fade.alphaTo = 1;
            this._fade.play();
         }
         else if(param1.type == FlexEvent.HIDE)
         {
            this._fade.alphaFrom = 1;
            this._fade.alphaTo = 0;
            this._fade.play();
         }
      }
      
      private function addPhotoEffect(param1:ChildExistenceChangedEvent) : void
      {
         var _loc2_:Fade = new Fade();
         (param1.relatedObject as DisplayObject).alpha = 0;
         _loc2_ = new Fade();
         _loc2_.alphaTo = 1;
         _loc2_.duration = 1000;
         _loc2_.target = param1.relatedObject as DisplayObject;
         _loc2_.play();
      }
      
      private function effectStartHandler(param1:EffectEvent) : void
      {
         dispatchEvent(new Event("effectStart",true,true));
      }
      
      private function effectEndHandler(param1:EffectEvent) : void
      {
         dispatchEvent(new Event("effectEnd",true,true));
      }
      
      private function loadNextSetHandler(param1:FlexEvent) : void
      {
         this.removeEventListener(FlexEvent.CREATION_COMPLETE,this.loadNextSetHandler);
         dispatchEvent(new Event("loadNextSet",true,true));
      }
      
      public function makeVisible(param1:Boolean) : void
      {
         this.uploadBtn.visible = param1;
         this.myLabel.visible = param1;
      }
      
      private function uploadBtnHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("upload"));
      }
      
      public function get bm() : Bitmap
      {
         return this._bm;
      }
      
      public function get myTitle() : String
      {
         return this._myTitle;
      }
      
      public function get photoID() : String
      {
         return this._photoID;
      }
      
      private function getPhotoPosition() : void
      {
         var _loc1_:Number = NaN;
         if(this.bm.width > 170 && this.bm.height > 165)
         {
            _loc1_ = Math.min(170 / this.bm.width,165 / this.bm.height);
            this.bm.width *= _loc1_;
            this.bm.height *= _loc1_;
         }
         else if(this.bm.width > 170)
         {
            _loc1_ = 170 / this.bm.width;
            this.bm.width *= _loc1_;
            this.bm.height *= _loc1_;
         }
         else if(this.bm.height > 165)
         {
            _loc1_ = 165 / this.bm.height;
            this.bm.width *= _loc1_;
            this.bm.height *= _loc1_;
         }
         this.bmWidth = this.bm.width;
         this.bmHeight = this.bm.height;
         this.xPos = (170 - this.bm.width) / 2;
         this.yPos = (165 - this.bm.height) / 2;
      }
      
      public function minImage() : void
      {
         var _ratio:Number = NaN;
         var _newWidth:Number = NaN;
         var _newXPos:Number = NaN;
         var _newYPos:Number = NaN;
         if(this._bm.height > 120)
         {
            this.currentSize = "min";
            _ratio = 120 / this._bm.height;
            _newWidth = this._bm.width * _ratio;
            _newXPos = (170 - _newWidth) / 2;
            _newYPos = (165 - 120) / 2 - 3;
            this._bm.height = 120;
            this._bm.width = _newWidth;
            this._bm.x = _newXPos;
            this._bm.y = _newYPos;
            try
            {
               if(!this.hasEventListener(Event.REMOVED_FROM_STAGE))
               {
                  this.addEventListener(Event.REMOVED_FROM_STAGE,this.resetBitmapSize);
               }
            }
            catch(e:Error)
            {
               if(removedFromStage == null)
               {
                  removedFromStage = new RemoveFromStage(this);
                  removedFromStage.addEventListener("RemoveFromStage",resetBitmapSize);
               }
            }
         }
      }
      
      public function maxImage() : void
      {
         if(this.currentSize == "min")
         {
            this.currentSize = "max";
            this._bm.height = this.bmHeight;
            this._bm.width = this.bmWidth;
            this._bm.x = this.xPos;
            this._bm.y = this.yPos;
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _bm() : Bitmap
      {
         return this._94442_bm;
      }
      
      private function set _bm(param1:Bitmap) : void
      {
         var _loc2_:Object = this._94442_bm;
         if(_loc2_ !== param1)
         {
            this._94442_bm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get xPos() : int
      {
         return this._3655356xPos;
      }
      
      private function set xPos(param1:int) : void
      {
         var _loc2_:Object = this._3655356xPos;
         if(_loc2_ !== param1)
         {
            this._3655356xPos = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xPos",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get yPos() : int
      {
         return this._3685147yPos;
      }
      
      private function set yPos(param1:int) : void
      {
         var _loc2_:Object = this._3685147yPos;
         if(_loc2_ !== param1)
         {
            this._3685147yPos = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yPos",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get bmWidth() : int
      {
         return this._14800837bmWidth;
      }
      
      private function set bmWidth(param1:int) : void
      {
         var _loc2_:Object = this._14800837bmWidth;
         if(_loc2_ !== param1)
         {
            this._14800837bmWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bmWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get bmHeight() : int
      {
         return this._891820718bmHeight;
      }
      
      private function set bmHeight(param1:int) : void
      {
         var _loc2_:Object = this._891820718bmHeight;
         if(_loc2_ !== param1)
         {
            this._891820718bmHeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bmHeight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      override public function set data(param1:Object) : void
      {
         var _loc2_:Object = this.data;
         if(_loc2_ !== param1)
         {
            this._3076010data = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"data",_loc2_,param1));
            }
         }
      }
   }
}
