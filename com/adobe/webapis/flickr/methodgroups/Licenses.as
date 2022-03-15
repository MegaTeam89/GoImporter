package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Licenses
   {
       
      
      private var _service:FlickrService;
      
      public function Licenses(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function getInfo() : void
      {
         MethodGroupHelper.invokeMethod(_service,getInfo_result,"flickr.photos.licenses.getInfo",false);
      }
      
      private function getInfo_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_LICENSES_GET_INFO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"licenses",MethodGroupHelper.parseLicenseList);
      }
      
      private function setLicense_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_LICENSES_GET_INFO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function setLicense(param1:String, param2:int) : void
      {
         MethodGroupHelper.invokeMethod(_service,setLicense_result,"flickr.photos.licenses.setLicense",false,new NameValuePair("photo_id",param1),new NameValuePair("license_id",param2.toString()));
      }
   }
}
