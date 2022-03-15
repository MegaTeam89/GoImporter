package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Photos
   {
       
      
      private var _upload:Upload;
      
      private var _licenses:Licenses;
      
      private var _notes:Notes;
      
      private var _transform:Transform;
      
      private var _service:FlickrService;
      
      public function Photos(param1:FlickrService)
      {
         super();
         _service = param1;
         _licenses = new Licenses(param1);
         _notes = new Notes(param1);
         _transform = new Transform(param1);
         _upload = new Upload(param1);
      }
      
      private function getExif_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_EXIF);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photo",MethodGroupHelper.parsePhotoExifs);
      }
      
      public function getExif(param1:String, param2:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,getExif_result,"flickr.photos.getExif",false,new NameValuePair("photo_id",param1),new NameValuePair("secret",param2));
      }
      
      public function get upload() : Upload
      {
         return _upload;
      }
      
      private function removeTag_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_REMOVE_TAG);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function setMeta(param1:String, param2:String, param3:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,setMeta_result,"flickr.photos.setMeta",false,new NameValuePair("photo_id",param1),new NameValuePair("title",param2),new NameValuePair("description",param3));
      }
      
      private function search_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SEARCH);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
      
      private function getInfo_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_INFO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photo",MethodGroupHelper.parsePhoto);
      }
      
      private function setDates_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_DATES);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function setTags(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,setTags_result,"flickr.photos.setTags",false,new NameValuePair("photo_id",param1),new NameValuePair("tags",param2));
      }
      
      private function getUntagged_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_UNTAGGED);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
      
      private function addTags_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_ADD_TAGS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function getContext_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_CONTEXT);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"context",MethodGroupHelper.parseContext);
      }
      
      public function getInfo(param1:String, param2:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,getInfo_result,"flickr.photos.getInfo",false,new NameValuePair("photo_id",param1),new NameValuePair("secret",param2));
      }
      
      public function search(param1:String = "", param2:String = "", param3:String = "any", param4:String = "", param5:Date = null, param6:Date = null, param7:Date = null, param8:Date = null, param9:Number = -1, param10:String = "", param11:Number = 100, param12:Number = 1, param13:String = "date-posted-desc") : void
      {
         MethodGroupHelper.invokeMethod(_service,search_result,"flickr.photos.search",false,new NameValuePair("user_id",param1),new NameValuePair("tags",param2),new NameValuePair("tag_mode",param3),new NameValuePair("text",param4),new NameValuePair("min_upload_date",param5 == null ? "" : param5.valueOf().toString()),new NameValuePair("max_upload_date",param6 == null ? "" : param6.valueOf().toString()),new NameValuePair("min_taken_date",param7 == null ? "" : param7.valueOf().toString()),new NameValuePair("max_taken_date",param8 == null ? "" : param8.valueOf().toString()),new NameValuePair("license",param9 == -1 ? "" : param9.toString()),new NameValuePair("extras",param10),new NameValuePair("per_page",param11.toString()),new NameValuePair("page",param12.toString()),new NameValuePair("sort",param13));
      }
      
      private function getContactsPublicPhotos_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_CONTACTS_PUBLIC_PHOTOS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePhotoList);
      }
      
      public function getContactsPhotos(param1:Number = 10, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         MethodGroupHelper.invokeMethod(_service,getContactsPhotos_result,"flickr.photos.getContactsPhotos",false,new NameValuePair("count",param1.toString()),new NameValuePair("just_friends",!!param2 ? "1" : "0"),new NameValuePair("single_photo",!!param3 ? "1" : "0"),new NameValuePair("include_self",!!param4 ? "1" : "0"));
      }
      
      private function getAllContexts_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_ALL_CONTEXTS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photoContext",MethodGroupHelper.parsePhotoContext);
      }
      
      public function getAllContexts(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getAllContexts_result,"flickr.photos.getAllContexts",false,new NameValuePair("photo_id",param1));
      }
      
      public function getContactsPublicPhotos(param1:String, param2:Number = 10, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
      {
         MethodGroupHelper.invokeMethod(_service,getContactsPublicPhotos_result,"flickr.photos.getContactsPublicPhotos",false,new NameValuePair("user_id",param1),new NameValuePair("count",param2.toString()),new NameValuePair("just_friends",!!param3 ? "1" : "0"),new NameValuePair("single_photo",!!param4 ? "1" : "0"),new NameValuePair("include_self",!!param5 ? "1" : "0"));
      }
      
      public function getCounts(param1:Array = null, param2:Array = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:uint = 0;
         var _loc6_:int = 0;
         var _loc7_:uint = 0;
         _loc3_ = "";
         _loc4_ = "";
         _loc5_ = param1 == null ? uint(0) : uint(param1.length);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc6_ > 0)
            {
               _loc3_ += ",";
            }
            _loc3_ += param1[_loc6_].getTime() / 1000;
            _loc6_++;
         }
         _loc7_ = param2 == null ? uint(0) : uint(param2.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            if(_loc6_ > 0)
            {
               _loc4_ += ",";
            }
            _loc4_ += (param2[_loc6_] as Date).valueOf().toString();
            _loc6_++;
         }
         MethodGroupHelper.invokeMethod(_service,getCounts_result,"flickr.photos.getCounts",false,new NameValuePair("dates",_loc3_),new NameValuePair("taken_dates",_loc4_));
      }
      
      public function getUntagged(param1:String = "", param2:Number = 100, param3:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,getUntagged_result,"flickr.photos.getUntagged",false,new NameValuePair("extras",param1),new NameValuePair("per_page",param2.toString()),new NameValuePair("page",param3.toString()));
      }
      
      public function get notes() : Notes
      {
         return _notes;
      }
      
      public function setDates(param1:String, param2:Date = null, param3:Date = null, param4:Number = 0) : void
      {
         MethodGroupHelper.invokeMethod(_service,setDates_result,"flickr.photos.setDates",false,new NameValuePair("photo_id",param1),new NameValuePair("date_posted",MethodGroupHelper.dateToString(param2)),new NameValuePair("date_taken",MethodGroupHelper.dateToString(param3)),new NameValuePair("date_taken_granularity",param4.toString()));
      }
      
      public function setPerms(param1:String, param2:Boolean, param3:Boolean, param4:Boolean, param5:int, param6:int) : void
      {
         MethodGroupHelper.invokeMethod(_service,setPerms_result,"flickr.photos.setPerms",false,new NameValuePair("photo_id",param1),new NameValuePair("is_public",!!param2 ? "1" : "0"),new NameValuePair("is_friend",!!param3 ? "1" : "0"),new NameValuePair("is_family",!!param4 ? "1" : "0"),new NameValuePair("perm_comment",param5.toString()),new NameValuePair("perm_addmeta",param6.toString()));
      }
      
      private function getCounts_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_COUNTS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photoCounts",MethodGroupHelper.parsePhotoCountList);
      }
      
      private function getRecent_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_RECENT);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
      
      public function getPerms(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getPerms_result,"flickr.photos.getPerms",false,new NameValuePair("photo_id",param1));
      }
      
      private function getPerms_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_PERMS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photo",MethodGroupHelper.parsePhotoPerms);
      }
      
      private function setTags_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_TAGS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function getRecent(param1:String = "", param2:Number = 100, param3:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,getRecent_result,"flickr.photos.getRecent",false,new NameValuePair("extras",param1),new NameValuePair("per_page",param2.toString()),new NameValuePair("page",param3.toString()));
      }
      
      public function get licenses() : Licenses
      {
         return _licenses;
      }
      
      private function getContactsPhotos_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_CONTACTS_PHOTOS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePhotoList);
      }
      
      private function setPerms_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_PERMS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function getNotInSet_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_NOT_IN_SET);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
      
      public function getNotInSet(param1:String = "", param2:Number = 100, param3:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,getNotInSet_result,"flickr.photos.getNotInSet",false,new NameValuePair("extras",param1),new NameValuePair("per_page",param2.toString()),new NameValuePair("page",param3.toString()));
      }
      
      public function addTags(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,addTags_result,"flickr.photos.addTags",false,new NameValuePair("photo_id",param1),new NameValuePair("tags",param2));
      }
      
      public function getSizes(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getSizes_result,"flickr.photos.getSizes",false,new NameValuePair("photo_id",param1));
      }
      
      private function setMeta_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_META);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function getSizes_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_SIZES);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photoSizes",MethodGroupHelper.parsePhotoSizeList);
      }
      
      public function get transform() : Transform
      {
         return _transform;
      }
      
      public function removeTag(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,removeTag_result,"flickr.photos.removeTag",false,new NameValuePair("tag_id",param1));
      }
      
      public function getContext(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getContext_result,"flickr.photos.getContext",false,new NameValuePair("photo_id",param1));
      }
   }
}
