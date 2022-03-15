package com.adobe.webapis.flickr
{
   public class NameValuePair
   {
       
      
      private var _name:String;
      
      private var _value:String;
      
      public function NameValuePair(param1:String = "", param2:String = "")
      {
         super();
         _name = param1;
         _value = param2;
      }
      
      public function set value(param1:String) : void
      {
         _value = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get value() : String
      {
         return _value;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
   }
}
