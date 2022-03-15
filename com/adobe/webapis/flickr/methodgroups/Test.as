package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Test
   {
       
      
      private var _service:FlickrService;
      
      public function Test(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function echo(... rest) : void
      {
         MethodGroupHelper.invokeMethod(_service,echo_result,"flickr.test.echo",false,rest);
      }
      
      public function login() : void
      {
         MethodGroupHelper.invokeMethod(_service,login_result,"flickr.test.login",false);
      }
      
      private function login_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.TEST_LOGIN);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function echo_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.TEST_ECHO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
   }
}
