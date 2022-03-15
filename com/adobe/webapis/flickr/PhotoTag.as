package com.adobe.webapis.flickr
{
   public class PhotoTag
   {
       
      
      private var _authorId:String;
      
      private var _raw:String;
      
      private var _count:int;
      
      private var _id:String;
      
      private var _tag:String;
      
      public function PhotoTag()
      {
         super();
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function set tag(param1:String) : void
      {
         _tag = param1;
      }
      
      public function get authorId() : String
      {
         return _authorId;
      }
      
      public function get raw() : String
      {
         return _raw;
      }
      
      public function set authorId(param1:String) : void
      {
         _authorId = param1;
      }
      
      public function set count(param1:int) : void
      {
         _count = param1;
      }
      
      public function set raw(param1:String) : void
      {
         _raw = param1;
      }
      
      public function get tag() : String
      {
         return _tag;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function get count() : int
      {
         return _count;
      }
   }
}
