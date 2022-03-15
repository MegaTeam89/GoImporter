package com.adobe.webapis.flickr
{
   public class PhotoPool
   {
       
      
      private var _title:String;
      
      private var _id:String;
      
      public function PhotoPool()
      {
         super();
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
