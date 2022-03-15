package com.pbking.facebook.delegates.photos
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.FacebookCall;
   import com.pbking.facebook.data.photos.FacebookAlbum;
   import com.pbking.facebook.data.photos.FacebookPhoto;
   import com.pbking.facebook.delegates.FacebookDelegate;
   import flash.events.Event;
   import mx.logging.Log;
   
   public class GetAlbums_delegate extends FacebookDelegate
   {
       
      
      private var doGetCovers:Boolean;
      
      private var doGetImages:Boolean;
      
      public var albums:Array;
      
      public function GetAlbums_delegate(param1:Facebook, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         var _loc5_:FacebookCall = null;
         super(param1);
         Log.getLogger("pbking.facebook").debug("getting all albums for user: " + param2);
         this.doGetCovers = param3;
         this.doGetImages = param4;
         (_loc5_ = new FacebookCall(param1)).addEventListener(Event.COMPLETE,result);
         _loc5_.setRequestArgument("uid",param2);
         _loc5_.post("facebook.photos.getAlbums");
      }
      
      private function getCovers() : void
      {
         var _loc1_:Array = null;
         var _loc2_:FacebookAlbum = null;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         _loc1_ = new Array();
         for each(_loc2_ in albums)
         {
            _loc1_.push(_loc2_.cover_pid);
         }
         fBook.photos.getPhotos(undefined,undefined,_loc1_,onGotCovers);
      }
      
      private function onAlbumPopulationComplete(param1:Event) : void
      {
         var _loc2_:FacebookAlbum = null;
         var _loc3_:FacebookAlbum = null;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         _loc2_ = param1.target as FacebookAlbum;
         _loc2_.removeEventListener("populationComplete",onAlbumPopulationComplete);
         for each(_loc3_ in albums)
         {
            if(!_loc3_.populated)
            {
               return;
            }
         }
         this.onComplete();
      }
      
      private function getImages() : void
      {
         var _loc1_:FacebookAlbum = null;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         for each(_loc1_ in albums)
         {
            if(!_loc1_.populated)
            {
               _loc1_.addEventListener("populationComplete",onAlbumPopulationComplete);
            }
         }
      }
      
      private function onGotCovers(param1:Event) : void
      {
         var _loc2_:Array = null;
         var _loc3_:FacebookPhoto = null;
         var _loc4_:FacebookAlbum = null;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         _loc2_ = param1.target.photos;
         for each(_loc3_ in _loc2_)
         {
            for each(_loc4_ in albums)
            {
               if(_loc4_.cover_pid == _loc3_.pid)
               {
                  _loc4_.cover = _loc3_;
                  break;
               }
            }
         }
         if(doGetImages)
         {
            this.getImages();
         }
         else
         {
            this.onComplete();
         }
      }
      
      override protected function result(param1:Event) : void
      {
         var _loc2_:FacebookCall = null;
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         var _loc5_:FacebookAlbum = null;
         _loc2_ = param1.target as FacebookCall;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         albums = [];
         _loc3_ = _loc2_.getResponse()..album;
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = new FacebookAlbum(_loc4_);
            albums.push(_loc5_);
         }
         if(doGetCovers)
         {
            this.getCovers();
         }
         else if(doGetImages)
         {
            this.getImages();
         }
         else
         {
            this.onComplete();
         }
      }
   }
}
