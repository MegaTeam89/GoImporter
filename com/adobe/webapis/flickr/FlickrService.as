package com.adobe.webapis.flickr
{
   import com.adobe.crypto.MD5;
   import com.adobe.webapis.URLLoaderBase;
   import com.adobe.webapis.flickr.methodgroups.Auth;
   import com.adobe.webapis.flickr.methodgroups.Blogs;
   import com.adobe.webapis.flickr.methodgroups.Contacts;
   import com.adobe.webapis.flickr.methodgroups.Favorites;
   import com.adobe.webapis.flickr.methodgroups.Groups;
   import com.adobe.webapis.flickr.methodgroups.Interestingness;
   import com.adobe.webapis.flickr.methodgroups.People;
   import com.adobe.webapis.flickr.methodgroups.PhotoSets;
   import com.adobe.webapis.flickr.methodgroups.Photos;
   import com.adobe.webapis.flickr.methodgroups.Pools;
   import com.adobe.webapis.flickr.methodgroups.Tags;
   import com.adobe.webapis.flickr.methodgroups.Test;
   import com.adobe.webapis.flickr.methodgroups.Urls;
   import flash.net.URLLoader;
   
   public class FlickrService extends URLLoaderBase
   {
      
      public static const END_POINT:String = "http://api.flickr.com/services/rest/?";
      
      public static const AUTH_END_POINT:String = "http://api.flickr.com/services/auth/?";
       
      
      private var _api_key:String;
      
      private var _photosets:PhotoSets;
      
      private var _interestingness:Interestingness;
      
      private var _blogs:Blogs;
      
      private var _auth:Auth;
      
      private var _photos:Photos;
      
      private var _people:People;
      
      private var _contacts:Contacts;
      
      private var _urls:Urls;
      
      private var _secret:String;
      
      private var _pools:Pools;
      
      private var _favorites:Favorites;
      
      private var _permission:String;
      
      private var _test:Test;
      
      private var _groups:Groups;
      
      private var _tags:Tags;
      
      private var _token:String;
      
      public function FlickrService(param1:String)
      {
         super();
         _api_key = param1;
         _permission = AuthPerm.NONE;
         _token = "";
         _auth = new Auth(this);
         _blogs = new Blogs(this);
         _contacts = new Contacts(this);
         _favorites = new Favorites(this);
         _groups = new Groups(this);
         _interestingness = new Interestingness(this);
         _people = new People(this);
         _photos = new Photos(this);
         _photosets = new PhotoSets(this);
         _pools = new Pools(this);
         _tags = new Tags(this);
         _test = new Test(this);
         _urls = new Urls(this);
      }
      
      public function get photosets() : PhotoSets
      {
         return _photosets;
      }
      
      public function set api_key(param1:String) : void
      {
         _api_key = param1;
      }
      
      public function get blogs() : Blogs
      {
         return _blogs;
      }
      
      public function get photos() : Photos
      {
         return _photos;
      }
      
      flickrservice_internal function get urlLoader() : URLLoader
      {
         return getURLLoader();
      }
      
      public function get test() : Test
      {
         return _test;
      }
      
      public function set permission(param1:String) : void
      {
         _permission = param1;
      }
      
      public function get auth() : Auth
      {
         return _auth;
      }
      
      public function get people() : People
      {
         return _people;
      }
      
      public function get api_key() : String
      {
         return _api_key;
      }
      
      public function get tags() : Tags
      {
         return _tags;
      }
      
      public function getLoginURL(param1:String, param2:String) : String
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         _loc3_ = secret;
         _loc3_ += "api_key" + api_key;
         _loc3_ += "frob" + param1;
         _loc3_ += "perms" + param2;
         return (_loc4_ = (_loc4_ = (_loc4_ = (_loc4_ = AUTH_END_POINT) + ("api_key=" + api_key)) + ("&frob=" + param1)) + ("&perms=" + param2)) + ("&api_sig=" + MD5.hash(_loc3_));
      }
      
      public function get secret() : String
      {
         return _secret;
      }
      
      public function get contacts() : Contacts
      {
         return _contacts;
      }
      
      public function get permission() : String
      {
         return _permission;
      }
      
      public function get favorites() : Favorites
      {
         return _favorites;
      }
      
      public function get groups() : Groups
      {
         return _groups;
      }
      
      public function get interestingness() : Interestingness
      {
         return _interestingness;
      }
      
      public function set secret(param1:String) : void
      {
         _secret = param1;
      }
      
      public function get urls() : Urls
      {
         return _urls;
      }
      
      public function get pools() : Pools
      {
         return _pools;
      }
      
      public function set token(param1:String) : void
      {
         _token = param1;
      }
      
      public function get token() : String
      {
         return _token;
      }
   }
}
