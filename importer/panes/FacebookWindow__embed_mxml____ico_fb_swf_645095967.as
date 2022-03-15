package importer.panes
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class FacebookWindow__embed_mxml____ico_fb_swf_645095967 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function FacebookWindow__embed_mxml____ico_fb_swf_645095967()
      {
         this.dataClass = FacebookWindow__embed_mxml____ico_fb_swf_645095967_dataClass;
         super();
         initialWidth = 2000 / 20;
         initialHeight = 1000 / 20;
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
