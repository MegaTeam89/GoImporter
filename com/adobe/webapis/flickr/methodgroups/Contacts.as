package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Contacts
   {
       
      
      private var _service:FlickrService;
      
      public function Contacts(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function getList() : void
      {
         MethodGroupHelper.invokeMethod(_service,getList_result,"flickr.contacts.getList",false);
      }
      
      private function getList_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.CONTACTS_GET_LIST);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"contacts",MethodGroupHelper.parseContactList);
      }
      
      public function getPublicList(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getPublicList_result,"flickr.contacts.getPublicList",false,new NameValuePair("user_id",param1));
      }
      
      private function getPublicList_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.CONTACTS_GET_PUBLIC_LIST);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"contacts",MethodGroupHelper.parseContactList);
      }
   }
}
