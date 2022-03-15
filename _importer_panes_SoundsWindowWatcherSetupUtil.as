package
{
   import anifire.managers.FeatureManager;
   import importer.panes.SoundsWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importer_panes_SoundsWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importer_panes_SoundsWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundsWindow.watcherSetupUtil = new _importer_panes_SoundsWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new StaticPropertyWatcher("shouldSoundSnapBeShown",null,[param4[1],param4[2]],null);
         param5[2].updateParent(FeatureManager);
      }
   }
}
