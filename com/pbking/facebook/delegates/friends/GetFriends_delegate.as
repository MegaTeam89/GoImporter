package com.pbking.facebook.delegates.friends
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.FacebookCall;
   import com.pbking.facebook.data.users.FacebookUser;
   import com.pbking.facebook.delegates.FacebookDelegate;
   import flash.events.Event;
   import mx.logging.Log;
   
   public class GetFriends_delegate extends FacebookDelegate
   {
       
      
      public var friends:Array;
      
      public function GetFriends_delegate(param1:Facebook)
      {
         var _loc2_:FacebookCall = null;
         super(param1);
         Log.getLogger("pbking.facebook").debug("getting friends");
         _loc2_ = new FacebookCall(param1);
         _loc2_.addEventListener(Event.COMPLETE,result);
         _loc2_.post("facebook.friends.get");
      }
      
      override protected function result(param1:Event) : void
      {
         var _loc2_:FacebookCall = null;
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         _loc2_ = param1.target as FacebookCall;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         friends = [];
         _loc3_ = _loc2_.getResponse()..uid;
         for each(_loc4_ in _loc3_)
         {
            friends.push(new FacebookUser(int(_loc4_)));
         }
         onComplete();
      }
   }
}
