package importer.panes
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class PhoneWindow__embed_mxml____ico_phone_swf_722535565 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function PhoneWindow__embed_mxml____ico_phone_swf_722535565()
      {
         this.dataClass = PhoneWindow__embed_mxml____ico_phone_swf_722535565_dataClass;
         super();
         initialWidth = 1080 / 20;
         initialHeight = 1280 / 20;
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.dataClass());
         }
         return bytes;
      }
   }
}
