package com.pbking.facebook.delegates
{
   import com.pbking.facebook.Facebook;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class FacebookDelegate extends EventDispatcher
   {
       
      
      protected var fBook:Facebook;
      
      public function FacebookDelegate(param1:Facebook)
      {
         super();
         this.fBook = param1;
      }
      
      protected function onError() : void
      {
         dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
      }
      
      protected function onComplete() : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      protected function result(param1:Event) : void
      {
      }
   }
}
