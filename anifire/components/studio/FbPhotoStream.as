package anifire.components.studio
{
   import flash.net.URLStream;
   
   public class FbPhotoStream extends URLStream
   {
       
      
      private var _photoTag:String;
      
      private var _data:Object;
      
      public function FbPhotoStream(param1:String, param2:Object = null)
      {
         super();
         this._photoTag = param1;
         this._data = param2;
      }
      
      public function get photoTag() : String
      {
         return this._photoTag;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
   }
}
