package com.pbking.facebook
{
   import com.gsolo.encryption.MD5;
   import com.pbking.facebook.data.users.FacebookUser;
   import com.pbking.facebook.delegates.auth.CreateToken_delegate;
   import com.pbking.facebook.delegates.auth.GetSession_delegate;
   import com.pbking.facebook.methodGroups.Events;
   import com.pbking.facebook.methodGroups.Feed;
   import com.pbking.facebook.methodGroups.Fql;
   import com.pbking.facebook.methodGroups.Friends;
   import com.pbking.facebook.methodGroups.Groups;
   import com.pbking.facebook.methodGroups.Marketplace;
   import com.pbking.facebook.methodGroups.Notifications;
   import com.pbking.facebook.methodGroups.Pages;
   import com.pbking.facebook.methodGroups.Photos;
   import com.pbking.facebook.methodGroups.Profile;
   import com.pbking.facebook.methodGroups.Users;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import mx.core.Application;
   import mx.events.PropertyChangeEvent;
   import mx.logging.Log;
   
   public class Facebook extends EventDispatcher
   {
       
      
      private var _st:String;
      
      private var _users:Users;
      
      private var _facebookAppURL:String;
      
      private var _useRedirectServer:Boolean;
      
      private var _1718941799login_url:String = "http://www.facebook.com/login.php";
      
      private var _sessionType:String = "WIDGET_APP";
      
      private var _movieId:String;
      
      private var _nextUrl:String;
      
      private var _events:Events;
      
      private var _auth_token:String;
      
      private var _fql:Fql;
      
      private var _recipientId:String;
      
      private var _friends:Friends;
      
      private var _profile:FacebookUser;
      
      private var _originalId:String;
      
      private var _isConnected:Boolean = false;
      
      private var _appCode:String;
      
      private var _68303795fb_sig_values:Object;
      
      private var _session_key:String;
      
      private var _api_key:String;
      
      private var _feed:Feed;
      
      private var _marketplace:Marketplace;
      
      private var _439346494default_rest_url:String = "http://api.facebook.com/restserver.php";
      
      private var _337099132rest_url:String = "http://api.facebook.com/restserver.php";
      
      private var _photos:Photos;
      
      private var _user:FacebookUser;
      
      private var _time:Number = 0;
      
      private var _facebook_namespace:Namespace;
      
      private var _pages:Pages;
      
      private var _fbProfile:Profile;
      
      private var _secret:String = "";
      
      private var _user_id:String;
      
      private var _notifications:Notifications;
      
      private var _groups:Groups;
      
      private var _expires:Number = 0;
      
      public function Facebook()
      {
         _337099132rest_url = "http://api.facebook.com/restserver.php";
         _439346494default_rest_url = "http://api.facebook.com/restserver.php";
         _1718941799login_url = "http://www.facebook.com/login.php";
         _secret = "";
         _time = 0;
         _expires = 0;
         _sessionType = FacebookSessionType.WIDGET_APP;
         _isConnected = false;
         super();
      }
      
      public function get fql() : Fql
      {
         if(!_fql)
         {
            _fql = new Fql(this);
         }
         return this._fql;
      }
      
      public function get FACEBOOK_NAMESPACE() : Namespace
      {
         if(_facebook_namespace == null)
         {
            _facebook_namespace = new Namespace("http://api.facebook.com/1.0/");
         }
         return _facebook_namespace;
      }
      
      public function get facebookAppURL() : String
      {
         return this._facebookAppURL;
      }
      
      private function onReady() : void
      {
         _isConnected = true;
         dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isConnected",false,true));
         dispatchEvent(new Event("ready"));
      }
      
      public function get users() : Users
      {
         if(!_users)
         {
            _users = new Users(this);
         }
         return this._users;
      }
      
      private function prepareSigValues() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = null;
         var _loc3_:* = null;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:String = null;
         var _loc7_:* = null;
         _loc1_ = new Object();
         _loc1_["user"] = this.user;
         _loc1_["time"] = this.time;
         _loc1_["session_key"] = this.session_key;
         _loc1_["api_key"] = this.api_key;
         _loc1_["expires"] = this.expires;
         _loc2_ = [];
         for(_loc3_ in _loc1_)
         {
            if(_loc3_ !== "sig")
            {
               _loc2_.push(_loc3_ + "=" + _loc1_[_loc3_]);
            }
         }
         _loc2_.sort();
         _loc4_ = "";
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_ += _loc2_[_loc5_];
            _loc5_++;
         }
         _loc4_ += secret;
         _loc6_ = MD5.encrypt(_loc4_);
         this.fb_sig_values = new Object();
         fb_sig_values["fb_sig"] = _loc6_;
         for(_loc7_ in _loc1_)
         {
            this.fb_sig_values["fb_sig_" + _loc7_] = _loc1_[_loc7_];
         }
      }
      
      private function set _724211622useRedirectServer(param1:Boolean) : void
      {
         this._useRedirectServer = param1;
      }
      
      public function get recipientId() : String
      {
         return this._recipientId;
      }
      
      public function get user_id() : String
      {
         return this._user_id;
      }
      
      public function set rest_url(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._337099132rest_url;
         if(_loc2_ !== param1)
         {
            this._337099132rest_url = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rest_url",_loc2_,param1));
         }
      }
      
      public function get events() : Events
      {
         if(!_events)
         {
            _events = new Events(this);
         }
         return this._events;
      }
      
      private function set _2145479156facebookAppURL(param1:String) : void
      {
         this._facebookAppURL = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set user_id(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.user_id;
         if(_loc2_ !== param1)
         {
            this._147132913user_id = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"user_id",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set recipientId(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.recipientId;
         if(_loc2_ !== param1)
         {
            this._2118998292recipientId = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recipientId",_loc2_,param1));
         }
      }
      
      public function set login_url(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1718941799login_url;
         if(_loc2_ !== param1)
         {
            this._1718941799login_url = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"login_url",_loc2_,param1));
         }
      }
      
      public function get expires() : Number
      {
         return _expires;
      }
      
      private function set _794451026appCode(param1:String) : void
      {
         this._appCode = param1;
      }
      
      public function get session_key() : String
      {
         return _session_key;
      }
      
      private function set _1883807028originalId(param1:String) : void
      {
         this._originalId = param1;
      }
      
      private function validateDesktopSessionReply(param1:Event) : void
      {
         var _loc2_:GetSession_delegate = null;
         _loc2_ = param1.target as GetSession_delegate;
         this.user.uid = _loc2_.uid;
         this._session_key = _loc2_.session_key;
         this._expires = _loc2_.expires;
         prepareSigValues();
         onReady();
      }
      
      public function get marketplace() : Marketplace
      {
         if(!_marketplace)
         {
            _marketplace = new Marketplace(this);
         }
         return this._marketplace;
      }
      
      [Bindable(event="propertyChange")]
      public function set useRedirectServer(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.useRedirectServer;
         if(_loc2_ !== param1)
         {
            this._724211622useRedirectServer = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"useRedirectServer",_loc2_,param1));
         }
      }
      
      private function set _3681st(param1:String) : void
      {
         this._st = param1;
      }
      
      private function set _2118998292recipientId(param1:String) : void
      {
         this._recipientId = param1;
      }
      
      public function get fbProfile() : Profile
      {
         if(!_fbProfile)
         {
            _fbProfile = new Profile(this);
         }
         return this._fbProfile;
      }
      
      public function get st() : String
      {
         return this._st;
      }
      
      [Bindable(event="propertyChange")]
      public function set appCode(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.appCode;
         if(_loc2_ !== param1)
         {
            this._794451026appCode = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"appCode",_loc2_,param1));
         }
      }
      
      public function set fb_sig_values(param1:Object) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._68303795fb_sig_values;
         if(_loc2_ !== param1)
         {
            this._68303795fb_sig_values = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fb_sig_values",_loc2_,param1));
         }
      }
      
      public function get movieId() : String
      {
         return this._movieId;
      }
      
      public function get nextUrl() : String
      {
         return this._nextUrl;
      }
      
      public function startWidgetSession(param1:String = null, param2:String = null) : void
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = null;
         var _loc5_:* = null;
         sessionType = FacebookSessionType.WIDGET_APP;
         if(param2)
         {
            this._secret = param2;
         }
         if(param1)
         {
            this._api_key = param1;
         }
         this.fb_sig_values = new Object();
         _loc3_ = "fb_sig";
         _loc4_ = /:80/;
         for(_loc5_ in Application.application.parameters)
         {
            if(_loc5_.substring(0,_loc3_.length) == _loc3_)
            {
               this.fb_sig_values[_loc5_] = Application.application.parameters[_loc5_];
            }
            if(_loc5_ == "apiserver")
            {
               rest_url = Application.application.parameters[_loc5_] + "api/facebookProxy/";
               rest_url = rest_url.replace(_loc4_,"");
            }
            else if(_loc5_ == "nextUrl")
            {
               this.nextUrl = Application.application.parameters[_loc5_];
               this.nextUrl = this.nextUrl.replace(_loc4_,"");
            }
            else if(_loc5_ == "movieId")
            {
               this.movieId = Application.application.parameters[_loc5_];
            }
            else if(_loc5_ == "user_id")
            {
               this.user_id = Application.application.parameters[_loc5_];
            }
            else if(_loc5_ == "originalId")
            {
               this.originalId = Application.application.parameters[_loc5_];
            }
            else if(_loc5_ == "st")
            {
               this.st = Application.application.parameters[_loc5_];
            }
            else if(_loc5_ == "facebookAppURL")
            {
               this.facebookAppURL = Application.application.parameters[_loc5_];
               this.facebookAppURL = this.facebookAppURL.replace(_loc4_,"");
            }
            else if(_loc5_ == "recipientId")
            {
               this.recipientId = Application.application.parameters[_loc5_];
            }
            else if(_loc5_ == "appCode")
            {
               this.appCode = Application.application.parameters[_loc5_];
            }
         }
         this._user = new FacebookUser(parseInt(fb_sig_values["fb_sig_user"]));
         this._time = fb_sig_values["fb_sig_time"];
         this._expires = fb_sig_values["fb_sig_expires"];
         if(_user.uid != parseInt(fb_sig_values["fb_sig_profile"]))
         {
            this._profile = new FacebookUser(parseInt(fb_sig_values["fb_sig_profile"]));
         }
         if(this._session_key == null)
         {
            this._session_key = fb_sig_values["fb_sig_session_key"];
         }
         if(this._api_key == null)
         {
            this._api_key = fb_sig_values["fb_sig_api_key"];
         }
         onReady();
      }
      
      public function get photos() : Photos
      {
         if(!_photos)
         {
            _photos = new Photos(this);
         }
         return this._photos;
      }
      
      [Bindable(event="propertyChange")]
      public function get rest_url() : String
      {
         return this._337099132rest_url;
      }
      
      public function validateDesktopSession() : void
      {
         var _loc1_:GetSession_delegate = null;
         _loc1_ = new GetSession_delegate(this,_auth_token);
         _loc1_.addEventListener(Event.COMPLETE,validateDesktopSessionReply);
      }
      
      private function onDesktopTokenCreated(param1:Event) : void
      {
         var _loc2_:CreateToken_delegate = null;
         var _loc3_:String = null;
         _loc2_ = param1.target as CreateToken_delegate;
         _auth_token = _loc2_.auth_token;
         Log.getLogger("pbking.facebook").debug("token created: " + _auth_token);
         _loc3_ = login_url + "?api_key=" + api_key + "&v=1.0&auth_token=" + _auth_token;
         Log.getLogger("pbking.facebook").debug("prompting user for login at: " + _loc3_);
         navigateToURL(new URLRequest(_loc3_),"_blank");
      }
      
      public function get friends() : Friends
      {
         if(!_friends)
         {
            _friends = new Friends(this);
         }
         return this._friends;
      }
      
      [Bindable(event="propertyChange")]
      public function set originalId(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.originalId;
         if(_loc2_ !== param1)
         {
            this._1883807028originalId = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"originalId",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get login_url() : String
      {
         return this._1718941799login_url;
      }
      
      private function set _599209215isConnected(param1:Boolean) : void
      {
      }
      
      public function startWebSession(param1:String = null, param2:String = null, param3:String = null) : void
      {
         var _loc4_:GetSession_delegate = null;
         if(param3)
         {
            this._secret = param3;
         }
         if(param2)
         {
            this._api_key = param2;
         }
         sessionType = FacebookSessionType.WEB_APP;
         if(param1 == null)
         {
            param1 = Application.application.parameters["auth_token"];
         }
         (_loc4_ = new GetSession_delegate(this,param1)).addEventListener(Event.COMPLETE,startWebSessionReply);
      }
      
      public function get feed() : Feed
      {
         if(!_feed)
         {
            _feed = new Feed(this);
         }
         return this._feed;
      }
      
      public function get useRedirectServer() : Boolean
      {
         return _useRedirectServer;
      }
      
      public function get profile() : FacebookUser
      {
         if(!profile)
         {
            return user;
         }
         return _profile;
      }
      
      private function set _147132913user_id(param1:String) : void
      {
         this._user_id = param1;
      }
      
      public function get appCode() : String
      {
         return this._appCode;
      }
      
      public function get secret() : String
      {
         return _secret;
      }
      
      private function set _22459664sessionType(param1:String) : void
      {
         _sessionType = param1;
      }
      
      private function startWebSessionReply(param1:Event) : void
      {
         var _loc2_:GetSession_delegate = null;
         _loc2_ = param1.target as GetSession_delegate;
         this.user.uid = _loc2_.uid;
         this._session_key = _loc2_.session_key;
         this._expires = _loc2_.expires;
         prepareSigValues();
         onReady();
      }
      
      public function get api_key() : String
      {
         return _api_key;
      }
      
      public function set default_rest_url(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._439346494default_rest_url;
         if(_loc2_ !== param1)
         {
            this._439346494default_rest_url = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"default_rest_url",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fb_sig_values() : Object
      {
         return this._68303795fb_sig_values;
      }
      
      public function get pages() : Pages
      {
         if(!_pages)
         {
            _pages = new Pages(this);
         }
         return this._pages;
      }
      
      private function set _1243692139movieId(param1:String) : void
      {
         this._movieId = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get default_rest_url() : String
      {
         return this._439346494default_rest_url;
      }
      
      public function get user() : FacebookUser
      {
         if(!_user)
         {
            _user = new FacebookUser(-1);
            _user.isLoggedInUser = true;
         }
         return _user;
      }
      
      public function get originalId() : String
      {
         return this._originalId;
      }
      
      public function get time() : Number
      {
         if(_time == 0)
         {
            _time = new Date().time / 1000;
         }
         return _time;
      }
      
      [Bindable(event="propertyChange")]
      public function set st(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.st;
         if(_loc2_ !== param1)
         {
            this._3681st = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"st",_loc2_,param1));
         }
      }
      
      public function get isUsersProfile() : Boolean
      {
         return this.profile.uid == this.user.uid;
      }
      
      public function get groups() : Groups
      {
         if(!_groups)
         {
            _groups = new Groups(this);
         }
         return this._groups;
      }
      
      private function set _1847064956nextUrl(param1:String) : void
      {
         this._nextUrl = param1;
      }
      
      public function startDesktopSession(param1:String, param2:String) : void
      {
         var _loc3_:CreateToken_delegate = null;
         this._api_key = param1;
         this._secret = param2;
         sessionType = FacebookSessionType.DESKTOP_APP;
         _loc3_ = new CreateToken_delegate(this);
         _loc3_.addEventListener(Event.COMPLETE,onDesktopTokenCreated);
      }
      
      [Bindable(event="propertyChange")]
      public function set movieId(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.movieId;
         if(_loc2_ !== param1)
         {
            this._1243692139movieId = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieId",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set sessionType(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.sessionType;
         if(_loc2_ !== param1)
         {
            this._22459664sessionType = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sessionType",_loc2_,param1));
         }
      }
      
      public function get notifications() : Notifications
      {
         if(!_notifications)
         {
            _notifications = new Notifications(this);
         }
         return this._notifications;
      }
      
      [Bindable(event="propertyChange")]
      public function set facebookAppURL(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.facebookAppURL;
         if(_loc2_ !== param1)
         {
            this._2145479156facebookAppURL = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"facebookAppURL",_loc2_,param1));
         }
      }
      
      public function get sessionType() : String
      {
         return _sessionType;
      }
      
      [Bindable(event="propertyChange")]
      public function set nextUrl(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.nextUrl;
         if(_loc2_ !== param1)
         {
            this._1847064956nextUrl = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nextUrl",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set isConnected(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.isConnected;
         if(_loc2_ !== param1)
         {
            this._599209215isConnected = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isConnected",_loc2_,param1));
         }
      }
      
      public function get isConnected() : Boolean
      {
         return this._isConnected;
      }
   }
}
