package com.adobe.webapis.events
{
   import flash.events.Event;
   
   public class ServiceEvent extends Event
   {
       
      
      private var _data:Object;
      
      public function ServiceEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         _data = new Object();
         super(param1,param2,param3);
      }
      
      public function get data() : Object
      {
         return _data;
      }
      
      public function set data(param1:Object) : void
      {
         _data = param1;
      }
   }
}
