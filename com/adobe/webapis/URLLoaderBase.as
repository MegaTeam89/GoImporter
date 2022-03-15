package com.adobe.webapis
{
   import com.adobe.net.DynamicURLLoader;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   
   public class URLLoaderBase extends ServiceBase
   {
       
      
      public function URLLoaderBase()
      {
         super();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         dispatchEvent(param1);
      }
      
      protected function getURLLoader() : DynamicURLLoader
      {
         var _loc1_:DynamicURLLoader = null;
         _loc1_ = new DynamicURLLoader();
         _loc1_.addEventListener("progress",onProgress);
         _loc1_.addEventListener("ioError",onIOError);
         _loc1_.addEventListener("securityError",onSecurityError);
         return _loc1_;
      }
   }
}
