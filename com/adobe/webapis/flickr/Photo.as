package com.adobe.webapis.flickr
{
   public class Photo
   {
       
      
      private var _license:int;
      
      private var _dateUploaded:Date;
      
      private var _canComment:int;
      
      private var _commentPermission:int;
      
      private var _ownerRealName:String;
      
      private var _addMetaPermission:int;
      
      private var _description:String;
      
      private var _dateTaken:Date;
      
      private var _originalFormat:String;
      
      private var _title:String;
      
      private var _ownerName:String;
      
      private var _server:int;
      
      private var _exifs:Array;
      
      private var _dateAdded:Date;
      
      private var _isFavorite:Boolean;
      
      private var _ownerLocation:String;
      
      private var _isFamily:Boolean;
      
      private var _isPublic:Boolean;
      
      private var _url:String;
      
      private var _iconServer:int;
      
      private var _id:String;
      
      private var _notes:Array;
      
      private var _urls:Array;
      
      private var _isFriend:Boolean;
      
      private var _secret:String;
      
      private var _commentCount:int;
      
      private var _rotation:int;
      
      private var _ownerId:String;
      
      private var _canAddMeta:int;
      
      private var _tags:Array;
      
      public function Photo()
      {
         super();
         _exifs = new Array();
         _notes = new Array();
         _tags = new Array();
         _urls = new Array();
      }
      
      public function set rotation(param1:int) : void
      {
         _rotation = param1;
      }
      
      public function set ownerLocation(param1:String) : void
      {
         _ownerLocation = param1;
      }
      
      public function get tags() : Array
      {
         return _tags;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get iconServer() : int
      {
         return _iconServer;
      }
      
      public function get originalFormat() : String
      {
         return _originalFormat;
      }
      
      public function get ownerRealName() : String
      {
         return _ownerRealName;
      }
      
      public function get ownerId() : String
      {
         return _ownerId;
      }
      
      public function set tags(param1:Array) : void
      {
         _tags = param1;
      }
      
      public function set commentPermission(param1:int) : void
      {
         _commentPermission = param1;
      }
      
      public function get isFamily() : Boolean
      {
         return _isFamily;
      }
      
      public function set iconServer(param1:int) : void
      {
         _iconServer = param1;
      }
      
      public function set ownerRealName(param1:String) : void
      {
         _ownerRealName = param1;
      }
      
      public function get isPublic() : Boolean
      {
         return _isPublic;
      }
      
      public function get server() : int
      {
         return _server;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function get dateUploaded() : Date
      {
         return _dateUploaded;
      }
      
      public function get license() : int
      {
         return _license;
      }
      
      public function set originalFormat(param1:String) : void
      {
         _originalFormat = param1;
      }
      
      public function get canAddMeta() : int
      {
         return _canAddMeta;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function set ownerId(param1:String) : void
      {
         _ownerId = param1;
      }
      
      public function get exifs() : Array
      {
         return _exifs;
      }
      
      public function set isPublic(param1:Boolean) : void
      {
         _isPublic = param1;
      }
      
      public function set secret(param1:String) : void
      {
         _secret = param1;
      }
      
      public function get isFriend() : Boolean
      {
         return _isFriend;
      }
      
      public function set addMetaPermission(param1:int) : void
      {
         _addMetaPermission = param1;
      }
      
      public function set isFamily(param1:Boolean) : void
      {
         _isFamily = param1;
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set dateTaken(param1:Date) : void
      {
         _dateTaken = param1;
      }
      
      public function set dateUploaded(param1:Date) : void
      {
         _dateUploaded = param1;
      }
      
      public function get rotation() : int
      {
         return _rotation;
      }
      
      public function set license(param1:int) : void
      {
         _license = param1;
      }
      
      public function get canComment() : int
      {
         return _canComment;
      }
      
      public function get ownerLocation() : String
      {
         return _ownerLocation;
      }
      
      public function set notes(param1:Array) : void
      {
         _notes = param1;
      }
      
      public function get commentPermission() : int
      {
         return _commentPermission;
      }
      
      public function set server(param1:int) : void
      {
         _server = param1;
      }
      
      public function set canAddMeta(param1:int) : void
      {
         _canAddMeta = param1;
      }
      
      public function get addMetaPermission() : int
      {
         return _addMetaPermission;
      }
      
      public function get secret() : String
      {
         return _secret;
      }
      
      public function get dateTaken() : Date
      {
         return _dateTaken;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
      }
      
      public function set exifs(param1:Array) : void
      {
         _exifs = param1;
      }
      
      public function set isFavorite(param1:Boolean) : void
      {
         _isFavorite = param1;
      }
      
      public function set isFriend(param1:Boolean) : void
      {
         _isFriend = param1;
      }
      
      public function set urls(param1:Array) : void
      {
         _urls = param1;
      }
      
      public function get notes() : Array
      {
         return _notes;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
      
      public function set commentCount(param1:int) : void
      {
         _commentCount = param1;
      }
      
      public function set dateAdded(param1:Date) : void
      {
         _dateAdded = param1;
      }
      
      public function get urls() : Array
      {
         return _urls;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get dateAdded() : Date
      {
         return _dateAdded;
      }
      
      public function set canComment(param1:int) : void
      {
         _canComment = param1;
      }
      
      public function get commentCount() : int
      {
         return _commentCount;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get isFavorite() : Boolean
      {
         return _isFavorite;
      }
      
      public function set description(param1:String) : void
      {
         _description = param1;
      }
   }
}
