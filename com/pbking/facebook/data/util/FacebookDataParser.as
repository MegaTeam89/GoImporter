package com.pbking.facebook.data.util
{
   public class FacebookDataParser
   {
       
      
      public function FacebookDataParser()
      {
         super();
      }
      
      public static function formatDate(param1:String) : Date
      {
         var _loc2_:Date = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         if(param1 == "" || param1 == null)
         {
            return null;
         }
         _loc2_ = new Date();
         _loc3_ = param1.split(" ");
         if(_loc3_.length == 2)
         {
            _loc4_ = _loc3_[0].split("-");
            _loc5_ = _loc3_[1].split(":");
            _loc2_.setFullYear(_loc4_[0]);
            _loc2_.setMonth(_loc4_[1] - 1);
            _loc2_.setDate(_loc4_[2]);
            _loc2_.setHours(_loc5_[0]);
            _loc2_.setMinutes(_loc5_[1]);
            _loc2_.setSeconds(_loc5_[2]);
         }
         else
         {
            _loc2_.setTime(parseInt(param1) * 1000);
         }
         return _loc2_;
      }
   }
}
