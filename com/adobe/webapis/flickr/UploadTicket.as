package com.adobe.webapis.flickr
{
   public class UploadTicket
   {
       
      
      private var _isComplete:Boolean;
      
      private var _id:String;
      
      private var _photoId:String;
      
      private var _isInvalid:Boolean;
      
      private var _uploadFailed:Boolean;
      
      public function UploadTicket()
      {
         super();
      }
      
      public function set isInvalid(param1:Boolean) : void
      {
         _isInvalid = param1;
      }
      
      public function get isInvalid() : Boolean
      {
         return _isInvalid;
      }
      
      public function set isComplete(param1:Boolean) : void
      {
         _isComplete = param1;
      }
      
      public function get isComplete() : Boolean
      {
         return _isComplete;
      }
      
      public function set uploadFailed(param1:Boolean) : void
      {
         _uploadFailed = param1;
      }
      
      public function get photoId() : String
      {
         return _photoId;
      }
      
      public function set photoId(param1:String) : void
      {
         _photoId = param1;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get uploadFailed() : Boolean
      {
         return _uploadFailed;
      }
   }
}
