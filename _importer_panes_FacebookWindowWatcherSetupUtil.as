package
{
   import anifire.components.studio.FacebookerList;
   import importer.panes.FacebookWindow;
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importer_panes_FacebookWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importer_panes_FacebookWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FacebookWindow.watcherSetupUtil = new _importer_panes_FacebookWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[5] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[4]],null);
         watchers[6] = new FunctionReturnWatcher("getItemAt",target,function():Array
         {
            return [target.friend_cb.selectedIndex];
         },{"collectionChange":true},[bindings[4]],null);
         watchers[8] = new PropertyWatcher("albumList",{"propertyChange":true},[bindings[4]],null);
         watchers[11] = new PropertyWatcher("_maskVisible",{"propertyChange":true},[bindings[7]],propertyGetter);
         watchers[9] = new PropertyWatcher("albumPhotoAC",{"propertyChange":true},[bindings[5]],propertyGetter);
         watchers[1] = new PropertyWatcher("friend_cb",{"propertyChange":true},[bindings[1],bindings[4]],propertyGetter);
         watchers[7] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[bindings[4]],null);
         watchers[2] = new PropertyWatcher("selectedLabel",null,[bindings[1]],null);
         watchers[10] = new PropertyWatcher("album_lb_text",{"propertyChange":true},[bindings[6]],propertyGetter);
         watchers[5].updateParent(FacebookerList);
         watchers[6].parentWatcher = watchers[5];
         watchers[5].addChild(watchers[6]);
         watchers[6].addChild(watchers[8]);
         watchers[11].updateParent(target);
         watchers[9].updateParent(target);
         watchers[1].updateParent(target);
         watchers[1].addChild(watchers[7]);
         watchers[1].addChild(watchers[2]);
         watchers[10].updateParent(target);
      }
   }
}
