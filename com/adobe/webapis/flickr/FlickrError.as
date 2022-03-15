package com.adobe.webapis.flickr
{
   public class FlickrError
   {
      
      public static const INVALID_SOAP_ENVELOPE:int = 114;
      
      public static const INSUFFICIENT_PERMISSIONS:int = 99;
      
      public static const SERVICE_CURRENTLY_UNAVAILABLE:int = 105;
      
      public static const FORMAT_NOT_FOUND:int = 111;
      
      public static const INVALID_XML_RPC_CALL:int = 115;
      
      public static const INVALID_SIGNATURE:int = 96;
      
      public static const INVALID_API_KEY:int = 100;
      
      public static const LOGIN_FAILED:int = 98;
      
      public static const METHOD_NOT_FOUND:int = 112;
      
      public static const MISSING_SIGNATURE:int = 97;
       
      
      private var _errorMessage:String;
      
      private var _errorCode:int;
      
      public function FlickrError()
      {
         super();
      }
      
      public function set errorCode(param1:int) : void
      {
         _errorCode = param1;
      }
      
      public function get errorCode() : int
      {
         return _errorCode;
      }
      
      public function set errorMessage(param1:String) : void
      {
         _errorMessage = param1;
      }
      
      public function get errorMessage() : String
      {
         return _errorMessage;
      }
   }
}
