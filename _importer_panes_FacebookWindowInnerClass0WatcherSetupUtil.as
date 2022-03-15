package
{
   import importer.panes.FacebookWindowInnerClass0;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importer_panes_FacebookWindowInnerClass0WatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importer_panes_FacebookWindowInnerClass0WatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FacebookWindowInnerClass0.watcherSetupUtil = new _importer_panes_FacebookWindowInnerClass0WatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("data",{"dataChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("name",{"propertyChange":true},[param4[0]],null);
         param5[2] = new PropertyWatcher("url",{"propertyChange":true},[param4[1]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[2]);
      }
   }
}
