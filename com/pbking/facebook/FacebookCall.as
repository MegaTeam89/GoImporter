package com.pbking.facebook
{
   import com.gsolo.encryption.MD5;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequestMethod;
   import mx.logging.Log;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.HTTPService;
   
   public class FacebookCall extends EventDispatcher
   {
      
      private static var callID:int = 0;
       
      
      private var _xml:XML;
      
      private var _fb:Facebook;
      
      private var _args:Object;
      
      public function FacebookCall(param1:Facebook)
      {
         var _loc2_:String = null;
         var _loc3_:* = null;
         _args = {};
         super();
         this._fb = param1;
         setRequestArgument("v","1.0");
         if(_fb.api_key != null)
         {
            setRequestArgument("api_key",_fb.api_key);
         }
         if(_fb.session_key != null)
         {
            setRequestArgument("session_key",_fb.session_key);
         }
         if(_fb.appCode != null)
         {
            setRequestArgument("appCode",_fb.appCode);
         }
         if(_fb.nextUrl != null)
         {
            setRequestArgument("nextUrl",_fb.nextUrl);
         }
         if(_fb.movieId != null)
         {
            setRequestArgument("movieId",_fb.movieId);
         }
         if(_fb.user_id != null)
         {
            setRequestArgument("user_id",_fb.user_id);
         }
         if(_fb.originalId != null)
         {
            setRequestArgument("originalId",_fb.originalId);
         }
         if(_fb.st != null)
         {
            setRequestArgument("st",_fb.st);
         }
         if(_fb.facebookAppURL != null)
         {
            setRequestArgument("facebookAppURL",_fb.facebookAppURL);
         }
         if(_fb.recipientId != null)
         {
            setRequestArgument("recipientId",_fb.recipientId);
         }
         _loc2_ = new Date().valueOf().toString() + (FacebookCall.callID++).toString();
         this.setRequestArgument("call_id",_loc2_);
         if(_fb.sessionType == FacebookSessionType.WIDGET_APP || _fb.useRedirectServer)
         {
            for(_loc3_ in _fb.fb_sig_values)
            {
               this.setRequestArgument(_loc3_,_fb.fb_sig_values[_loc3_]);
            }
         }
      }
      
      private function onResult(param1:ResultEvent) : void
      {
         _xml = new XML(param1.result);
         default xml namespace = _fb.FACEBOOK_NAMESPACE;
         Log.getLogger("pbking.facebook").debug("< < < received facebook reply:\n" + _xml.toXMLString());
         if(_xml..error_code == undefined)
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
         else
         {
            Log.getLogger("pbking.facebook").warn("!THERE WAS A FACEBOOK ERROR!" + _xml..code + ":" + _xml..msg);
         }
      }
      
      public function post(param1:String = "no_method_required", param2:String = null, param3:Boolean = false) : void
      {
         var _loc4_:HTTPService = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param2 == null)
         {
            param2 = _fb.rest_url;
         }
         this.setRequestArgument("method",param1);
         if(!_fb.useRedirectServer || param3)
         {
            this.setRequestArgument("sig",this.sig);
         }
         (_loc4_ = new HTTPService()).contentType = "application/x-www-form-urlencoded";
         _loc4_.method = URLRequestMethod.POST;
         _loc4_.request = _args;
         _loc4_.url = param2;
         _loc4_.resultFormat = "e4x";
         _loc4_.addEventListener(ResultEvent.RESULT,onResult);
         _loc5_ = "> > > sending facebook message:\n" + _loc4_.url.toString() + "\n args:";
         for(_loc6_ in this._args)
         {
            _loc5_ += "\n " + _loc6_ + " = " + this._args[_loc6_];
         }
         Log.getLogger("pbking.facebook").debug(_loc5_);
         _loc4_.send();
      }
      
      public function getResponseArgument(param1:String) : *
      {
         return null;
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         default xml namespace = _fb.FACEBOOK_NAMESPACE;
      }
      
      private function get sig() : String
      {
         var _loc1_:Array = null;
         var _loc2_:* = null;
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         default xml namespace = _fb.FACEBOOK_NAMESPACE;
         _loc1_ = [];
         for(_loc2_ in this._args)
         {
            if(_loc2_ !== "sig")
            {
               _loc1_.push(_loc2_ + "=" + this._args[_loc2_]);
            }
         }
         _loc1_.sort();
         _loc3_ = "";
         _loc4_ = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc3_ += _loc1_[_loc4_];
            _loc4_++;
         }
         _loc3_ += _fb.secret;
         return MD5.encrypt(_loc3_);
      }
      
      public function setRequestArgument(param1:String, param2:String) : void
      {
         this._args[param1] = param2;
      }
      
      public function getResponse() : XML
      {
         return _xml;
      }
   }
}
