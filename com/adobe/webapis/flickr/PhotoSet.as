package com.adobe.webapis.flickr
{
   public class PhotoSet
   {
       
      
      private var _id:String;
      
      private var _secret:String;
      
      private var _title:String;
      
      private var _photoCount:int;
      
      private var _server:int;
      
      private var _photos:Array;
      
      private var _primaryPhotoId:String;
      
      private var _ownerId:String;
      
      private var _url:String;
      
      private var _description:String;
      
      public function PhotoSet()
      {
         super();
         _photos = new Array();
      }
      
      public function set secret(param1:String) : void
      {
         _secret = param1;
      }
      
      public function get server() : int
      {
         return _server;
      }
      
      public function set server(param1:int) : void
      {
         _server = param1;
      }
      
      public function get secret() : String
      {
         return _secret;
      }
      
      public function get primaryPhotoId() : String
      {
         return _primaryPhotoId;
      }
      
      public function get photoCount() : int
      {
         return _photoCount;
      }
      
      public function get photos() : Array
      {
         return _photos;
      }
      
      public function set photos(param1:Array) : void
      {
         _photos = param1;
      }
      
      public function set photoCount(param1:int) : void
      {
         _photoCount = param1;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function set primaryPhotoId(param1:String) : void
      {
         _primaryPhotoId = param1;
      }
      
      public function set ownerId(param1:String) : void
      {
         _ownerId = param1;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
      
      public function get ownerId() : String
      {
         return _ownerId;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set description(param1:String) : void
      {
         _description = param1;
      }
   }
}
