package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Groups
   {
       
      
      private var _service:FlickrService;
      
      private var _pools:Pools;
      
      public function Groups(param1:FlickrService)
      {
         super();
         _service = param1;
         _pools = new Pools(param1);
      }
      
      public function getInfo(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getInfo_result,"flickr.groups.getInfo",false,new NameValuePair("group_id",param1));
      }
      
      public function search(param1:String, param2:Number = 100, param3:Number = 1) : void
      {
         MethodGroupHelper.invokeMethod(_service,search_result,"flickr.groups.search",false,new NameValuePair("text",param1),new NameValuePair("per_page",param2.toString()),new NameValuePair("page",param3.toString()));
      }
      
      public function browse(param1:String = "0") : void
      {
         MethodGroupHelper.invokeMethod(_service,browse_result,"flickr.groups.browse",false,new NameValuePair("cat_id",param1));
      }
      
      private function browse_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_BROWSE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"category",MethodGroupHelper.parseGroupCategory);
      }
      
      private function search_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_SEARCH);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"groups",MethodGroupHelper.parsePagedGroupList);
      }
      
      public function get pools() : Pools
      {
         return _pools;
      }
      
      private function getInfo_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.GROUPS_GET_INFO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"group",MethodGroupHelper.parseGroup);
      }
   }
}
