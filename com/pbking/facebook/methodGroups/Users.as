package com.pbking.facebook.methodGroups
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.delegates.users.GetUserInfo_delegate;
   import flash.events.Event;
   
   public class Users
   {
       
      
      private var facebook:Facebook;
      
      public function Users(param1:Facebook)
      {
         super();
         this.facebook = param1;
      }
      
      public function getInfo(param1:Array, param2:Array, param3:Function = null) : GetUserInfo_delegate
      {
         var _loc4_:GetUserInfo_delegate = null;
         _loc4_ = new GetUserInfo_delegate(facebook,param1,param2);
         if(param3 != null)
         {
            _loc4_.addEventListener(Event.COMPLETE,param3);
         }
         return _loc4_;
      }
      
      public function getLoggedInUser() : void
      {
      }
      
      public function isAppAdded() : void
      {
      }
      
      public function setStatus() : void
      {
      }
      
      public function hasAppPermission() : void
      {
      }
   }
}
