package importer.panes
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class SoundsWindow__embed_mxml____ico_soundsnap_swf_130014181 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function SoundsWindow__embed_mxml____ico_soundsnap_swf_130014181()
      {
         this.dataClass = SoundsWindow__embed_mxml____ico_soundsnap_swf_130014181_dataClass;
         super();
         initialWidth = 2000 / 20;
         initialHeight = 600 / 20;
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
