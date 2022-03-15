package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class People
   {
       
      
      private var _service:FlickrService;
      
      public function People(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function getPublicPhotos(param1:String, param2:String = "", param3:Number = 100, param4:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,getPublicPhotos_result,"flickr.people.getPublicPhotos",false,new NameValuePair("user_id",param1),new NameValuePair("extras",param2),new NameValuePair("per_page",param3.toString()),new NameValuePair("page",param4.toString()));
      }
      
      private function getUploadStatus_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_UPLOAD_STATUS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUser);
      }
      
      public function getInfo(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getInfo_result,"flickr.people.getInfo",false,new NameValuePair("user_id",param1));
      }
      
      public function findByUsername(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,findByUsername_result,"flickr.people.findByUsername",false,new NameValuePair("username",param1));
      }
      
      private function getPublicGroups_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_PUBLIC_GROUPS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"groups",MethodGroupHelper.parseGroupList);
      }
      
      public function getUploadStatus() : void
      {
         MethodGroupHelper.invokeMethod(_service,getUploadStatus_result,"flickr.people.getUploadStatus",false);
      }
      
      public function findByEmail(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,findByEmail_result,"flickr.people.findByEmail",false,new NameValuePair("find_email",param1));
      }
      
      private function findByEmail_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PEOPLE_FIND_BY_EMAIL);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUser);
      }
      
      private function findByUsername_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PEOPLE_FIND_BY_USERNAME);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUser);
      }
      
      private function getInfo_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_INFO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parsePerson);
      }
      
      public function getPublicGroups(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getPublicGroups_result,"flickr.people.getPublicGroups",false,new NameValuePair("user_id",param1));
      }
      
      private function getPublicPhotos_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_PUBLIC_PHOTOS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
   }
}
