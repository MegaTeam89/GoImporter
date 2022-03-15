package
{
   import importer.panes.FlickrWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importer_panes_FlickrWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importer_panes_FlickrWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FlickrWindow.watcherSetupUtil = new _importer_panes_FlickrWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("_flickrPhotos",{"propertyChange":true},[param4[3]],param2);
         param5[0] = new PropertyWatcher("_searchKey",{"propertyChange":true},[param4[0]],param2);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
