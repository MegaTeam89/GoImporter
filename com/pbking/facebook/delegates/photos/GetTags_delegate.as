package com.pbking.facebook.delegates.photos
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.delegates.FacebookDelegate;
   
   public class GetTags_delegate extends FacebookDelegate
   {
       
      
      public function GetTags_delegate(param1:Facebook, param2:Array)
      {
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:* = null;
         var _loc6_:Array = null;
         var _loc7_:* = null;
         super(param1);
         _loc3_ = [];
         for each(_loc4_ in param2)
         {
            _loc6_ = [];
            for(_loc7_ in _loc4_)
            {
               if(_loc4_[_loc7_] != null)
               {
                  _loc6_.push("\"" + _loc7_ + "\"" + ":" + "\"" + _loc4_[_loc7_] + "\"");
               }
            }
            _loc3_.push("{" + _loc6_.join(",") + "}");
         }
         _loc5_ = "[" + _loc3_.join(",") + "]";
      }
   }
}
