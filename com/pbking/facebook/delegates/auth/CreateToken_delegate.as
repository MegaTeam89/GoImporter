package com.pbking.facebook.delegates.auth
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.FacebookCall;
   import com.pbking.facebook.delegates.FacebookDelegate;
   import flash.events.Event;
   
   public class CreateToken_delegate extends FacebookDelegate
   {
       
      
      public var auth_token:String;
      
      public function CreateToken_delegate(param1:Facebook)
      {
         var _loc2_:FacebookCall = null;
         super(param1);
         _loc2_ = new FacebookCall(param1);
         _loc2_.addEventListener(Event.COMPLETE,result);
         _loc2_.post("facebook.auth.createToken",param1.default_rest_url,true);
      }
      
      override protected function result(param1:Event) : void
      {
         var _loc2_:FacebookCall = null;
         _loc2_ = param1.target as FacebookCall;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         auth_token = _loc2_.getResponse().toString();
         onComplete();
      }
   }
}
