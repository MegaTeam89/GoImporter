package com.pbking.facebook.data.photos
{
   import com.pbking.facebook.data.FacebookAsset;
   import mx.events.PropertyChangeEvent;
   
   public class FacebookPhoto extends FacebookAsset
   {
       
      
      public function FacebookPhoto(param1:XML)
      {
         super(param1);
      }
      
      public function get owner() : String
      {
         return getXMLProperty("owner");
      }
      
      [Bindable(event="propertyChange")]
      public function set link(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.link;
         if(_loc2_ !== param1)
         {
            this._3321850link = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"link",_loc2_,param1));
         }
      }
      
      public function get src_small() : String
      {
         return getXMLProperty("src_small");
      }
      
      private function set _110987pid(param1:String) : void
      {
      }
      
      private function set _1953179611src_big(param1:String) : void
      {
      }
      
      public function get pid() : String
      {
         return getXMLProperty("pid");
      }
      
      [Bindable(event="propertyChange")]
      public function set caption(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.caption;
         if(_loc2_ !== param1)
         {
            this._552573414caption = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"caption",_loc2_,param1));
         }
      }
      
      private function set _96572aid(param1:String) : void
      {
      }
      
      public function get link() : String
      {
         return getXMLProperty("link");
      }
      
      private function set _1028554472created(param1:Number) : void
      {
      }
      
      private function set _106164915owner(param1:String) : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function set pid(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.pid;
         if(_loc2_ !== param1)
         {
            this._110987pid = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pid",_loc2_,param1));
         }
      }
      
      private function set _3321850link(param1:String) : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function set created(param1:Number) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.created;
         if(_loc2_ !== param1)
         {
            this._1028554472created = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"created",_loc2_,param1));
         }
      }
      
      private function set _552573414caption(param1:String) : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function set src_big(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.src_big;
         if(_loc2_ !== param1)
         {
            this._1953179611src_big = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"src_big",_loc2_,param1));
         }
      }
      
      public function get src() : String
      {
         return getXMLProperty("src");
      }
      
      public function get src_big() : String
      {
         return getXMLProperty("src_big");
      }
      
      public function get caption() : String
      {
         return getXMLProperty("caption");
      }
      
      [Bindable(event="propertyChange")]
      public function set src_small(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.src_small;
         if(_loc2_ !== param1)
         {
            this._89081108src_small = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"src_small",_loc2_,param1));
         }
      }
      
      public function get created() : Number
      {
         return getXMLPropertyNum("created");
      }
      
      private function set _114148src(param1:String) : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function set owner(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.owner;
         if(_loc2_ !== param1)
         {
            this._106164915owner = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"owner",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set src(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.src;
         if(_loc2_ !== param1)
         {
            this._114148src = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"src",_loc2_,param1));
         }
      }
      
      private function set _89081108src_small(param1:String) : void
      {
      }
      
      public function get aid() : String
      {
         return getXMLProperty("aid");
      }
      
      [Bindable(event="propertyChange")]
      public function set aid(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.aid;
         if(_loc2_ !== param1)
         {
            this._96572aid = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"aid",_loc2_,param1));
         }
      }
   }
}
