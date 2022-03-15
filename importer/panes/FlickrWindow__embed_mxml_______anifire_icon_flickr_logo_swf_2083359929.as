package importer.panes
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class FlickrWindow__embed_mxml_______anifire_icon_flickr_logo_swf_2083359929 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function FlickrWindow__embed_mxml_______anifire_icon_flickr_logo_swf_2083359929()
      {
         this.dataClass = FlickrWindow__embed_mxml_______anifire_icon_flickr_logo_swf_2083359929_dataClass;
         super();
         initialWidth = 3960 / 20;
         initialHeight = 1786 / 20;
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
