package importer.panes
{
   import anifire.components.studio.PhotoRenderer;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.util.UtilDict;
   import com.adobe.images.JPGEncoder;
   import com.adobe.webapis.flickr.AuthPerm;
   import com.adobe.webapis.flickr.AuthResult;
   import com.adobe.webapis.flickr.FlickrError;
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.Photo;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.LocalConnection;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.TextInput;
   import mx.controls.TileList;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManager;
   import mx.utils.Base64Encoder;
   
   use namespace mx_internal;
   
   public class FlickrWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FlickrWindow_Label1:Label;
      
      private var _2113713204_btnLogin:Button;
      
      private var _909601371_btnSearch:Button;
      
      private var _1173469507_imageFlickr:Image;
      
      private var _2015714869_tileList:TileList;
      
      private var _327318201_txtSearch:TextInput;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _service:FlickrService;
      
      private var _bottom:importer;
      
      private var _searching:Boolean;
      
      private var counter:int = 0;
      
      private var photoList:Array;
      
      private var numOfPhotos:int = 0;
      
      private var pageNum:int = 1;
      
      private var _408156330loadingNum:int = -1;
      
      private var _408156699loadingObj:Object = null;
      
      private var _1446066171selectedThumb:Object = null;
      
      private var _289274392_searchKey:String = null;
      
      private var _1955504903_flickrPhotos:ArrayCollection;
      
      private var _826356610selectedRenderer:PhotoRenderer = null;
      
      private var _flickrLastAction:String = null;
      
      private var _uploading:Boolean = false;
      
      private var _localConnection:LocalConnection = null;
      
      private var _embed_mxml_______anifire_icon_flickr_logo_swf_2083359929:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FlickrWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{"creationComplete":"___FlickrWindow_Canvas1_creationComplete"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":TextInput,
                  "id":"_txtSearch",
                  "events":{"enter":"___txtSearch_enter"},
                  "stylesFactory":function():void
                  {
                     this.fontSize = 16;
                     this.themeColor = 8960767;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":178.5,
                        "y":115,
                        "width":285,
                        "styleName":"myTextInput"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"_btnLogin",
                  "events":{"click":"___btnLogin_click"},
                  "stylesFactory":function():void
                  {
                     this.fontSize = 16;
                     this.themeColor = 16742400;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBlack",
                        "width":103,
                        "buttonMode":true,
                        "x":573.5,
                        "y":115
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"_btnSearch",
                  "events":{"click":"___btnSearch_click"},
                  "stylesFactory":function():void
                  {
                     this.fontSize = 16;
                     this.themeColor = 16742400;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBlack",
                        "width":85,
                        "buttonMode":true,
                        "x":475.5,
                        "y":115
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"_imageFlickr",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "source":_embed_mxml_______anifire_icon_flickr_logo_swf_2083359929,
                        "x":260,
                        "y":42,
                        "autoLoad":true,
                        "scaleX":0.6,
                        "scaleY":0.6
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":TileList,
                  "id":"_tileList",
                  "events":{"itemClick":"___tileList_itemClick"},
                  "stylesFactory":function():void
                  {
                     this.cornerRadius = 4;
                     this.backgroundAlpha = 0;
                     this.themeColor = 8960767;
                     this.borderStyle = "none";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "horizontalScrollPolicy":"off",
                        "columnCount":4,
                        "columnWidth":170,
                        "rowHeight":180,
                        "itemRenderer":_FlickrWindow_ClassFactory1_c(),
                        "x":10,
                        "y":153,
                        "percentWidth":97,
                        "percentHeight":95
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"_FlickrWindow_Label1",
                  "stylesFactory":function():void
                  {
                     this.fontSize = 20;
                     this.fontWeight = "bold";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":33,
                        "y":51
                     };
                  }
               })]};
            }
         });
         this._embed_mxml_______anifire_icon_flickr_logo_swf_2083359929 = FlickrWindow__embed_mxml_______anifire_icon_flickr_logo_swf_2083359929;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FlickrWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_FlickrWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FlickrWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.addEventListener("creationComplete",this.___FlickrWindow_Canvas1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FlickrWindow._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function init(param1:Object) : void
      {
         if(param1 != null)
         {
            this._bottom = param1 as importer;
         }
         if(this._txtSearch != null)
         {
            this._txtSearch.text = "";
         }
      }
      
      private function initi() : void
      {
         this._tileList.addEventListener("loadNextSet",this.loadNextSetHandler);
         if(this._bottom.flickrToken == null)
         {
            this._btnLogin.label = UtilDict.toDisplay("import","import_login");
         }
         else
         {
            this._btnLogin.label = UtilDict.toDisplay("import","import_myphotos");
         }
      }
      
      public function setButtonStatus(param1:Boolean, param2:Boolean = true) : void
      {
         if(this._btnSearch != null)
         {
            this._btnSearch.enabled = param1;
         }
         if(this._btnLogin != null)
         {
            this._btnLogin.enabled = param1;
         }
         if(param1)
         {
            CursorManager.removeBusyCursor();
         }
         if(param2)
         {
            this._bottom.setButtonStatus(param1);
         }
      }
      
      public function set searchText(param1:String) : void
      {
         if(this._txtSearch != null)
         {
            this._txtSearch.text = param1;
         }
         else
         {
            this._searchKey = param1;
         }
      }
      
      private function loadNextSetHandler(param1:Event) : void
      {
         if(!this._searching)
         {
            ++this.pageNum;
            this.searchFlickrHandler(this.pageNum,this._searchKey,this._flickrLastAction == "myPhoto" ? true : false);
         }
      }
      
      private function getThumbByteArray(param1:Event) : void
      {
         var bm:Bitmap = null;
         var event:Event = param1;
         var loader:Loader = event.target.loader;
         var myImg:Image = loader.parent as Image;
         try
         {
            bm = Bitmap(loader.content);
         }
         catch(e:Error)
         {
            --counter;
            if(counter == 0)
            {
               _searching = false;
               setButtonStatus(true);
            }
            return;
         }
         if(this.counter == 1 && this.numOfPhotos != this._flickrPhotos.length + 1)
         {
            this._flickrPhotos.addItem({
               "bm":null,
               "name":null,
               "title":null,
               "photoID":null
            });
            this.loadingNum = this._flickrPhotos.length - 1;
            this.loadingObj = {
               "bm":bm,
               "name":myImg.name,
               "title":myImg.toolTip,
               "photoID":myImg.id
            };
         }
         else
         {
            this._flickrPhotos.addItem({
               "bm":bm,
               "name":myImg.name,
               "title":myImg.toolTip,
               "photoID":myImg.id
            });
            this.loadingNum = -1;
            this.loadingObj = null;
         }
         --this.counter;
         if(this.counter == 0)
         {
            this._searching = false;
            this.setButtonStatus(true);
         }
      }
      
      public function getFlickrPhotoHandler(param1:FlickrResultEvent) : void
      {
         var _loc3_:Photo = null;
         var _loc4_:* = null;
         var _loc5_:URLRequest = null;
         var _loc6_:LoaderContext = null;
         var _loc7_:Loader = null;
         var _loc8_:Object = null;
         var _loc9_:Image = null;
         this.numOfPhotos = param1.data.photos.total;
         if(this.loadingNum != -1 && this.loadingObj != null)
         {
            this._flickrPhotos.setItemAt(this.loadingObj,this.loadingNum);
         }
         this.photoList = param1.data.photos.photos;
         this.counter = this.photoList.length;
         if(this.counter == 0)
         {
            if(this.pageNum == 1)
            {
               this._bottom.show(UtilDict.toDisplay("import","import_alertnoresult"),UtilDict.toDisplay("import","import_alertnoresulttitle"));
            }
            this.setButtonStatus(true);
            this._searching = false;
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.photoList.length)
         {
            _loc3_ = this.photoList[_loc2_] as Photo;
            _loc4_ = "http://static.flickr.com/" + _loc3_.server + "/" + _loc3_.id + "_" + _loc3_.secret + ".jpg";
            (_loc5_ = new URLRequest()).url = _loc4_;
            (_loc6_ = new LoaderContext()).checkPolicyFile = true;
            (_loc7_ = new Loader()).contentLoaderInfo.addEventListener(Event.COMPLETE,this.getThumbByteArray);
            _loc7_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.error);
            _loc8_ = {
               "path":_loc4_,
               "title":_loc3_.title
            };
            (_loc9_ = new Image()).name = _loc4_;
            _loc9_.id = _loc3_.id;
            _loc9_.toolTip = _loc3_.title;
            _loc9_.addChild(_loc7_);
            _loc7_.load(_loc5_,_loc6_);
            _loc2_++;
         }
      }
      
      public function getFlickrTagsHandler(param1:FlickrResultEvent) : void
      {
         var _loc2_:String = "";
         var _loc3_:Array = param1.data.photo.tags;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc4_ == 0)
            {
               _loc2_ = _loc3_[_loc4_].tag;
            }
            else
            {
               _loc2_ += ", " + _loc3_[_loc4_].tag;
            }
            _loc4_++;
         }
         if(_loc2_ != "")
         {
            this._bottom.tags = _loc2_;
         }
         this.setButtonStatus(true);
      }
      
      private function getTokenHandler(param1:FlickrResultEvent) : void
      {
         if(param1.success)
         {
            this._btnLogin.label = UtilDict.toDisplay("import","import_myphotos");
            this._bottom.flickrToken = (param1.data.auth as AuthResult).token;
            this.service.token = (param1.data.auth as AuthResult).token;
            this.searchBtnHandler(1,"",true);
         }
         else
         {
            this._bottom.show("Token Error: " + (param1.data.error as FlickrError).errorMessage,null,true);
         }
      }
      
      private function photoClickHandler(param1:ListEvent) : void
      {
         if((param1.itemRenderer as PhotoRenderer).bm != null)
         {
            if(this.selectedRenderer != param1.itemRenderer as PhotoRenderer)
            {
               if(this.selectedRenderer != null)
               {
                  this.selectedRenderer.removeEventListener("upload",this.uploadEventHandler);
                  this.selectedRenderer.makeVisible(false);
                  this.selectedRenderer.maxImage();
               }
               this.selectedRenderer = param1.itemRenderer as PhotoRenderer;
               this.selectedRenderer.minImage();
               this.selectedRenderer.makeVisible(true);
               this.selectedRenderer.addEventListener("upload",this.uploadEventHandler);
               if(this.selectedRenderer.photoID != null)
               {
                  this._service.tags.getListPhoto(this.selectedRenderer.photoID);
               }
            }
            else
            {
               this.selectedRenderer.makeVisible(true);
            }
         }
      }
      
      private function uploadEventHandler(param1:Event) : void
      {
         this._bottom.title = this.selectedRenderer.myTitle;
         this._bottom.showPopUp(this.upload,"uploadi");
      }
      
      public function upload() : void
      {
         var bd:BitmapData = null;
         var jpgEncoder:JPGEncoder = null;
         var jpgBytes:ByteArray = null;
         var encoded:Base64Encoder = null;
         var request:URLRequest = null;
         var variables:URLVariables = null;
         var stream:URLLoader = null;
         if(!this._uploading)
         {
            this.setButtonStatus(false);
            bd = this.selectedRenderer.bm.bitmapData;
            jpgEncoder = new JPGEncoder();
            jpgBytes = jpgEncoder.encode(bd);
            encoded = new Base64Encoder();
            encoded.encodeBytes(jpgBytes);
            variables = new URLVariables();
            this._bottom.addFlashVarsToURLvar(variables);
            if(this._bottom.type == AnimeConstants.ASSET_TYPE_BG)
            {
               request = new URLRequest(ServerConstants.ACTION_SAVE_BG_BYTE);
            }
            else
            {
               request = new URLRequest(ServerConstants.ACTION_SAVE_PROP_BYTE);
               variables["placeable"] = "1";
               variables["headable"] = "0";
               variables["holdable"] = "0";
               if(this._bottom.type == AnimeConstants.ASSET_TYPE_PROP_HEAD)
               {
                  variables["headable"] = "1";
               }
               else if(this._bottom.type == AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR)
               {
                  variables["holdable"] = "1";
               }
            }
            variables["title"] = this._bottom.title;
            variables["type"] = this._bottom.type;
            variables["subtype"] = this._bottom.subtype;
            variables["keywords"] = this._bottom.tags;
            variables["imageData"] = encoded.flush();
            variables["is_published"] = !!this._bottom.isPublished ? "1" : "0";
            request.data = variables;
            request.method = URLRequestMethod.POST;
            stream = new URLLoader();
            stream.addEventListener(Event.COMPLETE,this._bottom.onUploadCustomAssetComplete);
            stream.addEventListener(Event.COMPLETE,function():void
            {
               setButtonStatus(true);
            });
            stream.addEventListener(IOErrorEvent.IO_ERROR,this.error);
            stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
            stream.load(request);
         }
      }
      
      private function error(param1:Event) : void
      {
         this._bottom.show("Error:  " + param1.type + "\nCannot proceede","Error",true);
         this.setButtonStatus(true);
      }
      
      public function searchBtnHandler(param1:int, param2:String, param3:Boolean = false) : void
      {
         if(param2 == this._searchKey && !param3)
         {
            CursorManager.removeBusyCursor();
            return;
         }
         this._flickrPhotos = new ArrayCollection();
         this.pageNum = 1;
         this.loadingNum = -1;
         this.searchFlickrHandler(param1,param2,param3);
      }
      
      private function searchFlickrHandler(param1:int, param2:String, param3:Boolean = false) : void
      {
         var _loc4_:Date = null;
         var _loc5_:String = null;
         if(!this._searching)
         {
            if(this._bottom.trim(param2).length > 0 || param3)
            {
               this.setButtonStatus(false,false);
               CursorManager.setBusyCursor();
               if(this._txtSearch != null)
               {
                  this._txtSearch.text = param2;
               }
               this._searchKey = param2;
               this._searching = true;
               this.selectedThumb = null;
               _loc4_ = null;
               _loc5_ = "";
               if(param3)
               {
                  _loc5_ = "me";
                  param2 = "";
                  this._flickrLastAction = "myPhoto";
               }
               else
               {
                  this._flickrLastAction = "publicPhoto";
               }
               this.service.photos.search(_loc5_,param2,"any","",_loc4_,_loc4_,_loc4_,_loc4_,0,"",9,param1,"date-posted-desc");
            }
            else
            {
               this._bottom.show(UtilDict.toDisplay("import","import_alertkeyword"),UtilDict.toDisplay("import","import_errtitle"));
               this._searching = false;
               this.setButtonStatus(true);
            }
         }
      }
      
      public function checkIfLogin() : void
      {
         if(this._bottom.flickrToken == null)
         {
            this.openFlickrLogin();
         }
         else
         {
            this.searchBtnHandler(1,this._txtSearch.text,true);
         }
      }
      
      private function openFlickrLogin() : void
      {
         var _loc1_:URLRequest = null;
         if(this._localConnection == null)
         {
            this._localConnection = new LocalConnection();
            this._localConnection.allowDomain("*");
            this._localConnection.allowInsecureDomain("*");
            this._localConnection.client = this;
         }
         try
         {
            if(!this._bottom.facebook)
            {
               this._localConnection.connect("_flickrConn");
            }
            else
            {
               this._localConnection.connect("flickrConn");
            }
         }
         catch(e:Error)
         {
         }
         if(this._bottom.facebook)
         {
            if(this._bottom.appParam("apiserver") != null && this._bottom.appParam("apiserver").indexOf("goanimate.net") != -1)
            {
               _loc1_ = new URLRequest("http://www.flickr.com/services/auth/?api_key=14e7a463279c082d4501d66ed1da2923&perms=read&api_sig=40f2ec940a2a18f92b91b6b5f4cee10a");
            }
            else
            {
               _loc1_ = new URLRequest("http://www.flickr.com/services/auth/?api_key=042a3b0beceaee21da52ede97f12295f&perms=read&api_sig=1bc13b67e248fe410738640ed68bc941");
            }
            navigateToURL(_loc1_,"_blank");
         }
         else
         {
            if(this._bottom.appParam("apiserver") != null && this._bottom.appParam("apiserver").indexOf("goanimate.net") != -1)
            {
               _loc1_ = new URLRequest("http://www.flickr.com/services/auth/?api_key=57bafcf15c9244b57c690a89180b5efb&perms=read&api_sig=8f83ce1b0e6762103bdb849c32f2d641");
            }
            else
            {
               _loc1_ = new URLRequest("http://www.flickr.com/services/auth/?api_key=6a5adeecb4bfdc46951e77cd45e6070c&perms=read&api_sig=74b9f182ab91a2c89c3cf5c492cc41ed");
            }
            navigateToURL(_loc1_,"_blank");
         }
      }
      
      public function getFrob(param1:String) : void
      {
      }
      
      public function getFlickToken(param1:String, param2:String) : void
      {
         this._btnLogin.label = UtilDict.toDisplay("import","import_myphotos");
         this._bottom.flickrToken = param1;
         this.service.token = param1;
         this.searchBtnHandler(1,"",true);
      }
      
      public function get service() : FlickrService
      {
         if(this._service == null)
         {
            if(this._bottom.facebook)
            {
               if(this._bottom.appParam("apiserver") != null && this._bottom.appParam("apiserver").indexOf("goanimate.net") != -1)
               {
                  this._service = new FlickrService("14e7a463279c082d4501d66ed1da2923");
                  this._service.secret = "074938d4620bf378";
               }
               else
               {
                  this._service = new FlickrService("042a3b0beceaee21da52ede97f12295f");
                  this._service.secret = "14f00eada10ea906";
               }
            }
            else if(this._bottom.appParam("apiserver") != null && this._bottom.appParam("apiserver").indexOf("goanimate.net") != -1)
            {
               this._service = new FlickrService("57bafcf15c9244b57c690a89180b5efb");
               this._service.secret = "3f294f0044766b21";
            }
            else
            {
               this._service = new FlickrService("6a5adeecb4bfdc46951e77cd45e6070c");
               this._service.secret = "88358abd07398f6c";
            }
            this._service.permission = AuthPerm.READ;
            Security.allowDomain(["api.flickr.com","flickr.com","static.flickr.com","farm1.static.flickr.com","farm2.static.flickr.com","farm3.static.flickr.com","*"]);
            Security.allowInsecureDomain(["api.flickr.com","flickr.com","static.flickr.com","farm1.static.flickr.com","farm2.static.flickr.com","farm3.static.flickr.com","*"]);
            Security.loadPolicyFile("http://api.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://static.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://farm7.static.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://farm6.static.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://farm5.static.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://farm4.static.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://farm3.static.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://farm2.static.flickr.com/crossdomain.xml");
            Security.loadPolicyFile("http://farm1.static.flickr.com/crossdomain.xml");
            this._service.addEventListener(FlickrResultEvent.PHOTOS_SEARCH,this.getFlickrPhotoHandler);
            this._service.addEventListener(FlickrResultEvent.TAGS_GET_LIST_PHOTO,this.getFlickrTagsHandler);
            this._service.addEventListener(FlickrResultEvent.AUTH_GET_TOKEN,this.getTokenHandler);
         }
         return this._service;
      }
      
      public function ___FlickrWindow_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.initi();
      }
      
      public function ___txtSearch_enter(param1:FlexEvent) : void
      {
         this.searchBtnHandler(1,this._txtSearch.text);
      }
      
      public function ___btnLogin_click(param1:MouseEvent) : void
      {
         this.checkIfLogin();
      }
      
      public function ___btnSearch_click(param1:MouseEvent) : void
      {
         this.searchBtnHandler(1,this._txtSearch.text);
      }
      
      private function _FlickrWindow_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PhotoRenderer;
         return _loc1_;
      }
      
      public function ___tileList_itemClick(param1:ListEvent) : void
      {
         this.photoClickHandler(param1);
      }
      
      private function _FlickrWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _searchKey;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtSearch.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_login");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnLogin.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_search");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSearch.label");
         result[3] = new Binding(this,function():Object
         {
            return _flickrPhotos;
         },null,"_tileList.dataProvider");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_browsepicon");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_FlickrWindow_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnLogin() : Button
      {
         return this._2113713204_btnLogin;
      }
      
      public function set _btnLogin(param1:Button) : void
      {
         var _loc2_:Object = this._2113713204_btnLogin;
         if(_loc2_ !== param1)
         {
            this._2113713204_btnLogin = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnLogin",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSearch() : Button
      {
         return this._909601371_btnSearch;
      }
      
      public function set _btnSearch(param1:Button) : void
      {
         var _loc2_:Object = this._909601371_btnSearch;
         if(_loc2_ !== param1)
         {
            this._909601371_btnSearch = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSearch",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _imageFlickr() : Image
      {
         return this._1173469507_imageFlickr;
      }
      
      public function set _imageFlickr(param1:Image) : void
      {
         var _loc2_:Object = this._1173469507_imageFlickr;
         if(_loc2_ !== param1)
         {
            this._1173469507_imageFlickr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_imageFlickr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _tileList() : TileList
      {
         return this._2015714869_tileList;
      }
      
      public function set _tileList(param1:TileList) : void
      {
         var _loc2_:Object = this._2015714869_tileList;
         if(_loc2_ !== param1)
         {
            this._2015714869_tileList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tileList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtSearch() : TextInput
      {
         return this._327318201_txtSearch;
      }
      
      public function set _txtSearch(param1:TextInput) : void
      {
         var _loc2_:Object = this._327318201_txtSearch;
         if(_loc2_ !== param1)
         {
            this._327318201_txtSearch = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtSearch",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get loadingNum() : int
      {
         return this._408156330loadingNum;
      }
      
      private function set loadingNum(param1:int) : void
      {
         var _loc2_:Object = this._408156330loadingNum;
         if(_loc2_ !== param1)
         {
            this._408156330loadingNum = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingNum",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get loadingObj() : Object
      {
         return this._408156699loadingObj;
      }
      
      private function set loadingObj(param1:Object) : void
      {
         var _loc2_:Object = this._408156699loadingObj;
         if(_loc2_ !== param1)
         {
            this._408156699loadingObj = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingObj",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get selectedThumb() : Object
      {
         return this._1446066171selectedThumb;
      }
      
      private function set selectedThumb(param1:Object) : void
      {
         var _loc2_:Object = this._1446066171selectedThumb;
         if(_loc2_ !== param1)
         {
            this._1446066171selectedThumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedThumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _searchKey() : String
      {
         return this._289274392_searchKey;
      }
      
      private function set _searchKey(param1:String) : void
      {
         var _loc2_:Object = this._289274392_searchKey;
         if(_loc2_ !== param1)
         {
            this._289274392_searchKey = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_searchKey",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _flickrPhotos() : ArrayCollection
      {
         return this._1955504903_flickrPhotos;
      }
      
      private function set _flickrPhotos(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1955504903_flickrPhotos;
         if(_loc2_ !== param1)
         {
            this._1955504903_flickrPhotos = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_flickrPhotos",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get selectedRenderer() : PhotoRenderer
      {
         return this._826356610selectedRenderer;
      }
      
      private function set selectedRenderer(param1:PhotoRenderer) : void
      {
         var _loc2_:Object = this._826356610selectedRenderer;
         if(_loc2_ !== param1)
         {
            this._826356610selectedRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedRenderer",_loc2_,param1));
            }
         }
      }
   }
}
