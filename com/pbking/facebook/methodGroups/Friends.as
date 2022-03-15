package com.pbking.facebook.methodGroups
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.data.users.FacebookUser;
   import com.pbking.facebook.delegates.friends.AreFriends_delegate;
   import com.pbking.facebook.delegates.friends.GetFriends_delegate;
   import flash.events.Event;
   
   public class Friends
   {
       
      
      private var facebook:Facebook;
      
      public function Friends(param1:Facebook)
      {
         super();
         this.facebook = param1;
      }
      
      public function areFriends2(param1:FacebookUser, param2:Array, param3:Function = null) : AreFriends_delegate
      {
         var _loc4_:Array = null;
         var _loc5_:* = undefined;
         _loc4_ = [];
         for each(_loc5_ in param2)
         {
            _loc4_.push(param1);
         }
         return areFriends(_loc4_,param2,param3);
      }
      
      public function areFriends(param1:Array, param2:Array, param3:Function = null) : AreFriends_delegate
      {
         var _loc4_:AreFriends_delegate = null;
         _loc4_ = new AreFriends_delegate(facebook,param1,param2);
         if(param3 != null)
         {
            _loc4_.addEventListener(Event.COMPLETE,param3);
         }
         return _loc4_;
      }
      
      public function getAppUsers(param1:Function = null) : GetFriends_delegate
      {
         var _loc2_:GetFriends_delegate = null;
         _loc2_ = new GetFriends_delegate(facebook);
         if(param1 != null)
         {
            _loc2_.addEventListener(Event.COMPLETE,param1);
         }
         return _loc2_;
      }
      
      public function getFriends(param1:Function = null) : GetFriends_delegate
      {
         var _loc2_:GetFriends_delegate = null;
         _loc2_ = new GetFriends_delegate(facebook);
         if(param1 != null)
         {
            _loc2_.addEventListener(Event.COMPLETE,param1);
         }
         return _loc2_;
      }
   }
}
