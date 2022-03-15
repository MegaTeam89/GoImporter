package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Pools
   {
       
      
      private var _service:FlickrService;
      
      public function Pools(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      private function getContext_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_GET_CONTEXT);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"context",MethodGroupHelper.parseContext);
      }
      
      public function remove(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,remove_result,"flickr.groups.pools.remove",false,new NameValuePair("photo_id",param1),new NameValuePair("group_id",param2));
      }
      
      private function getPhotos_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_GET_PHOTOS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
      
      public function add(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,add_result,"flickr.groups.pools.add",false,new NameValuePair("photo_id",param1),new NameValuePair("group_id",param2));
      }
      
      public function getGroups() : void
      {
         MethodGroupHelper.invokeMethod(_service,getGroups_result,"flickr.groups.pools.getGroups",false);
      }
      
      private function getGroups_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_GET_GROUPS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"groups",MethodGroupHelper.parseGroupList);
      }
      
      public function getPhotos(param1:String, param2:String = "", param3:String = "", param4:Number = 100, param5:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,getPhotos_result,"flickr.groups.pools.getPhotos",false,new NameValuePair("group_id",param1),new NameValuePair("tags",param2),new NameValuePair("extras",param3),new NameValuePair("per_page",param4.toString()),new NameValuePair("page",param5.toString()));
      }
      
      private function remove_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_REMOVE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function getContext(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getContext_result,"flickr.groups.pools.getContext",false,new NameValuePair("photo_id",param1),new NameValuePair("group_id",param2));
      }
      
      private function add_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_ADD);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
   }
}
