package com.pbking.facebook.data
{
   import flash.events.EventDispatcher;
   
   public class FacebookAsset extends EventDispatcher
   {
       
      
      protected var _xml:XML;
      
      public function FacebookAsset(param1:XML)
      {
         super();
         _xml = param1;
      }
      
      public function serialize() : XML
      {
         return new XML(_xml);
      }
      
      protected function getXMLProperty(param1:String) : String
      {
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         return _xml.descendants(param1);
      }
      
      protected function getXMLPropertyNum(param1:String) : Number
      {
         var _loc2_:String = null;
         default xml namespace = new Namespace("http://api.facebook.com/1.0/");
         _loc2_ = getXMLProperty(param1);
         return Number(_loc2_);
      }
   }
}
