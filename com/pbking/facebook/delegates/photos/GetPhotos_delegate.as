package com.pbking.facebook.delegates.photos
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.FacebookCall;
   import com.pbking.facebook.data.photos.FacebookPhoto;
   import com.pbking.facebook.delegates.FacebookDelegate;
   import flash.events.Event;
   import mx.logging.Log;
   
   public class GetPhotos_delegate extends FacebookDelegate
   {
       
      
      public var photos:Array;
      
      public function GetPhotos_delegate(param1:Facebook, param2:Object, param3:Object, param4:Array)
      {
         var _loc5_:FacebookCall = null;
         super(param1);
         Log.getLogger("pbking.facebook").debug("getting photos based on query: subj_id: " + param2 + " aid: " + param3 + " pids: " + param4);
         if(param4)
         {
            while(param4.indexOf("0") != -1)
            {
               param4.splice(param4.indexOf("0"),1);
            }
         }
         (_loc5_ = new FacebookCall(param1)).addEventListener(Event.COMPLETE,result);
         if(param2)
         {
            _loc5_.setRequestArgument("subj_id",param2.toString());
         }
         if(param3)
         {
            _loc5_.setRequestArgument("aid",param3.toString());
         }
         if(param4)
         {
            _loc5_.setRequestArgument("pids",param4.toString());
         }
         _loc5_.post("facebook.photos.get");
      }
      
      override protected function result(param1:Event) : void
      {
         var _loc2_:FacebookCall = null;
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         _loc2_ = param1.target as FacebookCall;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         photos = [];
         _loc3_ = _loc2_.getResponse()..photo;
         for each(_loc4_ in _loc3_)
         {
            photos.push(new FacebookPhoto(_loc4_));
         }
         this.onComplete();
      }
   }
}
