package com.adobe.webapis.flickr
{
   public class PagedPhotoList
   {
       
      
      private var _photos:Array;
      
      private var _total:int;
      
      private var _pages:int;
      
      private var _perPage:int;
      
      private var _page:int;
      
      public function PagedPhotoList()
      {
         super();
         _photos = new Array();
      }
      
      public function set photos(param1:Array) : void
      {
         _photos = param1;
      }
      
      public function get pages() : int
      {
         return _pages;
      }
      
      public function set pages(param1:int) : void
      {
         _pages = param1;
      }
      
      public function get total() : int
      {
         return _total;
      }
      
      public function get photos() : Array
      {
         return _photos;
      }
      
      public function get page() : int
      {
         return _page;
      }
      
      public function set total(param1:int) : void
      {
         _total = param1;
      }
      
      public function get perPage() : int
      {
         return _perPage;
      }
      
      public function set page(param1:int) : void
      {
         _page = param1;
      }
      
      public function set perPage(param1:int) : void
      {
         _perPage = param1;
      }
   }
}
