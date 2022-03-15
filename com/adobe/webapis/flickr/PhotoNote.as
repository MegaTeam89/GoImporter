package com.adobe.webapis.flickr
{
   import flash.geom.Rectangle;
   
   public class PhotoNote
   {
       
      
      private var _authorId:String;
      
      private var _rectangle:Rectangle;
      
      private var _note:String;
      
      private var _authorName:String;
      
      private var _id:String;
      
      public function PhotoNote()
      {
         super();
      }
      
      public function set authorName(param1:String) : void
      {
         _authorName = param1;
      }
      
      public function get authorId() : String
      {
         return _authorId;
      }
      
      public function set note(param1:String) : void
      {
         _note = param1;
      }
      
      public function set authorId(param1:String) : void
      {
         _authorId = param1;
      }
      
      public function set rectangle(param1:Rectangle) : void
      {
         _rectangle = param1;
      }
      
      public function get note() : String
      {
         return _note;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get authorName() : String
      {
         return _authorName;
      }
      
      public function get rectangle() : Rectangle
      {
         return _rectangle;
      }
   }
}
