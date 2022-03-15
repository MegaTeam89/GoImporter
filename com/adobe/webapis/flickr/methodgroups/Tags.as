package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Tags
   {
       
      
      private var _service:FlickrService;
      
      public function Tags(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      private function getListUserPopular_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_LIST_USER_POPULAR);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUserTags);
      }
      
      public function getListPhoto(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getListPhoto_result,"flickr.tags.getListPhoto",false,new NameValuePair("photo_id",param1));
      }
      
      private function getRelated_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_RELATED);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"tags",MethodGroupHelper.parseTagList);
      }
      
      public function getRelated(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getRelated_result,"flickr.tags.getRelated",false,new NameValuePair("tag",param1));
      }
      
      public function getListUserPopular(param1:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,getListUserPopular_result,"flickr.tags.getListUserPopular",false,new NameValuePair("user_id",param1));
      }
      
      private function getListUser_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_LIST_USER);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"user",MethodGroupHelper.parseUserTags);
      }
      
      private function getListPhoto_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_LIST_PHOTO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photo",MethodGroupHelper.parsePhoto);
      }
      
      public function getListUser(param1:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,getListUser_result,"flickr.tags.getListUser",false,new NameValuePair("user_id",param1));
      }
   }
}
