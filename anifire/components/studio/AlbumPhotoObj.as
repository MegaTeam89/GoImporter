package anifire.components.studio
{
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class AlbumPhotoObj implements IEventDispatcher
   {
       
      
      private var _bm:Bitmap;
      
      private var _name:String;
      
      private var _title:String;
      
      private var _photoID:String;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function AlbumPhotoObj(param1:Bitmap, param2:String, param3:String, param4:String)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this._bm = param1;
         this._name = param2;
         this._title = param3;
         this._photoID = param4;
      }
      
      private function set _3373707name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      private function set _3147bm(param1:Bitmap) : void
      {
         this._bm = param1;
      }
      
      public function get bm() : Bitmap
      {
         return this._bm;
      }
      
      private function set _110371416title(param1:String) : void
      {
         this._title = param1;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      private function set _595295539photoID(param1:String) : void
      {
         this._photoID = param1;
      }
      
      public function get photoID() : String
      {
         return this._photoID;
      }
      
      [Bindable(event="propertyChange")]
      public function set title(param1:String) : void
      {
         var _loc2_:Object = this.title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set photoID(param1:String) : void
      {
         var _loc2_:Object = this.photoID;
         if(_loc2_ !== param1)
         {
            this._595295539photoID = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"photoID",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set bm(param1:Bitmap) : void
      {
         var _loc2_:Object = this.bm;
         if(_loc2_ !== param1)
         {
            this._3147bm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set name(param1:String) : void
      {
         var _loc2_:Object = this.name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
