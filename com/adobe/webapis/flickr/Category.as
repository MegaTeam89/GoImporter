package com.adobe.webapis.flickr
{
   public class Category
   {
       
      
      private var _groups:Array;
      
      private var _path:String;
      
      private var _id:String;
      
      private var _count:int;
      
      private var _pathIds:String;
      
      private var _name:String;
      
      private var _subCategories:Array;
      
      public function Category()
      {
         super();
         _subCategories = new Array();
         _groups = new Array();
      }
      
      public function set count(param1:int) : void
      {
         _count = param1;
      }
      
      public function set path(param1:String) : void
      {
         _path = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get pathIds() : String
      {
         return _pathIds;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get count() : int
      {
         return _count;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get groups() : Array
      {
         return _groups;
      }
      
      public function get path() : String
      {
         return _path;
      }
      
      public function set pathIds(param1:String) : void
      {
         _pathIds = param1;
      }
      
      public function set groups(param1:Array) : void
      {
         _groups = param1;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function set subCategories(param1:Array) : void
      {
         _subCategories = param1;
      }
      
      public function get subCategories() : Array
      {
         return _subCategories;
      }
   }
}
