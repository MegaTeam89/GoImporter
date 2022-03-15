package com.adobe.webapis.flickr
{
   public class PhotoUrl
   {
       
      
      private var _url:String;
      
      private var _type:String;
      
      public function PhotoUrl()
      {
         super();
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
   }
}
