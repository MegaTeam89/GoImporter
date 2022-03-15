package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Auth
   {
       
      
      private var _service:FlickrService;
      
      public function Auth(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function getFrob() : void
      {
         MethodGroupHelper.invokeMethod(_service,getFrob_result,"flickr.auth.getFrob",true);
      }
      
      public function checkToken(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,checkToken_result,"flickr.auth.checkToken",false,new NameValuePair("auth_token",param1));
      }
      
      private function getToken_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.AUTH_GET_TOKEN);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"auth",MethodGroupHelper.parseAuthResult);
      }
      
      public function getToken(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getToken_result,"flickr.auth.getToken",true,new NameValuePair("frob",param1));
      }
      
      private function checkToken_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.AUTH_CHECK_TOKEN);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"auth",MethodGroupHelper.parseAuthResult);
      }
      
      private function getFrob_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.AUTH_GET_FROB);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"frob",MethodGroupHelper.parseFrob);
      }
   }
}
