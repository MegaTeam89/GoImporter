package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class Interestingness
   {
       
      
      private var _service:FlickrService;
      
      public function Interestingness(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      public function getList(param1:Date = null, param2:String = "", param3:Number = 100, param4:Number = 1) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         _loc5_ = "";
         if(param1 != null)
         {
            _loc6_ = (param1.getMonth() + 1).toString();
            if(param1.getMonth() <= 9)
            {
               _loc6_ = "0" + _loc6_;
            }
            _loc7_ = param1.getDate().toString();
            if(param1.getDate() <= 9)
            {
               _loc7_ = "0" + _loc7_;
            }
            _loc5_ = param1.getFullYear() + "-" + _loc6_ + "-" + _loc7_;
         }
         MethodGroupHelper.invokeMethod(_service,getList_result,"flickr.interestingness.getList",false,new NameValuePair("date",_loc5_),new NameValuePair("extras",param2),new NameValuePair("per_page",param3.toString()),new NameValuePair("page",param4.toString()));
      }
      
      private function getList_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.INTERESTINGNESS_GET_LIST);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photos",MethodGroupHelper.parsePagedPhotoList);
      }
   }
}
