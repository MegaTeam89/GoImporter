package anifire.components.studio
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class FacebookObj implements IEventDispatcher
   {
       
      
      private var _name:String;
      
      private var _uid:Number;
      
      private var _url:String;
      
      private var _albumList:AlbumList;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function FacebookObj(param1:String, param2:Number, param3:String, param4:AlbumList)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this._name = param1;
         this._uid = param2;
         this._url = param3;
         this._albumList = param4;
      }
      
      private function set _3373707name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      private function set _115792uid(param1:Number) : void
      {
         this._uid = param1;
      }
      
      public function get uid() : Number
      {
         return this._uid;
      }
      
      private function set _116079url(param1:String) : void
      {
         this._url = param1;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      private function set _249222061albumList(param1:AlbumList) : void
      {
         this._albumList = param1;
      }
      
      public function get albumList() : AlbumList
      {
         return this._albumList;
      }
      
      [Bindable(event="propertyChange")]
      public function set uid(param1:Number) : void
      {
         var _loc2_:Object = this.uid;
         if(_loc2_ !== param1)
         {
            this._115792uid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"uid",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function set albumList(param1:AlbumList) : void
      {
         var _loc2_:Object = this.albumList;
         if(_loc2_ !== param1)
         {
            this._249222061albumList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"albumList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set url(param1:String) : void
      {
         var _loc2_:Object = this.url;
         if(_loc2_ !== param1)
         {
            this._116079url = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"url",_loc2_,param1));
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
