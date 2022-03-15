package anifire.components.studio
{
   import flash.display.Bitmap;
   import mx.collections.ArrayCollection;
   
   public class AlbumPhotoAC extends ArrayCollection
   {
       
      
      public function AlbumPhotoAC()
      {
         super();
      }
      
      public function addAlbumPhotoAC(param1:Bitmap, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:AlbumPhotoObj = new AlbumPhotoObj(param1,param2,param3,param4);
         this.addItem(_loc5_);
      }
   }
}
