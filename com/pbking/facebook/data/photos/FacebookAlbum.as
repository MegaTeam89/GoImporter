package com.pbking.facebook.data.photos
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.data.FacebookAsset;
   import com.pbking.facebook.delegates.photos.GetPhotos_delegate;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class FacebookAlbum extends FacebookAsset
   {
       
      
      private var _photos:ArrayCollection;
      
      private var _cover:FacebookPhoto;
      
      private var _populated:Boolean = false;
      
      private var _populating:Boolean = false;
      
      public function FacebookAlbum(param1:XML)
      {
         var _loc2_:Array = null;
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         _populated = false;
         _populating = false;
         super(param1);
         if(this.size == 0)
         {
            this._photos = new ArrayCollection();
            this._populated = true;
         }
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         if(param1.cover != undefined)
         {
            this._cover = new FacebookPhoto(param1.cover.photo[0]);
            delete param1.cover;
         }
         if(param1.photos != undefined)
         {
            _loc2_ = [];
            _loc3_ = param1.photos..photo;
            for each(_loc4_ in _loc3_)
            {
               _loc2_.push(new FacebookPhoto(_loc4_));
            }
            this._photos = new ArrayCollection(_loc2_);
            this._populated = true;
            delete param1.photos;
         }
      }
      
      private function set _615513399modified(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      private function set _94852023cover(param1:FacebookPhoto) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         if(param1.pid == this.cover_pid)
         {
            _cover = param1;
         }
      }
      
      public function get cover_pid() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("cover_pid");
      }
      
      private function set _1980072195cover_pid(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      public function get size() : Number
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLPropertyNum("size");
      }
      
      [Bindable(event="propertyChange")]
      public function set photos(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.photos;
         if(_loc2_ !== param1)
         {
            this._989034367photos = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"photos",_loc2_,param1));
         }
      }
      
      public function get name() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("name");
      }
      
      private function set _1901043637location(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      [Bindable(event="propertyChange")]
      public function set size(param1:Number) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.size;
         if(_loc2_ !== param1)
         {
            this._3530753size = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"size",_loc2_,param1));
         }
      }
      
      private function set _1028554472created(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      [Bindable(event="propertyChange")]
      public function set cover_pid(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.cover_pid;
         if(_loc2_ !== param1)
         {
            this._1980072195cover_pid = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cover_pid",_loc2_,param1));
         }
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
      
      public function get photos() : ArrayCollection
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return _photos;
      }
      
      private function set _3373707name(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      [Bindable(event="propertyChange")]
      public function set name(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
         }
      }
      
      private function set _3321850link(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      [Bindable(event="propertyChange")]
      public function set modified(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.modified;
         if(_loc2_ !== param1)
         {
            this._615513399modified = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"modified",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set populated(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.populated;
         if(_loc2_ !== param1)
         {
            this._619465542populated = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"populated",_loc2_,param1));
         }
      }
      
      public function get owner() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("owner");
      }
      
      public function get location() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("location");
      }
      
      private function set _619465542populated(param1:Boolean) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      public function get cover() : FacebookPhoto
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return _cover;
      }
      
      public function get aid() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return _xml.aid;
      }
      
      private function set _1724546052description(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      public function get populated() : Boolean
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return _populated;
      }
      
      public function get modified() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("modified");
      }
      
      private function set _96572aid(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      private function set _106164915owner(param1:String) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      [Bindable(event="propertyChange")]
      public function set created(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.created;
         if(_loc2_ !== param1)
         {
            this._1028554472created = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"created",_loc2_,param1));
         }
      }
      
      override public function serialize() : XML
      {
         var _loc1_:XML = null;
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:FacebookPhoto = null;
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         _loc1_ = _xml.copy();
         if(cover)
         {
            _loc2_ = <cover/>;
            _loc2_.appendChild(cover.serialize());
            _loc1_.appendChild(_loc2_);
         }
         if(populated)
         {
            _loc3_ = <photos/>;
            for each(_loc4_ in photos)
            {
               _loc3_.appendChild(_loc4_.serialize());
            }
            _loc1_.appendChild(_loc3_);
         }
         return _loc1_;
      }
      
      private function onPopulationComplete(param1:Event) : void
      {
         var _loc2_:GetPhotos_delegate = null;
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         _loc2_ = param1.target as GetPhotos_delegate;
         this._photos = new ArrayCollection(_loc2_.photos);
         _populating = false;
         _populated = true;
         dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"populated",false,true));
         dispatchEvent(new Event("populationComplete"));
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
      
      public function get created() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("created");
      }
      
      public function populate(param1:Facebook) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         if(!_populating && !_populated)
         {
            trace("populating: " + this.aid);
            _populating = true;
            param1.photos.getPhotos(undefined,this.aid,undefined,onPopulationComplete);
         }
         else if(_populated)
         {
            dispatchEvent(new Event("populationComplete"));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set cover(param1:FacebookPhoto) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.cover;
         if(_loc2_ !== param1)
         {
            this._94852023cover = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cover",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set location(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.location;
         if(_loc2_ !== param1)
         {
            this._1901043637location = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"location",_loc2_,param1));
         }
      }
      
      private function set _3530753size(param1:Number) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
      }
      
      [Bindable(event="propertyChange")]
      public function set description(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.description;
         if(_loc2_ !== param1)
         {
            this._1724546052description = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"description",_loc2_,param1));
         }
      }
      
      public function get link() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("link");
      }
      
      public function get description() : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return getXMLProperty("description");
      }
      
      private function set _989034367photos(param1:ArrayCollection) : void
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
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
