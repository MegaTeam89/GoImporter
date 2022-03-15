package com.pbking.facebook.delegates.friends
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.FacebookCall;
   import com.pbking.facebook.data.users.FacebookUser;
   import com.pbking.facebook.delegates.FacebookDelegate;
   import com.pbking.util.collection.HashableArrayCollection;
   import flash.events.Event;
   import mx.logging.Log;
   
   public class AreFriends_delegate extends FacebookDelegate
   {
       
      
      public var list1:Array;
      
      public var resultList:Array;
      
      public var list2:Array;
      
      private var totalUserCollection:HashableArrayCollection;
      
      public function AreFriends_delegate(param1:Facebook, param2:Array, param3:Array)
      {
         var _loc4_:FacebookUser = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:FacebookCall = null;
         totalUserCollection = new HashableArrayCollection("uid",false);
         super(param1);
         Log.getLogger("pbking.facebook").debug("getting areFriends");
         _loc5_ = [];
         _loc6_ = [];
         for each(_loc4_ in param2)
         {
            _loc5_.push(_loc4_.uid);
            if(!totalUserCollection.contains(_loc4_))
            {
               totalUserCollection.addItem(_loc4_);
            }
         }
         for each(_loc4_ in param3)
         {
            _loc5_.push(_loc4_.uid);
            if(!totalUserCollection.contains(_loc4_))
            {
               totalUserCollection.addItem(_loc4_);
            }
         }
         (_loc7_ = new FacebookCall(param1)).addEventListener(Event.COMPLETE,result);
         _loc7_.setRequestArgument("uids1",_loc5_.join(","));
         _loc7_.setRequestArgument("uids2",_loc6_.join(","));
         _loc7_.post("facebook.friends.areFriends");
      }
      
      override protected function result(param1:Event) : void
      {
         var _loc2_:FacebookCall = null;
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         _loc2_ = param1.target as FacebookCall;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         list1 = [];
         list2 = [];
         resultList = [];
         _loc3_ = _loc2_.getResponse()..friend_info;
         for each(_loc4_ in _loc3_)
         {
            list1.push(totalUserCollection.getItemById(int(_loc4_.uid1)));
            list2.push(totalUserCollection.getItemById(int(_loc4_.uid2)));
            resultList.push(_loc4_.friends == 1);
         }
         onComplete();
      }
   }
}
