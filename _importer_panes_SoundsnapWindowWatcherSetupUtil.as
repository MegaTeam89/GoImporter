package
{
   import importer.panes.SoundsnapWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importer_panes_SoundsnapWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importer_panes_SoundsnapWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundsnapWindow.watcherSetupUtil = new _importer_panes_SoundsnapWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_searching",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[0].updateParent(param1);
      }
   }
}
