package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class importer__embed_mxml_importer_ico_beta_swf_1075193431 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function importer__embed_mxml_importer_ico_beta_swf_1075193431()
      {
         this.dataClass = importer__embed_mxml_importer_ico_beta_swf_1075193431_dataClass;
         super();
         initialWidth = 1040 / 20;
         initialHeight = 560 / 20;
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
