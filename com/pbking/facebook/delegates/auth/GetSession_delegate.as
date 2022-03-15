package com.pbking.facebook.delegates.auth
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.FacebookCall;
   import com.pbking.facebook.delegates.FacebookDelegate;
   import flash.events.Event;
   import mx.logging.Log;
   
   public class GetSession_delegate extends FacebookDelegate
   {
       
      
      public var expires:Number;
      
      public var uid:int;
      
      private var auth_token:String;
      
      public var secret:String;
      
      public var session_key:String;
      
      public function GetSession_delegate(param1:Facebook, param2:String)
      {
         var _loc3_:FacebookCall = null;
         super(param1);
         this.auth_token = param2;
         Log.getLogger("pbking.facebook").debug("starting facebook session with auth_token: " + param2);
         _loc3_ = new FacebookCall(param1);
         _loc3_.setRequestArgument("auth_token",param2);
         _loc3_.addEventListener(Event.COMPLETE,result);
         _loc3_.post("facebook.auth.getSession",param1.default_rest_url,true);
      }
      
      override protected function result(param1:Event) : void
      {
         var _loc2_:FacebookCall = null;
         _loc2_ = param1.target as FacebookCall;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         session_key = _loc2_.getResponse()..session_key;
         uid = _loc2_.getResponse()..uid;
         secret = _loc2_.getResponse()..secret;
         expires = _loc2_.getResponse()..expires;
         onComplete();
      }
   }
}
