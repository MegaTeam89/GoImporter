package com.pbking.facebook.methodGroups
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.data.photos.FacebookAlbum;
   import com.pbking.facebook.delegates.photos.GetAlbums_delegate;
   import com.pbking.facebook.delegates.photos.GetPhotos_delegate;
   import com.pbking.facebook.delegates.photos.GetTags_delegate;
   import flash.events.Event;
   
   public class Photos
   {
       
      
      private var facebook:Facebook;
      
      public function Photos(param1:Facebook)
      {
         super();
         this.facebook = param1;
      }
      
      public function upload(param1:FacebookAlbum, param2:String, param3:*, param4:Function = null) : void
      {
      }
      
      public function getAlbums(param1:String, param2:Function = null, param3:Boolean = false) : GetAlbums_delegate
      {
         var _loc4_:GetAlbums_delegate = null;
         _loc4_ = new GetAlbums_delegate(facebook,param1,param3);
         if(param2 != null)
         {
            _loc4_.addEventListener(Event.COMPLETE,param2);
         }
         return _loc4_;
      }
      
      public function getTags(param1:Array, param2:Function = null) : void
      {
      }
      
      public function createAlbum(param1:String, param2:String, param3:String, param4:Function = null) : void
      {
      }
      
      public function getPhotos(param1:Object, param2:Object, param3:Array, param4:Function = null) : GetPhotos_delegate
      {
         var _loc5_:GetPhotos_delegate = null;
         _loc5_ = new GetPhotos_delegate(facebook,param1,param2,param3);
         if(param4 != null)
         {
            _loc5_.addEventListener(Event.COMPLETE,param4);
         }
         return _loc5_;
      }
      
      public function addTag(param1:int, param2:int, param3:String, param4:Number, param5:Number, param6:Function = null) : GetTags_delegate
      {
         return addTags([{
            "pid":int,
            "tag_uid":param2,
            "tag_text":param3,
            "x":param4,
            "y":param5
         }],param6);
      }
      
      public function addTags(param1:Array, param2:Function = null) : GetTags_delegate
      {
         var _loc3_:GetTags_delegate = null;
         _loc3_ = new GetTags_delegate(facebook,param1);
         if(param2 != null)
         {
            _loc3_.addEventListener(Event.COMPLETE,param2);
         }
         return _loc3_;
      }
      
      public function getPhotosForAlbum(param1:FacebookAlbum, param2:Function = null) : GetPhotos_delegate
      {
         return getPhotos(null,param1.aid,null,param2);
      }
   }
}
