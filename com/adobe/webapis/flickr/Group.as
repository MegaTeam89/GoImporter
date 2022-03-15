package com.adobe.webapis.flickr
{
   public class Group
   {
       
      
      private var _isEighteenPlus:Boolean;
      
      private var _isAdmin:Boolean;
      
      private var _nsid:String;
      
      private var _photos:int;
      
      private var _url:String;
      
      private var _iconServer:int;
      
      private var _inChat:int;
      
      private var _description:String;
      
      private var _privacy:int;
      
      private var _members:int;
      
      private var _name:String;
      
      private var _online:int;
      
      private var _chatNsid:String;
      
      public function Group()
      {
         super();
      }
      
      public function get privacy() : int
      {
         return _privacy;
      }
      
      public function set photos(param1:int) : void
      {
         _photos = param1;
      }
      
      public function set isAdmin(param1:Boolean) : void
      {
         _isAdmin = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get photos() : int
      {
         return _photos;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set privacy(param1:int) : void
      {
         _privacy = param1;
      }
      
      public function get chatNsid() : String
      {
         return _chatNsid;
      }
      
      public function get members() : int
      {
         return _members;
      }
      
      public function get iconServer() : int
      {
         return _iconServer;
      }
      
      public function get inChat() : int
      {
         return _inChat;
      }
      
      public function set online(param1:int) : void
      {
         _online = param1;
      }
      
      public function get nsid() : String
      {
         return _nsid;
      }
      
      public function set chatNsid(param1:String) : void
      {
         _chatNsid = param1;
      }
      
      public function set members(param1:int) : void
      {
         _members = param1;
      }
      
      public function set iconServer(param1:int) : void
      {
         _iconServer = param1;
      }
      
      public function set inChat(param1:int) : void
      {
         _inChat = param1;
      }
      
      public function get isAdmin() : Boolean
      {
         return _isAdmin;
      }
      
      public function set isEighteenPlus(param1:Boolean) : void
      {
         _isEighteenPlus = param1;
      }
      
      public function set nsid(param1:String) : void
      {
         _nsid = param1;
      }
      
      public function get online() : int
      {
         return _online;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
      
      public function get isEighteenPlus() : Boolean
      {
         return _isEighteenPlus;
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set description(param1:String) : void
      {
         _description = param1;
      }
      
      public function get description() : String
      {
         return _description;
      }
   }
}
