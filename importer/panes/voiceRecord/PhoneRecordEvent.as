package importer.panes.voiceRecord
{
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class PhoneRecordEvent extends ExtraDataEvent
   {
      
      public static const PHONE_RECORD_PHONENUM_DETAIL_READY:String = "phone_record_phonenum_detail_ready";
      
      public static const PHONE_RECORD_USER_PHONE_IN:String = "phone_record_user_phone_in";
      
      public static const PHONE_RECORD_USER_RECORDING:String = "phone_record_user_recording";
      
      public static const PHONE_RECORD_SOUND_FILE_READY:String = "phone_record_sound_file_ready";
      
      public static const PHONE_RECORD_USER_HANG_UP_INCOMPLETE:String = "phone_record_user_hang_up_incomplete";
      
      public static const PHONE_RECORD_SESSION_EXPIRED:String = "phone_record_session_expired";
      
      public static const PHONE_RECORD_ERROR:String = "phone_record_error";
       
      
      private var _soundUrl:String = null;
      
      private var _phoneNum:String = null;
      
      private var _country:String = null;
      
      private var _pin:String = null;
      
      private var _soundLengthInSecond:Number = 0;
      
      public function PhoneRecordEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      public function get soundUrl() : String
      {
         return this._soundUrl;
      }
      
      public function set soundUrl(param1:String) : void
      {
         this._soundUrl = param1;
      }
      
      public function get phoneNum() : String
      {
         return this._phoneNum;
      }
      
      public function set phoneNum(param1:String) : void
      {
         this._phoneNum = param1;
      }
      
      public function get country() : String
      {
         return this._country;
      }
      
      public function set country(param1:String) : void
      {
         this._country = param1;
      }
      
      public function get pin() : String
      {
         return this._pin;
      }
      
      public function set pin(param1:String) : void
      {
         this._pin = param1;
      }
      
      public function get soundLengthInSecond() : Number
      {
         return this._soundLengthInSecond;
      }
      
      public function set soundLengthInSecond(param1:Number) : void
      {
         this._soundLengthInSecond = param1;
      }
      
      override public function clone() : Event
      {
         var _loc1_:PhoneRecordEvent = new PhoneRecordEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_._soundUrl = this.soundUrl;
         _loc1_._phoneNum = this.phoneNum;
         _loc1_._country = this.country;
         _loc1_._pin = this.pin;
         _loc1_._soundLengthInSecond = this.soundLengthInSecond;
         return _loc1_;
      }
   }
}
