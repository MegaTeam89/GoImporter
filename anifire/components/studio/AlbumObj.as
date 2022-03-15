package anifire.components.studio
{
   import com.pbking.facebook.data.photos.FacebookAlbum;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class AlbumObj implements IEventDispatcher
   {
       
      
      private var _name:String;
      
      private var _albumPhotoAC:AlbumPhotoAC;
      
      private var _photoArr:Array;
      
      private var _photoIndex:Number = 0;
      
      private var _loadingNum:int = -1;
      
      private var _loadingObj:AlbumPhotoObj = null;
      
      private var _facebookAlbum:FacebookAlbum;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function AlbumObj(param1:String, param2:Array, param3:AlbumPhotoAC, param4:FacebookAlbum)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this._albumPhotoAC = param3;
         this._name = param1;
         this._photoArr = param2;
         this._facebookAlbum = param4;
      }
      
      private function set _408156330loadingNum(param1:int) : void
      {
         this._loadingNum = param1;
      }
      
      public function get loadingNum() : int
      {
         return this._loadingNum;
      }
      
      private function set _408156699loadingObj(param1:AlbumPhotoObj) : void
      {
         this._loadingObj = param1;
      }
      
      public function get loadingObj() : AlbumPhotoObj
      {
         return this._loadingObj;
      }
      
      private function set _528086592photoIndex(param1:Number) : void
      {
         this._photoIndex = param1;
      }
      
      public function get photoIndex() : Number
      {
         return this._photoIndex;
      }
      
      private function set _1274298673photoArr(param1:Array) : void
      {
         this._photoArr = param1;
      }
      
      public function get photoArr() : Array
      {
         return this._photoArr;
      }
      
      private function set _2093764709albumPhotoAC(param1:AlbumPhotoAC) : void
      {
         this._albumPhotoAC = param1;
      }
      
      public function get albumPhotoAC() : AlbumPhotoAC
      {
         return this._albumPhotoAC;
      }
      
      private function set _3373707name(param1:String) : void
      {
         this._name = this.name;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      private function set _1593098057facebookAlbum(param1:FacebookAlbum) : void
      {
         this._facebookAlbum = param1;
      }
      
      public function get facebookAlbum() : FacebookAlbum
      {
         return this._facebookAlbum;
      }
      
      [Bindable(event="propertyChange")]
      public function set loadingObj(param1:AlbumPhotoObj) : void
      {
         var _loc2_:Object = this.loadingObj;
         if(_loc2_ !== param1)
         {
            this._408156699loadingObj = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingObj",_loc2_,param1));
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
      public function set facebookAlbum(param1:FacebookAlbum) : void
      {
         var _loc2_:Object = this.facebookAlbum;
         if(_loc2_ !== param1)
         {
            this._1593098057facebookAlbum = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"facebookAlbum",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set loadingNum(param1:int) : void
      {
         var _loc2_:Object = this.loadingNum;
         if(_loc2_ !== param1)
         {
            this._408156330loadingNum = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingNum",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set albumPhotoAC(param1:AlbumPhotoAC) : void
      {
         var _loc2_:Object = this.albumPhotoAC;
         if(_loc2_ !== param1)
         {
            this._2093764709albumPhotoAC = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"albumPhotoAC",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set photoArr(param1:Array) : void
      {
         var _loc2_:Object = this.photoArr;
         if(_loc2_ !== param1)
         {
            this._1274298673photoArr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"photoArr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set photoIndex(param1:Number) : void
      {
         var _loc2_:Object = this.photoIndex;
         if(_loc2_ !== param1)
         {
            this._528086592photoIndex = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"photoIndex",_loc2_,param1));
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
