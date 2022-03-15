package com.adobe.webapis.flickr
{
   public class PhotoExif
   {
       
      
      private var _tagspaceId:int;
      
      private var _clean:String;
      
      private var _tagspace:String;
      
      private var _tag:int;
      
      private var _raw:String;
      
      private var _label:String;
      
      public function PhotoExif()
      {
         super();
      }
      
      public function get clean() : String
      {
         return _clean;
      }
      
      public function set tagspaceId(param1:int) : void
      {
         _tagspaceId = param1;
      }
      
      public function set raw(param1:String) : void
      {
         _raw = param1;
      }
      
      public function set tagspace(param1:String) : void
      {
         _tagspace = param1;
      }
      
      public function set clean(param1:String) : void
      {
         _clean = param1;
      }
      
      public function get tag() : int
      {
         return _tag;
      }
      
      public function get tagspaceId() : int
      {
         return _tagspaceId;
      }
      
      public function set label(param1:String) : void
      {
         _label = param1;
      }
      
      public function get tagspace() : String
      {
         return _tagspace;
      }
      
      public function get raw() : String
      {
         return _raw;
      }
      
      public function set tag(param1:int) : void
      {
         _tag = param1;
      }
      
      public function get label() : String
      {
         return _label;
      }
   }
}
