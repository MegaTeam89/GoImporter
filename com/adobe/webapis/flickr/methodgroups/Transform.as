package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Transform
   {
       
      
      private var _service:FlickrService;
      
      public function Transform(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      private function rotate_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_TRANSFORM_ROTATE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function rotate(param1:String, param2:Number) : void
      {
         MethodGroupHelper.invokeMethod(_service,rotate_result,"flickr.photos.transform.rotate",false,new NameValuePair("photo_id",param1),new NameValuePair("degrees",param2.toString()));
      }
   }
}
