package anifire.components.studio
{
   import com.pbking.facebook.data.photos.FacebookAlbum;
   import mx.collections.ArrayCollection;
   
   public class AlbumList extends ArrayCollection
   {
       
      
      public function AlbumList()
      {
         super();
      }
      
      public function addAlbumList(param1:String, param2:Array = null, param3:AlbumPhotoAC = null, param4:FacebookAlbum = null) : void
      {
         var _loc5_:AlbumObj = new AlbumObj(param1,param2,param3,param4);
         this.addItem(_loc5_);
      }
   }
}
