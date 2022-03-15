package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _importerWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _importerWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         importer.watcherSetupUtil = new _importerWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[64] = new PropertyWatcher("_sounds",{"propertyChange":true},[param4[69]],param2);
         param5[65] = new PropertyWatcher("item",{"propertyChange":true},[param4[69]],null);
         param5[16] = new PropertyWatcher("height",{"heightChanged":true},[param4[13],param4[26]],param2);
         param5[0] = new PropertyWatcher("_bg",{"propertyChange":true},[param4[0]],param2);
         param5[15] = new PropertyWatcher("width",{"widthChanged":true},[param4[12],param4[25]],param2);
         param5[9] = new PropertyWatcher("_vsMain",{"propertyChange":true},[param4[8]],param2);
         param5[10] = new PropertyWatcher("selectedChild",{
            "valueCommit":true,
            "creationComplete":true
         },[param4[8]],null);
         param5[62] = new PropertyWatcher("_flashs",{"propertyChange":true},[param4[68]],param2);
         param5[63] = new PropertyWatcher("item",{"propertyChange":true},[param4[68]],null);
         param5[13] = new PropertyWatcher("_hasConsole",{"propertyChange":true},[param4[10]],param2);
         param5[66] = new PropertyWatcher("_images",{"propertyChange":true},[param4[70]],param2);
         param5[67] = new PropertyWatcher("item",{"propertyChange":true},[param4[70]],null);
         param5[60] = new PropertyWatcher("_movies",{"propertyChange":true},[param4[67]],param2);
         param5[61] = new PropertyWatcher("item",{"propertyChange":true},[param4[67]],null);
         param5[1] = new PropertyWatcher("application",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[3] = new PropertyWatcher("height",null,[param4[2]],null);
         param5[2] = new PropertyWatcher("width",null,[param4[1]],null);
         param5[17] = new PropertyWatcher("_charArray",{"propertyChange":true},[param4[14]],param2);
         param5[11] = new PropertyWatcher("_homeUI",{"propertyChange":true},[param4[8]],param2);
         param5[64].updateParent(param1);
         param5[64].addChild(param5[65]);
         param5[16].updateParent(param1);
         param5[0].updateParent(param1);
         param5[15].updateParent(param1);
         param5[9].updateParent(param1);
         param5[9].addChild(param5[10]);
         param5[62].updateParent(param1);
         param5[62].addChild(param5[63]);
         param5[13].updateParent(param1);
         param5[66].updateParent(param1);
         param5[66].addChild(param5[67]);
         param5[60].updateParent(param1);
         param5[60].addChild(param5[61]);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[3]);
         param5[1].addChild(param5[2]);
         param5[17].updateParent(param1);
         param5[11].updateParent(param1);
      }
   }
}
