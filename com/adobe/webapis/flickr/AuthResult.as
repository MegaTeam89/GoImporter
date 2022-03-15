package com.adobe.webapis.flickr
{
   public class AuthResult
   {
       
      
      private var _perms:String;
      
      private var _user:User;
      
      private var _token:String;
      
      public function AuthResult()
      {
         super();
         perms = AuthPerm.NONE;
      }
      
      public function get perms() : String
      {
         return _perms;
      }
      
      public function set perms(param1:String) : void
      {
         _perms = param1;
      }
      
      public function get user() : User
      {
         return _user;
      }
      
      public function set token(param1:String) : void
      {
         _token = param1;
      }
      
      public function set user(param1:User) : void
      {
         _user = param1;
      }
      
      public function get token() : String
      {
         return _token;
      }
   }
}
