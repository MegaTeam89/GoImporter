package importer.panes.voiceRecord
{
   import anifire.constant.ServerConstants;
   import anifire.util.UtilNetwork;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.Timer;
   
   public class PhoneRecordController extends EventDispatcher
   {
       
      
      private var _sessionKey:String;
      
      private var _bottom:importer;
      
      private var _timer:Timer;
      
      public function PhoneRecordController(param1:Object)
      {
         this._timer = new Timer(2000,1);
         super();
         if(param1 != null)
         {
            this._bottom = param1 as importer;
         }
      }
      
      private function get sessionKey() : String
      {
         return this._sessionKey;
      }
      
      private function set sessionKey(param1:String) : void
      {
         this._sessionKey = param1;
      }
      
      private function get timer() : Timer
      {
         return this._timer;
      }
      
      public function startPhoneRecord() : void
      {
         this.requestStartPhoneRecord();
      }
      
      public function stopPhoneRecord() : void
      {
         this.timer.delay = Number.MAX_VALUE;
         this.timer.reset();
         this.timer.stop();
         if(this.timer.hasEventListener(TimerEvent.TIMER_COMPLETE))
         {
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.doAnalysisSessionStatus);
         }
      }
      
      private function requestStartPhoneRecord() : void
      {
         var _loc1_:URLVariables = new URLVariables();
         this._bottom.addFlashVarsToURLvar(_loc1_);
         var _loc2_:URLRequest = UtilNetwork.getRequest(ServerConstants.ACTION_START_PHONE_RECORD,URLRequestMethod.POST,_loc1_,null);
         var _loc3_:URLLoader = new URLLoader(_loc2_);
         _loc3_.addEventListener(Event.COMPLETE,this.doShowPhoneDetailToUser);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.doShowError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doShowError);
         _loc3_.load(_loc2_);
      }
      
      private function doShowPhoneDetailToUser(param1:Event) : void
      {
         var responseXml:XML = null;
         var phoneNum:String = null;
         var ivrPin:String = null;
         var country:String = null;
         var event:Event = param1;
         (event.target as IEventDispatcher).removeEventListener(event.type,this.doShowPhoneDetailToUser);
         var urlLoader:URLLoader = event.target as URLLoader;
         try
         {
            responseXml = new XML(urlLoader.data as String);
         }
         catch(e:Error)
         {
            this.showError();
            return;
         }
         if(responseXml.@success != "Y")
         {
            this.showError();
            return;
         }
         phoneNum = responseXml.child("phone_number").toString();
         ivrPin = responseXml.child("ivr_pin").toString();
         country = responseXml.child("country").toString();
         this.sessionKey = responseXml.child("session_key").toString();
         var phoneEvt:PhoneRecordEvent = new PhoneRecordEvent(PhoneRecordEvent.PHONE_RECORD_PHONENUM_DETAIL_READY,this);
         phoneEvt.phoneNum = phoneNum;
         phoneEvt.pin = ivrPin;
         phoneEvt.country = country;
         this.dispatchEvent(phoneEvt);
         this.pollSessionStatus();
      }
      
      private function pollSessionStatus() : void
      {
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.doPollSessionStatus);
         this.timer.start();
      }
      
      private function doPollSessionStatus(param1:Event) : void
      {
         var _loc2_:URLVariables = null;
         var _loc3_:URLRequest = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPollSessionStatus);
         _loc2_ = new URLVariables();
         _loc2_["action"] = "GetSessionStatus";
         _loc2_["recording_session_key"] = this.sessionKey;
         _loc3_ = UtilNetwork.getRequest(ServerConstants.MY_VOX_API_SERVER_URL,URLRequestMethod.POST,_loc2_,null);
         var _loc4_:URLLoader;
         (_loc4_ = new URLLoader(_loc3_)).addEventListener(Event.COMPLETE,this.doAnalysisSessionStatus);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.doShowError);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doShowError);
         _loc4_.load(_loc3_);
      }
      
      private function doAnalysisSessionStatus(param1:Event) : void
      {
         var responseXml:XML = null;
         var phoneEvt:PhoneRecordEvent = null;
         var sessionStatus:String = null;
         var hasMp3:Boolean = false;
         var mp3Url:String = null;
         var soundLengthInSecond:Number = NaN;
         var event:Event = param1;
         try
         {
            responseXml = new XML((event.target as URLLoader).data as String);
            if(responseXml.@status != "success")
            {
               this.showError();
               return;
            }
         }
         catch(e:Error)
         {
            this.showError();
            return;
         }
         sessionStatus = responseXml.child("session_state");
         if(sessionStatus == "created")
         {
            this.pollSessionStatus();
         }
         else if(sessionStatus == "called")
         {
            phoneEvt = new PhoneRecordEvent(PhoneRecordEvent.PHONE_RECORD_USER_PHONE_IN,this);
            this.dispatchEvent(phoneEvt);
            this.pollSessionStatus();
         }
         else if(sessionStatus == "recording")
         {
            phoneEvt = new PhoneRecordEvent(PhoneRecordEvent.PHONE_RECORD_USER_RECORDING,this);
            this.dispatchEvent(phoneEvt);
            this.pollSessionStatus();
         }
         else if(sessionStatus == "ended")
         {
            hasMp3 = responseXml..has_mp3_file == "true" ? true : false;
            if(hasMp3)
            {
               mp3Url = responseXml..mp3_url;
               soundLengthInSecond = responseXml..recording_length;
               phoneEvt = new PhoneRecordEvent(PhoneRecordEvent.PHONE_RECORD_SOUND_FILE_READY,this);
               phoneEvt.soundUrl = mp3Url;
               phoneEvt.soundLengthInSecond = soundLengthInSecond;
               this.dispatchEvent(phoneEvt);
            }
            else
            {
               phoneEvt = new PhoneRecordEvent(PhoneRecordEvent.PHONE_RECORD_USER_HANG_UP_INCOMPLETE,this);
               this.dispatchEvent(phoneEvt);
               this.pollSessionStatus();
            }
         }
         else if(sessionStatus == "expired")
         {
            phoneEvt = new PhoneRecordEvent(PhoneRecordEvent.PHONE_RECORD_SESSION_EXPIRED,this);
            this.dispatchEvent(phoneEvt);
         }
      }
      
      private function getRecordingDetail() : void
      {
         var _loc1_:URLVariables = null;
         var _loc2_:URLRequest = null;
         _loc1_ = new URLVariables();
         _loc1_["action"] = "GetRecording";
         _loc1_["recording_session_key"] = this.sessionKey;
         _loc2_ = UtilNetwork.getRequest(ServerConstants.MY_VOX_API_SERVER_URL,URLRequestMethod.POST,_loc1_,null);
         var _loc3_:URLLoader = new URLLoader(_loc2_);
         _loc3_.addEventListener(Event.COMPLETE,this.doAnalysisSessionStatus);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.doShowError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doShowError);
         _loc3_.load(_loc2_);
      }
      
      private function doShowError(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doShowError);
         this.showError();
      }
      
      private function showError() : void
      {
         var _loc1_:PhoneRecordEvent = new PhoneRecordEvent(PhoneRecordEvent.PHONE_RECORD_ERROR,this);
         this.dispatchEvent(_loc1_);
      }
   }
}
