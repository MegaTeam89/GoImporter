package importer.panes
{
   import anifire.components.studio.AlbumList;
   import anifire.components.studio.AlbumObj;
   import anifire.components.studio.AlbumPhotoAC;
   import anifire.components.studio.AlbumPhotoObj;
   import anifire.components.studio.FacebookObj;
   import anifire.components.studio.FacebookerList;
   import anifire.components.studio.FbPhotoStream;
   import anifire.components.studio.PhotoRenderer;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.util.UtilDict;
   import com.adobe.images.JPGEncoder;
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.data.photos.FacebookAlbum;
   import com.pbking.facebook.data.photos.FacebookPhoto;
   import com.pbking.facebook.data.users.FacebookUser;
   import com.pbking.facebook.data.users.UserFields;
   import com.pbking.facebook.delegates.friends.GetFriends_delegate;
   import com.pbking.facebook.delegates.photos.GetAlbums_delegate;
   import com.pbking.facebook.delegates.photos.GetPhotos_delegate;
   import com.pbking.facebook.delegates.users.GetUserInfo_delegate;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Matrix;
   import flash.net.LocalConnection;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.ComboBase;
   import mx.controls.ComboBox;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.Spacer;
   import mx.controls.TileList;
   import mx.core.ClassFactory;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.Base64Encoder;
   
   use namespace mx_internal;
   
   public class FacebookWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FacebookWindow_Label1:Label;
      
      public var _FacebookWindow_Label3:Label;
      
      public var _FacebookWindow_Label5:Label;
      
      private var _882268751_tileListFacebook:TileList;
      
      private var _1532078127album_cb:ComboBox;
      
      private var _1532078406album_lb:Label;
      
      private var _958110422facebook_vs:ViewStack;
      
      private var _1067169649fb_mask:VBox;
      
      private var _1165035104friend_cb:ComboBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var fbAuthToken:String;
      
      private var _fbPhotosSearching:Boolean = false;
      
      private var pageNum:int = 1;
      
      private var _96275567fBook:Facebook;
      
      private var numOfPhotos:int = 0;
      
      private var _826356610selectedRenderer:PhotoRenderer;
      
      private var _281792378album_lb_text:String;
      
      private var _2093764709albumPhotoAC:ArrayCollection;
      
      private var myPhotoArray:Array;
      
      private var photoIndex:int;
      
      private var _searching:Boolean = false;
      
      private var _uploading:Boolean = false;
      
      private var _1426488871_maskVisible:Boolean = false;
      
      private var _facebookPhotoCounter:int;
      
      private var config_api_key:String = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      
      private var config_secret:String = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      
      private var _bottom:importer;
      
      private var _408156330loadingNum:int = -1;
      
      private var _408156699loadingObj:Object = null;
      
      private var _fbLocalConnection:LocalConnection = null;
      
      private var _pageReady:Boolean = false;
      
      private var _requestStream:FbPhotoStream = null;
      
      private var _responseStream:FbPhotoStream = null;
      
      private var _embed_mxml____ico_fb_swf_645095967:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FacebookWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{"creationComplete":"___FacebookWindow_Canvas1_creationComplete"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Label,
                  "id":"_FacebookWindow_Label1",
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
               }),new UIComponentDescriptor({
                  "type":Image,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "source":_embed_mxml____ico_fb_swf_645095967,
                        "y":29,
                        "x":391,
                        "scaleX":1.3,
                        "scaleY":1.3
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.verticalGap = 0;
                     this.paddingTop = 0;
                     this.paddingBottom = 0;
                     this.paddingLeft = 0;
                     this.paddingRight = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":110,
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "stylesFactory":function():void
                           {
                              this.paddingLeft = 4;
                              this.paddingRight = 4;
                              this.verticalAlign = "middle";
                              this.horizontalAlign = "center";
                              this.horizontalGap = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "percentWidth":100,
                                 "height":35,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"text":"Facebooker: "};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"friend_cb",
                                    "events":{
                                       "dataChange":"__friend_cb_dataChange",
                                       "change":"__friend_cb_change"
                                    },
                                    "stylesFactory":function():void
                                    {
                                       this.fontSize = 14;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "buttonMode":true,
                                          "minWidth":160,
                                          "maxWidth":160,
                                          "dropdownWidth":280,
                                          "labelFunction":getName,
                                          "itemRenderer":_FacebookWindow_ClassFactory1_c()
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"width":20};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_FacebookWindow_Label3"
                                 }),new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"album_cb",
                                    "events":{"change":"__album_cb_change"},
                                    "stylesFactory":function():void
                                    {
                                       this.fontSize = 14;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "buttonMode":true,
                                          "minWidth":160,
                                          "maxWidth":160,
                                          "labelFunction":getList
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"width":15};
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":ViewStack,
                           "id":"facebook_vs",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "horizontalScrollPolicy":"off",
                                          "verticalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TileList,
                                             "id":"_tileListFacebook",
                                             "events":{"itemClick":"___tileListFacebook_itemClick"},
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
                                                   "itemRenderer":_FacebookWindow_ClassFactory2_c(),
                                                   "x":10,
                                                   "percentWidth":100,
                                                   "percentHeight":100
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "events":{"hide":"___FacebookWindow_VBox2_hide"},
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalAlign = "center";
                                       this.verticalAlign = "middle";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "id":"album_lb",
                                             "stylesFactory":function():void
                                             {
                                                this.textAlign = "center";
                                                this.fontSize = 18;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"percentWidth":100};
                                             }
                                          })]
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "id":"fb_mask",
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                     this.verticalAlign = "middle";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Label,
                           "id":"_FacebookWindow_Label5"
                        })]
                     };
                  }
               })]};
            }
         });
         this._embed_mxml____ico_fb_swf_645095967 = FacebookWindow__embed_mxml____ico_fb_swf_645095967;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FacebookWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_FacebookWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FacebookWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.percentWidth = 100;
         this.label = "Search Facebook";
         this.left = 10;
         this.percentHeight = 100;
         this.addEventListener("creationComplete",this.___FacebookWindow_Canvas1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FacebookWindow._watcherSetupUtil = param1;
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
            if(!this._bottom.facebook && this._bottom.fbAuthToken == null)
            {
               this._maskVisible = true;
            }
            else
            {
               this._maskVisible = false;
            }
         }
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
      }
      
      private function loadNextSetHandler(param1:Event) : void
      {
         var _loc2_:AlbumPhotoObj = null;
         var _loc3_:int = 0;
         if(this.loadingNum != -1 && this.loadingObj != null && this._facebookPhotoCounter == 0)
         {
            this.albumPhotoAC.setItemAt(this.loadingObj,this.loadingNum);
            _loc2_ = new AlbumPhotoObj(this.loadingObj.bm,this.loadingObj.name,this.loadingObj.title,this.loadingObj.photoID);
            (this.album_cb.selectedItem as AlbumObj).albumPhotoAC.setItemAt(_loc2_,this.loadingNum);
            this._facebookPhotoCounter = 9;
            this.photoIndex = (this.album_cb.selectedItem as AlbumObj).photoIndex;
            _loc3_ = 0;
            while(this.photoIndex < this.myPhotoArray.length && _loc3_ < 9)
            {
               this.urlPostRequest(this.myPhotoArray[this.photoIndex] as FacebookPhoto);
               ++this.photoIndex;
               _loc3_++;
               ++(this.album_cb.selectedItem as AlbumObj).photoIndex;
            }
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
      
      private function upload() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:JPGEncoder = null;
         var _loc3_:ByteArray = null;
         var _loc4_:Base64Encoder = null;
         var _loc5_:URLRequest = null;
         var _loc6_:URLVariables = null;
         var _loc7_:URLLoader = null;
         if(!this._uploading)
         {
            this.setButtonStatus(false);
            _loc1_ = this.selectedRenderer.bm.bitmapData;
            _loc2_ = new JPGEncoder();
            _loc3_ = _loc2_.encode(_loc1_);
            (_loc4_ = new Base64Encoder()).encodeBytes(_loc3_);
            _loc6_ = new URLVariables();
            this._bottom.addFlashVarsToURLvar(_loc6_);
            if(this._bottom.type == "bg")
            {
               _loc5_ = new URLRequest(ServerConstants.ACTION_SAVE_BG_BYTE);
            }
            else
            {
               _loc5_ = new URLRequest(ServerConstants.ACTION_SAVE_PROP_BYTE);
               _loc6_["placeable"] = "1";
               _loc6_["headable"] = "0";
               _loc6_["holdable"] = "0";
               if(this._bottom.type == AnimeConstants.ASSET_TYPE_PROP_HEAD)
               {
                  _loc6_["headable"] = "1";
               }
               else if(this._bottom.type == AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR)
               {
                  _loc6_["holdable"] = "1";
               }
            }
            _loc6_["title"] = this._bottom.title;
            _loc6_["keywords"] = this._bottom.tags;
            _loc6_["imageData"] = _loc4_.flush();
            _loc6_["type"] = this._bottom.type;
            _loc6_["is_published"] = !!this._bottom.isPublished ? "1" : "0";
            _loc5_.data = _loc6_;
            _loc5_.method = URLRequestMethod.POST;
            (_loc7_ = new URLLoader()).addEventListener(Event.COMPLETE,this._bottom.onUploadCustomAssetComplete);
            _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.error);
            _loc7_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
            _loc7_.load(_loc5_);
         }
      }
      
      private function error(param1:Event) : void
      {
         this._bottom.show(param1.type + " error, cannot procede.","Error",true);
         this.setButtonStatus(true);
      }
      
      private function loadProxyImageComplete(param1:Event) : void
      {
         var f:Function = null;
         var myAlbumPhotoObj:AlbumPhotoObj = null;
         var event:Event = param1;
         if(this.album_cb.selectedItem == null)
         {
            this.album_cb.addEventListener(Event.TAB_CHILDREN_CHANGE,f = function():void
            {
               loadProxyImageComplete(event);
               album_cb.removeEventListener(Event.TAB_CHILDREN_CHANGE,f);
            });
         }
         --this._facebookPhotoCounter;
         var loader:Loader = Loader(event.target.loader);
         var bd:BitmapData = new BitmapData((loader as DisplayObject).width,(loader as DisplayObject).height);
         var m:Matrix = new Matrix();
         bd.draw(loader as DisplayObject,m);
         var bm:Bitmap = new Bitmap(bd);
         if(this._facebookPhotoCounter == 0 && this.albumPhotoAC.length + 1 != this.myPhotoArray.length)
         {
            this.loadingNum = this.albumPhotoAC.length;
            this.loadingObj = {
               "bm":bm,
               "name":loader.name,
               "title":loader.name,
               "photoID":null
            };
            this.albumPhotoAC.addItem({
               "bm":null,
               "name":null,
               "title":null,
               "photoID":null
            });
            if((this.album_cb.selectedItem as AlbumObj).albumPhotoAC == null)
            {
               (this.album_cb.selectedItem as AlbumObj).albumPhotoAC = new AlbumPhotoAC();
            }
            (this.album_cb.selectedItem as AlbumObj).albumPhotoAC.addAlbumPhotoAC(null,null,null,null);
            (this.album_cb.selectedItem as AlbumObj).loadingNum = this.loadingNum;
            (this.album_cb.selectedItem as AlbumObj).loadingObj = new AlbumPhotoObj(bm,loader.name,loader.name,null);
         }
         else
         {
            myAlbumPhotoObj = new AlbumPhotoObj(bm,loader.name,loader.name,null);
            this.albumPhotoAC.addItem({
               "bm":bm,
               "name":loader.name,
               "title":loader.name,
               "photoID":null
            });
            if((this.album_cb.selectedItem as AlbumObj).albumPhotoAC == null)
            {
               (this.album_cb.selectedItem as AlbumObj).albumPhotoAC = new AlbumPhotoAC();
            }
            (this.album_cb.selectedItem as AlbumObj).albumPhotoAC.addAlbumPhotoAC(bm,loader.name,loader.name,null);
         }
         if(this._facebookPhotoCounter <= 0 || this.albumPhotoAC.length == this.myPhotoArray.length)
         {
            this.disableFBPhotosSearching();
         }
         if(this.albumPhotoAC.length == this.myPhotoArray.length)
         {
            this.disableFBPhotosSearching();
            (this.album_cb.selectedItem as AlbumObj).loadingNum = -1;
            (this.album_cb.selectedItem as AlbumObj).loadingObj = null;
         }
      }
      
      private function resetFBSearch() : void
      {
         this.albumPhotoAC = new ArrayCollection();
         this.album_lb.text = "";
      }
      
      private function setListHeight(param1:FlexEvent) : void
      {
         if((param1.currentTarget as ComboBox).dropdown != null)
         {
            (param1.currentTarget as ComboBase).height = 50;
         }
      }
      
      public function getAuthToken(param1:String) : void
      {
         this._fbLocalConnection.close();
         this._fbLocalConnection = null;
         this.fb_mask.visible = false;
         this.fbAuthToken = param1;
         this.fBook = new Facebook();
         this.fBook.addEventListener("ready",this.onFacebookReady);
         if(this._bottom.appParam("apiserver") != null && this._bottom.appParam("apiserver").indexOf("goanimate.org") != -1)
         {
            this.fBook.startWebSession(param1,"fa6cd743e5db33c9bcd76409f55db0a7","7230e27c2cf8b86bf4ff3663b7fab301");
         }
         else
         {
            this.fBook.startWebSession(param1,"71d7ef7b08588ecc886428a96d0cdba3","3486346931b9cb83b92ecca642b33025");
         }
      }
      
      public function initFaceBook() : void
      {
         var _loc1_:String = null;
         var _loc2_:URLVariables = null;
         var _loc3_:URLRequest = null;
         if(!this._bottom.facebook && this.fbAuthToken == null)
         {
            if(this._fbLocalConnection == null)
            {
               this._fbLocalConnection = new LocalConnection();
               this._fbLocalConnection.allowDomain("*");
               this._fbLocalConnection.allowInsecureDomain("*");
               this._fbLocalConnection.client = this;
            }
            try
            {
               if(!this._bottom.facebook)
               {
                  this._fbLocalConnection.connect("_fbConn");
               }
               else
               {
                  this._fbLocalConnection.connect("fbConn");
               }
            }
            catch(e:Error)
            {
            }
            if(this._bottom.appParam("apiserver") != null && this._bottom.appParam("apiserver").indexOf("goanimate.org") != -1)
            {
               _loc1_ = "fa6cd743e5db33c9bcd76409f55db0a7";
            }
            else
            {
               _loc1_ = "71d7ef7b08588ecc886428a96d0cdba3";
            }
            _loc2_ = new URLVariables();
            _loc2_["api_key"] = _loc1_;
            _loc2_["v"] = "1.0";
            _loc3_ = new URLRequest("http://www.facebook.com/login.php?" + _loc2_.toString());
            navigateToURL(_loc3_,"_blank");
         }
         else
         {
            this.loadingNum = -1;
            this.loadingObj = null;
            if(this.fBook == null)
            {
               Security.allowDomain(["www.facebook.com","apps.facebook.com","http://photos-a.ak.facebook.com","http://photos-b.ak.facebook.com","http://photos-c.ak.facebook.com","http://photos-d.ak.facebook.com","*"]);
               Security.allowInsecureDomain(["www.facebook.com","apps.facebook.com","http://photos-a.ak.facebook.com","http://photos-b.ak.facebook.com","http://photos-c.ak.facebook.com","http://photos-d.ak.facebook.com","*"]);
               Security.loadPolicyFile("http://apps.facebook.com/crossdomain.xml");
               Security.loadPolicyFile("http://api.facebook.com/crossdomain.xml");
               Security.loadPolicyFile("http://www.facebook.com/crossdomain.xml");
               Security.loadPolicyFile("http://photos-a.ak.facebook.com/crossdomain.xml");
               Security.loadPolicyFile("http://photos-b.ak.facebook.com/crossdomain.xml");
               Security.loadPolicyFile("http://photos-c.ak.facebook.com/crossdomain.xml");
               Security.loadPolicyFile("http://photos-d.ak.facebook.com/crossdomain.xml");
               this.fBook = new Facebook();
               this.fBook.addEventListener("ready",this.onFacebookReady);
               this.fBook.startWidgetSession(this.config_api_key,this.config_secret);
            }
            else
            {
               this.onFacebookReady(null);
            }
         }
      }
      
      private function enableFBPhotosSearching() : void
      {
         if(!this._fbPhotosSearching)
         {
            this._fbPhotosSearching = true;
            this.setButtonStatus(false);
         }
      }
      
      private function disableFBPhotosSearching() : void
      {
         if(this._fbPhotosSearching == true)
         {
            this._fbPhotosSearching = false;
            this.setButtonStatus(true);
         }
      }
      
      private function onFacebookReady(param1:Event) : void
      {
         var ev:Event = param1;
         if(this._pageReady)
         {
            this.onAllReady(ev);
            this._tileListFacebook.addEventListener("loadNextSet",this.loadNextSetHandler);
         }
         else
         {
            this.addEventListener(FlexEvent.CREATION_COMPLETE,function():void
            {
               _pageReady = true;
               onAllReady(ev);
               _tileListFacebook.addEventListener("loadNextSet",loadNextSetHandler);
            });
         }
      }
      
      private function onAllReady(param1:Event) : void
      {
         var _loc2_:AlbumPhotoAC = null;
         var _loc3_:int = 0;
         var _loc4_:AlbumPhotoObj = null;
         if(FacebookerList.getInstance().length == 0)
         {
            this.enableFBPhotosSearching();
            this.fBook.friends.getFriends(this.onGetFriendsReply);
         }
         else if(this.album_cb.selectedItem as AlbumObj == null)
         {
            this.getAlbumFromUid((this.friend_cb.selectedItem as FacebookObj).uid);
         }
         else if((this.album_cb.selectedItem as AlbumObj).albumPhotoAC != null)
         {
            this.loadingNum = (this.album_cb.selectedItem as AlbumObj).loadingNum;
            if((this.album_cb.selectedItem as AlbumObj).loadingObj == null)
            {
               this.loadingObj = null;
            }
            else
            {
               this.loadingObj = {
                  "bm":(this.album_cb.selectedItem as AlbumObj).loadingObj.bm,
                  "name":(this.album_cb.selectedItem as AlbumObj).loadingObj.name,
                  "title":(this.album_cb.selectedItem as AlbumObj).loadingObj.title,
                  "photoID":(this.album_cb.selectedItem as AlbumObj).loadingObj.photoID
               };
            }
            this.myPhotoArray = (this.album_cb.selectedItem as AlbumObj).photoArr;
            this.photoIndex = (this.album_cb.selectedItem as AlbumObj).photoIndex;
            this.albumPhotoAC = new AlbumPhotoAC();
            _loc2_ = (this.album_cb.selectedItem as AlbumObj).albumPhotoAC;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_.getItemAt(_loc3_) as AlbumPhotoObj;
               this.albumPhotoAC.addItem({
                  "bm":_loc4_.bm,
                  "name":_loc4_.name,
                  "title":_loc4_.title,
                  "photoID":_loc4_.photoID
               });
               _loc3_++;
            }
         }
         else
         {
            this.facebook_vs.selectedIndex = 1;
            this.album_lb.text = UtilDict.toDisplay("import","import_albumempty");
            this.disableFBPhotosSearching();
         }
      }
      
      private function onGetFriendsReply(param1:Event) : void
      {
         var _loc2_:GetFriends_delegate = param1.target as GetFriends_delegate;
         var _loc3_:Array = _loc2_.friends;
         _loc3_.unshift(this.fBook.user);
         this.fBook.users.getInfo(_loc3_,[UserFields.name,UserFields.pic_big],this.onGetInfoReply);
      }
      
      private function onGetInfoReply(param1:Event) : void
      {
         var _loc5_:Object = null;
         this.albumPhotoAC = new ArrayCollection();
         var _loc2_:GetUserInfo_delegate = param1.target as GetUserInfo_delegate;
         var _loc3_:ArrayCollection = _loc2_.users;
         var _loc4_:ArrayCollection = new ArrayCollection();
         var _loc6_:String = null;
         if(!this._bottom.facebook)
         {
            _loc6_ = this.fBook.user.uid.toString();
         }
         else
         {
            _loc6_ = FlexGlobals.topLevelApplication.parameters["fb_sig_user"];
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_.length)
         {
            if(_loc6_ != null && _loc6_ == (_loc3_.getItemAt(_loc7_) as FacebookUser).uid.toString())
            {
               _loc5_ = {
                  "name":(_loc3_.getItemAt(_loc7_) as FacebookUser).name,
                  "uid":(_loc3_.getItemAt(_loc7_) as FacebookUser).uid,
                  "url":(_loc3_.getItemAt(_loc7_) as FacebookUser).pic_big
               };
            }
            else
            {
               _loc4_.addItem({
                  "name":(_loc3_.getItemAt(_loc7_) as FacebookUser).name,
                  "uid":(_loc3_.getItemAt(_loc7_) as FacebookUser).uid,
                  "url":(_loc3_.getItemAt(_loc7_) as FacebookUser).pic_big
               });
            }
            _loc7_++;
         }
         var _loc8_:Sort;
         (_loc8_ = new Sort()).fields = [new SortField("name",true)];
         _loc4_.sort = _loc8_;
         _loc4_.refresh();
         _loc4_.sort = null;
         _loc4_.addItemAt(_loc5_,0);
         var _loc9_:int = 0;
         while(_loc9_ < _loc4_.length)
         {
            FacebookerList.getInstance().addFaceBooker(_loc4_[_loc9_].name,_loc4_[_loc9_].uid,_loc4_[_loc9_].url);
            _loc9_++;
         }
         if(FacebookerList.getInstance().length > 0)
         {
            this.getAlbumFromUid((FacebookerList.getInstance().getItemAt(0) as FacebookObj).uid);
         }
         else
         {
            this.disableFBPhotosSearching();
         }
      }
      
      private function getPhotosFromProfile(param1:Object) : void
      {
         var _loc2_:Number = NaN;
         if(param1 != null && param1 is FacebookObj && (param1 as FacebookObj).albumList != null)
         {
            _loc2_ = (param1 as FacebookObj).uid;
            this.fBook.photos.getPhotos(_loc2_,null,null,this.getProfilePhotosHandler);
         }
      }
      
      private function getProfilePhotosHandler(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc2_:GetPhotos_delegate = param1.target as GetPhotos_delegate;
         this.myPhotoArray = _loc2_.photos;
         (this.album_cb.selectedItem as AlbumObj).photoArr = this.myPhotoArray;
         if(this.myPhotoArray.length > 0)
         {
            this.facebook_vs.selectedIndex = 0;
            this.photoIndex = 0;
            (this.album_cb.selectedItem as AlbumObj).photoIndex = 0;
            if(this.myPhotoArray != null && this.myPhotoArray.length > 0)
            {
               this._facebookPhotoCounter = 9;
               _loc3_ = 0;
               while(this.photoIndex < this.myPhotoArray.length && _loc3_ < 9)
               {
                  this.urlPostRequest(this.myPhotoArray[this.photoIndex] as FacebookPhoto);
                  ++this.photoIndex;
                  _loc3_++;
                  ++(this.album_cb.selectedItem as AlbumObj).photoIndex;
               }
            }
         }
         else
         {
            this.facebook_vs.selectedIndex = 1;
            this.album_lb_text = UtilDict.toDisplay("import","import_albumempty");
            this.disableFBPhotosSearching();
         }
      }
      
      private function getAlbumsHanlder(param1:Event) : void
      {
         var _loc5_:int = 0;
         var _loc2_:AlbumList = new AlbumList();
         var _loc3_:GetAlbums_delegate = param1.target as GetAlbums_delegate;
         var _loc4_:Array = _loc3_.albums;
         if((this.friend_cb.selectedItem as FacebookObj).albumList == null)
         {
            _loc2_.addAlbumList(UtilDict.toDisplay("import","import_propic"));
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc2_.addAlbumList((_loc4_[_loc5_] as FacebookAlbum).name,null,null,_loc4_[_loc5_]);
               _loc5_++;
            }
            (this.friend_cb.selectedItem as FacebookObj).albumList = _loc2_;
         }
         this.getPhotosFromProfile(this.friend_cb.selectedItem);
      }
      
      private function getAlbumFromUid(param1:Number) : void
      {
         var _loc2_:String = null;
         var _loc3_:AlbumPhotoAC = null;
         var _loc4_:int = 0;
         var _loc5_:AlbumPhotoObj = null;
         this.selectedRenderer = null;
         this.albumPhotoAC = new AlbumPhotoAC();
         this.album_lb_text = "";
         if((this.friend_cb.selectedItem as FacebookObj).albumList == null)
         {
            _loc2_ = param1.toString();
            this.enableFBPhotosSearching();
            this.closeStreamConnection();
            this.fBook.photos.getAlbums(_loc2_,this.getAlbumsHanlder);
         }
         else if((this.album_cb.selectedItem as AlbumObj).albumPhotoAC != null)
         {
            this.loadingNum = (this.album_cb.selectedItem as AlbumObj).loadingNum;
            if((this.album_cb.selectedItem as AlbumObj).loadingObj == null)
            {
               this.loadingObj = null;
            }
            else
            {
               this.loadingObj = {
                  "bm":(this.album_cb.selectedItem as AlbumObj).loadingObj.bm,
                  "name":(this.album_cb.selectedItem as AlbumObj).loadingObj.name,
                  "title":(this.album_cb.selectedItem as AlbumObj).loadingObj.title,
                  "photoID":(this.album_cb.selectedItem as AlbumObj).loadingObj.photoID
               };
            }
            this.myPhotoArray = (this.album_cb.selectedItem as AlbumObj).photoArr;
            this.photoIndex = (this.album_cb.selectedItem as AlbumObj).photoIndex;
            if(this.myPhotoArray.length == 0)
            {
               this.facebook_vs.selectedIndex = 1;
               this.album_lb.text = UtilDict.toDisplay("import","import_albumempty");
               this.disableFBPhotosSearching();
            }
            else
            {
               this.facebook_vs.selectedIndex = 0;
               _loc3_ = (this.album_cb.selectedItem as AlbumObj).albumPhotoAC;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc5_ = _loc3_.getItemAt(_loc4_) as AlbumPhotoObj;
                  this.albumPhotoAC.addItem({
                     "bm":_loc5_.bm,
                     "name":_loc5_.name,
                     "title":_loc5_.title,
                     "photoID":_loc5_.photoID
                  });
                  _loc4_++;
               }
            }
         }
         else
         {
            this.facebook_vs.selectedIndex = 1;
            this.album_lb.text = UtilDict.toDisplay("import","import_albumempty");
            this.disableFBPhotosSearching();
         }
      }
      
      private function getPhotosFromAlbum(param1:AlbumObj) : void
      {
         var _loc2_:FacebookAlbum = null;
         var _loc3_:AlbumPhotoAC = null;
         var _loc4_:int = 0;
         var _loc5_:AlbumPhotoObj = null;
         this.selectedRenderer = null;
         this.albumPhotoAC = new AlbumPhotoAC();
         if(this.album_lb != null)
         {
            this.album_lb.text = "";
         }
         if((this.album_cb.selectedItem as AlbumObj).albumPhotoAC != null)
         {
            this.loadingNum = (this.album_cb.selectedItem as AlbumObj).loadingNum;
            if((this.album_cb.selectedItem as AlbumObj).loadingObj == null)
            {
               this.loadingObj = null;
            }
            else
            {
               this.loadingObj = {
                  "bm":(this.album_cb.selectedItem as AlbumObj).loadingObj.bm,
                  "name":(this.album_cb.selectedItem as AlbumObj).loadingObj.name,
                  "title":(this.album_cb.selectedItem as AlbumObj).loadingObj.title,
                  "photoID":(this.album_cb.selectedItem as AlbumObj).loadingObj.photoID
               };
            }
            this.myPhotoArray = (this.album_cb.selectedItem as AlbumObj).photoArr;
            this.photoIndex = (this.album_cb.selectedItem as AlbumObj).photoIndex;
            if(this.myPhotoArray.length == 0)
            {
               this.facebook_vs.selectedIndex = 1;
               this.album_lb.text = UtilDict.toDisplay("import","import_albumempty");
               this.disableFBPhotosSearching();
               return;
            }
            this.facebook_vs.selectedIndex = 0;
            _loc3_ = (this.album_cb.selectedItem as AlbumObj).albumPhotoAC;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc5_ = _loc3_.getItemAt(_loc4_) as AlbumPhotoObj;
               this.albumPhotoAC.addItem({
                  "bm":_loc5_.bm,
                  "name":_loc5_.name,
                  "title":_loc5_.title,
                  "photoID":_loc5_.photoID
               });
               _loc4_++;
            }
            return;
         }
         if(param1 != null)
         {
            _loc2_ = param1.facebookAlbum;
            if(_loc2_ != null)
            {
               this.enableFBPhotosSearching();
               this.closeStreamConnection();
               this.albumPhotoAC = new ArrayCollection();
               this.fBook.photos.getPhotosForAlbum(_loc2_,this.getPhotosHanlder);
            }
            else
            {
               this.enableFBPhotosSearching();
               this.closeStreamConnection();
               this.getPhotosFromProfile(this.friend_cb.selectedItem);
            }
         }
      }
      
      private function getPhotosHanlder(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc2_:GetPhotos_delegate = param1.target as GetPhotos_delegate;
         this.myPhotoArray = _loc2_.photos;
         (this.album_cb.selectedItem as AlbumObj).photoArr = this.myPhotoArray;
         if(this.myPhotoArray.length <= 0)
         {
            this.facebook_vs.selectedIndex = 1;
            this.album_lb.text = UtilDict.toDisplay("import","import_albumempty");
            this.disableFBPhotosSearching();
         }
         else
         {
            this.facebook_vs.selectedIndex = 0;
         }
         this.photoIndex = 0;
         (this.album_cb.selectedItem as AlbumObj).photoIndex = 0;
         if(this.myPhotoArray.length > 0)
         {
            this._facebookPhotoCounter = 9;
            _loc3_ = 0;
            while(this.photoIndex < this.myPhotoArray.length && _loc3_ < 9)
            {
               this.urlPostRequest(this.myPhotoArray[this.photoIndex] as FacebookPhoto);
               ++this.photoIndex;
               _loc3_++;
               ++(this.album_cb.selectedItem as AlbumObj).photoIndex;
            }
         }
      }
      
      private function closeStreamConnection() : void
      {
         if(this._requestStream != null && this._requestStream.connected)
         {
            this._requestStream.close();
         }
         if(this._responseStream != null && this._responseStream.connected)
         {
            this._responseStream.close();
         }
      }
      
      private function urlPostRequest(param1:FacebookPhoto) : void
      {
         var _loc5_:URLRequest = null;
         this.enableFBPhotosSearching();
         var _loc2_:String = param1.caption;
         var _loc3_:String = UtilDict.toDisplay("import","import_untitled");
         if(_loc2_ != null && this._bottom.trim(_loc2_).length > 0)
         {
            _loc3_ = _loc2_;
         }
         var _loc4_:String = param1.src_big;
         var _loc6_:URLVariables = new URLVariables();
         this._bottom.addFlashVarsToURLvar(_loc6_);
         _loc5_ = new URLRequest(ServerConstants.ACTION_GET_FB_PHOTO_BYTE);
         _loc6_["url"] = _loc4_;
         _loc5_.data = _loc6_;
         _loc5_.method = URLRequestMethod.POST;
         this._requestStream = new FbPhotoStream(_loc3_);
         this._requestStream.addEventListener(Event.COMPLETE,this.postRequestHandler);
         this._requestStream.addEventListener(IOErrorEvent.IO_ERROR,this.error);
         this._requestStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
         this._requestStream.load(_loc5_);
      }
      
      private function postRequestHandler(param1:Event) : void
      {
         this._responseStream = FbPhotoStream(param1.target);
         var _loc2_:ByteArray = new ByteArray();
         this._responseStream.readBytes(_loc2_);
         var _loc3_:Loader = new Loader();
         _loc3_.loadBytes(_loc2_);
         _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadProxyImageComplete);
         _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.error);
         _loc3_.name = this._responseStream.photoTag;
      }
      
      private function getName(param1:FacebookObj) : String
      {
         return param1.name;
      }
      
      private function getList(param1:AlbumObj) : String
      {
         return param1.name;
      }
      
      public function ___FacebookWindow_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this._pageReady = true;
      }
      
      private function _FacebookWindow_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FacebookWindowInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         return _loc1_;
      }
      
      public function __friend_cb_dataChange(param1:FlexEvent) : void
      {
         this.setListHeight(param1);
      }
      
      public function __friend_cb_change(param1:ListEvent) : void
      {
         this.getAlbumFromUid((this.friend_cb.selectedItem as FacebookObj).uid);
      }
      
      public function __album_cb_change(param1:ListEvent) : void
      {
         this.getPhotosFromAlbum(this.album_cb.selectedItem as AlbumObj);
      }
      
      private function _FacebookWindow_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PhotoRenderer;
         return _loc1_;
      }
      
      public function ___tileListFacebook_itemClick(param1:ListEvent) : void
      {
         this.photoClickHandler(param1);
      }
      
      public function ___FacebookWindow_VBox2_hide(param1:FlexEvent) : void
      {
         this.album_lb.text = "";
      }
      
      private function _FacebookWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_browse_pic");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_FacebookWindow_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = friend_cb.selectedLabel;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"friend_cb.toolTip");
         result[2] = new Binding(this,function():Object
         {
            return FacebookerList.getInstance();
         },null,"friend_cb.dataProvider");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_album") + ": ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_FacebookWindow_Label3.text");
         result[4] = new Binding(this,function():Object
         {
            return (FacebookerList.getInstance().getItemAt(friend_cb.selectedIndex) as FacebookObj).albumList;
         },null,"album_cb.dataProvider");
         result[5] = new Binding(this,function():Object
         {
            return albumPhotoAC;
         },null,"_tileListFacebook.dataProvider");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = album_lb_text;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"album_lb.text");
         result[7] = new Binding(this,function():Boolean
         {
            return _maskVisible;
         },null,"fb_mask.visible");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_loginfb");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_FacebookWindow_Label5.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _tileListFacebook() : TileList
      {
         return this._882268751_tileListFacebook;
      }
      
      public function set _tileListFacebook(param1:TileList) : void
      {
         var _loc2_:Object = this._882268751_tileListFacebook;
         if(_loc2_ !== param1)
         {
            this._882268751_tileListFacebook = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tileListFacebook",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get album_cb() : ComboBox
      {
         return this._1532078127album_cb;
      }
      
      public function set album_cb(param1:ComboBox) : void
      {
         var _loc2_:Object = this._1532078127album_cb;
         if(_loc2_ !== param1)
         {
            this._1532078127album_cb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"album_cb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get album_lb() : Label
      {
         return this._1532078406album_lb;
      }
      
      public function set album_lb(param1:Label) : void
      {
         var _loc2_:Object = this._1532078406album_lb;
         if(_loc2_ !== param1)
         {
            this._1532078406album_lb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"album_lb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get facebook_vs() : ViewStack
      {
         return this._958110422facebook_vs;
      }
      
      public function set facebook_vs(param1:ViewStack) : void
      {
         var _loc2_:Object = this._958110422facebook_vs;
         if(_loc2_ !== param1)
         {
            this._958110422facebook_vs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"facebook_vs",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fb_mask() : VBox
      {
         return this._1067169649fb_mask;
      }
      
      public function set fb_mask(param1:VBox) : void
      {
         var _loc2_:Object = this._1067169649fb_mask;
         if(_loc2_ !== param1)
         {
            this._1067169649fb_mask = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fb_mask",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get friend_cb() : ComboBox
      {
         return this._1165035104friend_cb;
      }
      
      public function set friend_cb(param1:ComboBox) : void
      {
         var _loc2_:Object = this._1165035104friend_cb;
         if(_loc2_ !== param1)
         {
            this._1165035104friend_cb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friend_cb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get fBook() : Facebook
      {
         return this._96275567fBook;
      }
      
      private function set fBook(param1:Facebook) : void
      {
         var _loc2_:Object = this._96275567fBook;
         if(_loc2_ !== param1)
         {
            this._96275567fBook = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fBook",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      private function get album_lb_text() : String
      {
         return this._281792378album_lb_text;
      }
      
      private function set album_lb_text(param1:String) : void
      {
         var _loc2_:Object = this._281792378album_lb_text;
         if(_loc2_ !== param1)
         {
            this._281792378album_lb_text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"album_lb_text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get albumPhotoAC() : ArrayCollection
      {
         return this._2093764709albumPhotoAC;
      }
      
      private function set albumPhotoAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._2093764709albumPhotoAC;
         if(_loc2_ !== param1)
         {
            this._2093764709albumPhotoAC = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"albumPhotoAC",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _maskVisible() : Boolean
      {
         return this._1426488871_maskVisible;
      }
      
      private function set _maskVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1426488871_maskVisible;
         if(_loc2_ !== param1)
         {
            this._1426488871_maskVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_maskVisible",_loc2_,param1));
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
   }
}
