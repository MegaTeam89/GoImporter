package com.adobe.webapis.flickr
{
   public class User
   {
       
      
      private var _isAdmin:Boolean;
      
      private var _isFamily:Boolean;
      
      private var _location:String;
      
      private var _bandwidthUsed:Number;
      
      private var _nsid:String;
      
      private var _firstPhotoTakenDate:Date;
      
      private var _photoCount:int;
      
      private var _isPro:Boolean;
      
      private var _profileUrl:String;
      
      private var _mboxSha1Sum:String;
      
      private var _url:String;
      
      private var _username:String;
      
      private var _firstPhotoUploadDate:Date;
      
      private var _iconServer:int;
      
      private var _photoUrl:String;
      
      private var _isFriend:Boolean;
      
      private var _isIgnored:Boolean;
      
      private var _bandwidthMax:Number;
      
      private var _filesizeMax:Number;
      
      private var _tags:Array;
      
      private var _fullname:String;
      
      public function User()
      {
         super();
         _tags = new Array();
      }
      
      public function get mboxSha1Sum() : String
      {
         return _mboxSha1Sum;
      }
      
      public function set isAdmin(param1:Boolean) : void
      {
         _isAdmin = param1;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         _isIgnored = param1;
      }
      
      public function set profileUrl(param1:String) : void
      {
         _profileUrl = param1;
      }
      
      public function get bandwidthUsed() : Number
      {
         return _bandwidthUsed;
      }
      
      public function get tags() : Array
      {
         return _tags;
      }
      
      public function get fullname() : String
      {
         return _fullname;
      }
      
      public function get nsid() : String
      {
         return _nsid;
      }
      
      public function set firstPhotoUploadDate(param1:Date) : void
      {
         _firstPhotoUploadDate = param1;
      }
      
      public function get isPro() : Boolean
      {
         return _isPro;
      }
      
      public function set firstPhotoTakenDate(param1:Date) : void
      {
         _firstPhotoTakenDate = param1;
      }
      
      public function get filesizeMax() : Number
      {
         return _filesizeMax;
      }
      
      public function set username(param1:String) : void
      {
         _username = param1;
      }
      
      public function get isFamily() : Boolean
      {
         return _isFamily;
      }
      
      public function set tags(param1:Array) : void
      {
         _tags = param1;
      }
      
      public function set fullname(param1:String) : void
      {
         _fullname = param1;
      }
      
      public function set photoUrl(param1:String) : void
      {
         _photoUrl = param1;
      }
      
      public function set bandwidthUsed(param1:Number) : void
      {
         _bandwidthUsed = param1;
      }
      
      public function set iconServer(param1:int) : void
      {
         _iconServer = param1;
      }
      
      public function set nsid(param1:String) : void
      {
         _nsid = param1;
      }
      
      public function get location() : String
      {
         return _location;
      }
      
      public function get isAdmin() : Boolean
      {
         return _isAdmin;
      }
      
      public function set isPro(param1:Boolean) : void
      {
         _isPro = param1;
      }
      
      public function get profileUrl() : String
      {
         return _profileUrl;
      }
      
      public function set filesizeMax(param1:Number) : void
      {
         _filesizeMax = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return _isIgnored;
      }
      
      public function get firstPhotoUploadDate() : Date
      {
         return _firstPhotoUploadDate;
      }
      
      public function get firstPhotoTakenDate() : Date
      {
         return _firstPhotoTakenDate;
      }
      
      public function get iconServer() : int
      {
         return _iconServer;
      }
      
      public function get username() : String
      {
         return _username;
      }
      
      public function set isFriend(param1:Boolean) : void
      {
         _isFriend = param1;
      }
      
      public function set isFamily(param1:Boolean) : void
      {
         _isFamily = param1;
      }
      
      public function get photoUrl() : String
      {
         return _photoUrl;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
      
      public function set mboxSha1Sum(param1:String) : void
      {
         _mboxSha1Sum = param1;
      }
      
      public function set bandwidthMax(param1:Number) : void
      {
         _bandwidthMax = param1;
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set location(param1:String) : void
      {
         _location = param1;
      }
      
      public function get bandwidthMax() : Number
      {
         return _bandwidthMax;
      }
      
      public function get isFriend() : Boolean
      {
         return _isFriend;
      }
      
      public function set photoCount(param1:int) : void
      {
         _photoCount = param1;
      }
      
      public function get photoCount() : int
      {
         return _photoCount;
      }
   }
}
