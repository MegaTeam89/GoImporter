package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Urls
   {
       
      
      private var _service:FlickrService;
      
      public function Urls(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function getUserPhotos(param1:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,getUserPhotos_result,"flickr.urls.getUserPhotos",false,new NameValuePair("user_id",param1));
      }
      
      public function lookupGroup(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,lookupGroup_result,"flickr.urls.lookupGroup",false,new NameValuePair("url",param1));
      }
      
      public function getUserProfile(param1:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,getUserProfile_result,"flickr.urls.getUserProfile",false,new NameValuePair("user_id",param1));
      }
      
      public function getGroup(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getGroup_result,"flickr.urls.getGroup",false,new NameValuePair("group_id",param1));
      }
      
      private function getGroup_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.URLS_GET_GROUP);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"group",MethodGroupHelper.parseGroup);
      }
      
      private function getUserProfile_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.URLS_GET_USER_PROFILE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUser);
      }
      
      private function lookupGroup_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.URLS_LOOKUP_GROUP);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"group",MethodGroupHelper.parseGroup);
      }
      
      private function getUserPhotos_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.URLS_GET_USER_PHOTOS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUser);
      }
      
      public function lookupUser(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,lookupUser_result,"flickr.urls.lookupUser",false,new NameValuePair("url",param1));
      }
      
      private function lookupUser_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.URLS_LOOKUP_USER);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUser);
      }
   }
}
