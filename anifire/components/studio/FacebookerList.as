package anifire.components.studio
{
   import mx.collections.ArrayCollection;
   
   public class FacebookerList extends ArrayCollection
   {
      
      private static var myFaceBookerList:FacebookerList = null;
       
      
      public function FacebookerList()
      {
         super();
      }
      
      public static function getInstance() : FacebookerList
      {
         if(myFaceBookerList == null)
         {
            myFaceBookerList = new FacebookerList();
         }
         return myFaceBookerList;
      }
      
      public function addFaceBooker(param1:String, param2:Number, param3:String, param4:AlbumList = null, param5:int = -1) : void
      {
         var _loc6_:FacebookObj = new FacebookObj(param1,param2,param3,param4);
         if(param5 >= 0)
         {
            myFaceBookerList.addItemAt(_loc6_,param5);
         }
         else
         {
            myFaceBookerList.addItem(_loc6_);
         }
      }
      
      public function setAlbumListByIndex(param1:int, param2:AlbumList) : void
      {
         (myFaceBookerList.getItemAt(param1) as FacebookObj).albumList = param2;
      }
   }
}
