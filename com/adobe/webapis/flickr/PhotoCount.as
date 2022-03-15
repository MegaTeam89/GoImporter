package com.adobe.webapis.flickr
{
   public class PhotoCount
   {
       
      
      private var _fromDate:Date;
      
      private var _toDate:Date;
      
      private var _count:int;
      
      public function PhotoCount()
      {
         super();
      }
      
      public function get toDate() : Date
      {
         return _toDate;
      }
      
      public function get count() : int
      {
         return _count;
      }
      
      public function set toDate(param1:Date) : void
      {
         _toDate = param1;
      }
      
      public function get fromDate() : Date
      {
         return _fromDate;
      }
      
      public function set count(param1:int) : void
      {
         _count = param1;
      }
      
      public function set fromDate(param1:Date) : void
      {
         _fromDate = param1;
      }
   }
}
