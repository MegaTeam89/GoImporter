package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class importer__embed_mxml_importer_bg_1_swf_480829911 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function importer__embed_mxml_importer_bg_1_swf_480829911()
      {
         this.dataClass = importer__embed_mxml_importer_bg_1_swf_480829911_dataClass;
         super();
         initialWidth = 12000 / 20;
         initialHeight = 10000 / 20;
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
