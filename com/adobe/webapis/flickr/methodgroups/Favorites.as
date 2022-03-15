package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Favorites
   {
       
      
      private var _service:FlickrService;
      
      public function Favorites(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function remove(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,remove_result,"flickr.favorites.remove",false,new NameValuePair("photo_id",param1));
      }
      
      private function getList_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.FAVORITES_GET_LIST);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
      
      public function add(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,add_result,"flickr.favorites.add",false,new NameValuePair("photo_id",param1));
      }
      
      public function getList(param1:String = "", param2:String = "", param3:Number = 100, param4:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,getList_result,"flickr.favorites.getList",false,new NameValuePair("user_id",param1),new NameValuePair("extras",param2),new NameValuePair("per_page",param3.toString()),new NameValuePair("page",param4.toString()));
      }
      
      private function remove_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.FAVORITES_REMOVE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function add_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.FAVORITES_ADD);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function getPublicList(param1:String, param2:String = "", param3:Number = 100, param4:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,getPublicList_result,"flickr.favorites.getPublicList",false,new NameValuePair("user_id",param1),new NameValuePair("extras",param2),new NameValuePair("per_page",param3.toString()),new NameValuePair("page",param4.toString()));
      }
      
      private function getPublicList_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.FAVORITES_GET_PUBLIC_LIST);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
   }
}
