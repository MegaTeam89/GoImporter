package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Blogs
   {
       
      
      private var _service:FlickrService;
      
      public function Blogs(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function postPhoto(param1:String, param2:String, param3:String, param4:String, param5:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,postPhoto_result,"flickr.blogs.postPhoto",false,new NameValuePair("blog_id",param1),new NameValuePair("photo_id",param2),new NameValuePair("title",param3),new NameValuePair("description",param4),new NameValuePair("blog_password",param5));
      }
      
      public function getList() : void
      {
         MethodGroupHelper.invokeMethod(_service,getList_result,"flickr.blogs.getList",false);
      }
      
      private function getList_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.BLOGS_GET_LIST);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"blogs",MethodGroupHelper.parseBlogList);
      }
      
      private function postPhoto_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.BLOGS_POST_PHOTO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
   }
}
