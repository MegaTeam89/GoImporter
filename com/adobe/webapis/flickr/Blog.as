package com.adobe.webapis.flickr
{
   public class Blog
   {
       
      
      private var _name:String;
      
      private var _url:String;
      
      private var _needsPassword:Boolean;
      
      private var _id:String;
      
      public function Blog()
      {
         super();
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function set needsPassword(param1:Boolean) : void
      {
         _needsPassword = param1;
      }
      
      public function get needsPassword() : Boolean
      {
         return _needsPassword;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get url() : String
      {
         return _url;
      }
   }
}
