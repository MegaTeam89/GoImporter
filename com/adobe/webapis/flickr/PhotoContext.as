package com.adobe.webapis.flickr
{
   public class PhotoContext
   {
       
      
      private var _sets:Array;
      
      private var _pools:Array;
      
      public function PhotoContext()
      {
         super();
         _sets = new Array();
         _pools = new Array();
      }
      
      public function set sets(param1:Array) : void
      {
         _sets = param1;
      }
      
      public function set pools(param1:Array) : void
      {
         _pools = param1;
      }
      
      public function get sets() : Array
      {
         return _sets;
      }
      
      public function get pools() : Array
      {
         return _pools;
      }
   }
}
