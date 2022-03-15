package com.adobe.webapis.flickr
{
   public class PhotoSize
   {
       
      
      private var _height:int;
      
      private var _width:int;
      
      private var _url:String;
      
      private var _label:String;
      
      private var _source:String;
      
      public function PhotoSize()
      {
         super();
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function set width(param1:int) : void
      {
         _width = param1;
      }
      
      public function set height(param1:int) : void
      {
         _height = param1;
      }
      
      public function get source() : String
      {
         return _source;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function PhotoTag() : void
      {
      }
      
      public function set label(param1:String) : void
      {
         _label = param1;
      }
      
      public function set source(param1:String) : void
      {
         _source = param1;
      }
      
      public function get label() : String
      {
         return _label;
      }
      
      public function get url() : String
      {
         return _url;
      }
   }
}
