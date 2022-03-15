package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Upload
   {
      
      private static const UPLOAD_DEST:String = "http://www.flickr.com/services/upload/?";
       
      
      private var _service:FlickrService;
      
      public function Upload(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      private function checkTickets_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_UPLOAD_CHECK_TICKETS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"uploadTickets",MethodGroupHelper.parseUploadTicketList);
      }
      
      public function checkTickets(param1:Array) : void
      {
         MethodGroupHelper.invokeMethod(_service,checkTickets_result,"flickr.photos.upload.checkTickets",false,new NameValuePair("tickets",param1.join(",")));
      }
   }
}
