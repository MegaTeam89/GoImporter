package anifire.components.containers
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class SoundsnapCell__embed_mxml__________importer_btn_play_swf_1561460038 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function SoundsnapCell__embed_mxml__________importer_btn_play_swf_1561460038()
      {
         this.dataClass = SoundsnapCell__embed_mxml__________importer_btn_play_swf_1561460038_dataClass;
         super();
         initialWidth = 900 / 20;
         initialHeight = 900 / 20;
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
