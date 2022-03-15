package com.pbking.facebook.data.users
{
   import com.pbking.facebook.data.misc.FacebookLocation;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class FacebookUser implements IEventDispatcher
   {
       
      
      private var _600094315friends:Array;
      
      private var _160985414first_name:String;
      
      private var _113766sex:String;
      
      private var _776713425networkAffiliations:Array;
      
      private var _2076227591timezone:int;
      
      private var _883056542meeting_sex:Array;
      
      private var _2002886397has_added_app:Boolean;
      
      private var _104263205music:String;
      
      private var _578385717pic_big:String;
      
      private var _2512963hometown_location:FacebookLocation;
      
      private var _2025166887relationship_status:String;
      
      private var _883068731meeting_for:Array;
      
      private var _1214494066pic_square:String;
      
      private var _948399753quotes:String;
      
      private var _1209746477hs2_id:int;
      
      private var _2013122196last_name:String;
      
      private var _1069376125birthday:Date;
      
      private var _1391670531education_history:Array;
      
      private var _3714tv:String;
      
      private var _1478774426work_history:Array;
      
      private var _1413913325profile_update_time:Date;
      
      private var _2082876945notes_count:int;
      
      private var _1807033469affiliations:Array;
      
      private var _1068259517movies:String;
      
      private var _3373707name:String;
      
      private var _115792uid:int;
      
      private var _1209776268hs1_id:int;
      
      private var _547435215religion:String;
      
      private var _1762076142pic_small:String;
      
      private var _239442758status_message:String;
      
      private var _210452739political:String;
      
      private var _110986pic:String;
      
      private var _1524435058grad_year:String;
      
      private var _1341293220hs1_name:String;
      
      private var _432843422is_app_user:Boolean;
      
      private var _1332014026significant_other_id:int;
      
      private var _1168278276isLoggedInUser:Boolean;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _1126443963current_location:FacebookLocation;
      
      private var _2048605165activities:String;
      
      private var _93921962books:String;
      
      private var _1369922371hs2_name:String;
      
      private var _2013968806wall_count:int;
      
      private var _1619363722about_me:String;
      
      private var _891198726status_time:Date;
      
      private var _502611593interests:String;
      
      public function FacebookUser(param1:int)
      {
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.uid = param1;
      }
      
      public function set birthday(param1:Date) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1069376125birthday;
         if(_loc2_ !== param1)
         {
            this._1069376125birthday = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"birthday",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isLoggedInUser() : Boolean
      {
         return this._1168278276isLoggedInUser;
      }
      
      [Bindable(event="propertyChange")]
      public function get political() : String
      {
         return this._210452739political;
      }
      
      [Bindable(event="propertyChange")]
      public function get profile_update_time() : Date
      {
         return this._1413913325profile_update_time;
      }
      
      public function set affiliations(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1807033469affiliations;
         if(_loc2_ !== param1)
         {
            this._1807033469affiliations = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"affiliations",_loc2_,param1));
         }
      }
      
      public function set political(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._210452739political;
         if(_loc2_ !== param1)
         {
            this._210452739political = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"political",_loc2_,param1));
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get education_history() : Array
      {
         return this._1391670531education_history;
      }
      
      [Bindable(event="propertyChange")]
      public function get is_app_user() : Boolean
      {
         return this._432843422is_app_user;
      }
      
      public function set tv(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._3714tv;
         if(_loc2_ !== param1)
         {
            this._3714tv = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tv",_loc2_,param1));
         }
      }
      
      public function set pic(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._110986pic;
         if(_loc2_ !== param1)
         {
            this._110986pic = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pic",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get has_added_app() : Boolean
      {
         return this._2002886397has_added_app;
      }
      
      [Bindable(event="propertyChange")]
      public function get notes_count() : int
      {
         return this._2082876945notes_count;
      }
      
      [Bindable(event="propertyChange")]
      public function get pic_small() : String
      {
         return this._1762076142pic_small;
      }
      
      public function set about_me(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1619363722about_me;
         if(_loc2_ !== param1)
         {
            this._1619363722about_me = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"about_me",_loc2_,param1));
         }
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._3373707name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
         }
      }
      
      public function set profile_update_time(param1:Date) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1413913325profile_update_time;
         if(_loc2_ !== param1)
         {
            this._1413913325profile_update_time = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"profile_update_time",_loc2_,param1));
         }
      }
      
      public function set interests(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._502611593interests;
         if(_loc2_ !== param1)
         {
            this._502611593interests = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"interests",_loc2_,param1));
         }
      }
      
      public function set notes_count(param1:int) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2082876945notes_count;
         if(_loc2_ !== param1)
         {
            this._2082876945notes_count = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"notes_count",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get music() : String
      {
         return this._104263205music;
      }
      
      public function set quotes(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._948399753quotes;
         if(_loc2_ !== param1)
         {
            this._948399753quotes = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"quotes",_loc2_,param1));
         }
      }
      
      public function set last_name(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2013122196last_name;
         if(_loc2_ !== param1)
         {
            this._2013122196last_name = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"last_name",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get status_time() : Date
      {
         return this._891198726status_time;
      }
      
      public function set status_time(param1:Date) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._891198726status_time;
         if(_loc2_ !== param1)
         {
            this._891198726status_time = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"status_time",_loc2_,param1));
         }
      }
      
      public function set work_history(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1478774426work_history;
         if(_loc2_ !== param1)
         {
            this._1478774426work_history = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"work_history",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get religion() : String
      {
         return this._547435215religion;
      }
      
      public function set grad_year(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1524435058grad_year;
         if(_loc2_ !== param1)
         {
            this._1524435058grad_year = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"grad_year",_loc2_,param1));
         }
      }
      
      public function set friends(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._600094315friends;
         if(_loc2_ !== param1)
         {
            this._600094315friends = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friends",_loc2_,param1));
         }
      }
      
      public function set pic_small(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1762076142pic_small;
         if(_loc2_ !== param1)
         {
            this._1762076142pic_small = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pic_small",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get significant_other_id() : int
      {
         return this._1332014026significant_other_id;
      }
      
      public function set education_history(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1391670531education_history;
         if(_loc2_ !== param1)
         {
            this._1391670531education_history = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"education_history",_loc2_,param1));
         }
      }
      
      public function set hs1_name(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1341293220hs1_name;
         if(_loc2_ !== param1)
         {
            this._1341293220hs1_name = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hs1_name",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movies() : String
      {
         return this._1068259517movies;
      }
      
      public function set is_app_user(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._432843422is_app_user;
         if(_loc2_ !== param1)
         {
            this._432843422is_app_user = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"is_app_user",_loc2_,param1));
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function set music(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._104263205music;
         if(_loc2_ !== param1)
         {
            this._104263205music = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"music",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hometown_location() : FacebookLocation
      {
         return this._2512963hometown_location;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      [Bindable(event="propertyChange")]
      public function get wall_count() : int
      {
         return this._2013968806wall_count;
      }
      
      public function set books(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._93921962books;
         if(_loc2_ !== param1)
         {
            this._93921962books = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"books",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hs2_name() : String
      {
         return this._1369922371hs2_name;
      }
      
      [Bindable(event="propertyChange")]
      public function get sex() : String
      {
         return this._113766sex;
      }
      
      public function set religion(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._547435215religion;
         if(_loc2_ !== param1)
         {
            this._547435215religion = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"religion",_loc2_,param1));
         }
      }
      
      public function set significant_other_id(param1:int) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1332014026significant_other_id;
         if(_loc2_ !== param1)
         {
            this._1332014026significant_other_id = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"significant_other_id",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get meeting_sex() : Array
      {
         return this._883056542meeting_sex;
      }
      
      [Bindable(event="propertyChange")]
      public function get uid() : int
      {
         return this._115792uid;
      }
      
      public function set first_name(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._160985414first_name;
         if(_loc2_ !== param1)
         {
            this._160985414first_name = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"first_name",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get work_history() : Array
      {
         return this._1478774426work_history;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get pic_square() : String
      {
         return this._1214494066pic_square;
      }
      
      [Bindable(event="propertyChange")]
      public function get hs1_id() : int
      {
         return this._1209776268hs1_id;
      }
      
      [Bindable(event="propertyChange")]
      public function get birthday() : Date
      {
         return this._1069376125birthday;
      }
      
      [Bindable(event="propertyChange")]
      public function get tv() : String
      {
         return this._3714tv;
      }
      
      [Bindable(event="propertyChange")]
      public function get affiliations() : Array
      {
         return this._1807033469affiliations;
      }
      
      [Bindable(event="propertyChange")]
      public function get interests() : String
      {
         return this._502611593interests;
      }
      
      [Bindable(event="propertyChange")]
      public function get pic() : String
      {
         return this._110986pic;
      }
      
      [Bindable(event="propertyChange")]
      public function get name() : String
      {
         return this._3373707name;
      }
      
      public function set movies(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1068259517movies;
         if(_loc2_ !== param1)
         {
            this._1068259517movies = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movies",_loc2_,param1));
         }
      }
      
      public function set has_added_app(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2002886397has_added_app;
         if(_loc2_ !== param1)
         {
            this._2002886397has_added_app = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"has_added_app",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get about_me() : String
      {
         return this._1619363722about_me;
      }
      
      [Bindable(event="propertyChange")]
      public function get last_name() : String
      {
         return this._2013122196last_name;
      }
      
      [Bindable(event="propertyChange")]
      public function get quotes() : String
      {
         return this._948399753quotes;
      }
      
      public function set hometown_location(param1:FacebookLocation) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2512963hometown_location;
         if(_loc2_ !== param1)
         {
            this._2512963hometown_location = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hometown_location",_loc2_,param1));
         }
      }
      
      public function set status_message(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._239442758status_message;
         if(_loc2_ !== param1)
         {
            this._239442758status_message = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"status_message",_loc2_,param1));
         }
      }
      
      public function set networkAffiliations(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._776713425networkAffiliations;
         if(_loc2_ !== param1)
         {
            this._776713425networkAffiliations = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"networkAffiliations",_loc2_,param1));
         }
      }
      
      public function set current_location(param1:FacebookLocation) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1126443963current_location;
         if(_loc2_ !== param1)
         {
            this._1126443963current_location = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"current_location",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hs1_name() : String
      {
         return this._1341293220hs1_name;
      }
      
      public function set pic_big(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._578385717pic_big;
         if(_loc2_ !== param1)
         {
            this._578385717pic_big = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pic_big",_loc2_,param1));
         }
      }
      
      public function set uid(param1:int) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._115792uid;
         if(_loc2_ !== param1)
         {
            this._115792uid = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"uid",_loc2_,param1));
         }
      }
      
      public function set hs2_name(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1369922371hs2_name;
         if(_loc2_ !== param1)
         {
            this._1369922371hs2_name = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hs2_name",_loc2_,param1));
         }
      }
      
      public function set hs2_id(param1:int) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1209746477hs2_id;
         if(_loc2_ !== param1)
         {
            this._1209746477hs2_id = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hs2_id",_loc2_,param1));
         }
      }
      
      public function set relationship_status(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2025166887relationship_status;
         if(_loc2_ !== param1)
         {
            this._2025166887relationship_status = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"relationship_status",_loc2_,param1));
         }
      }
      
      public function set wall_count(param1:int) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2013968806wall_count;
         if(_loc2_ !== param1)
         {
            this._2013968806wall_count = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wall_count",_loc2_,param1));
         }
      }
      
      public function set meeting_for(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._883068731meeting_for;
         if(_loc2_ !== param1)
         {
            this._883068731meeting_for = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"meeting_for",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get books() : String
      {
         return this._93921962books;
      }
      
      [Bindable(event="propertyChange")]
      public function get first_name() : String
      {
         return this._160985414first_name;
      }
      
      [Bindable(event="propertyChange")]
      public function get status_message() : String
      {
         return this._239442758status_message;
      }
      
      [Bindable(event="propertyChange")]
      public function get meeting_for() : Array
      {
         return this._883068731meeting_for;
      }
      
      [Bindable(event="propertyChange")]
      public function get current_location() : FacebookLocation
      {
         return this._1126443963current_location;
      }
      
      [Bindable(event="propertyChange")]
      public function get pic_big() : String
      {
         return this._578385717pic_big;
      }
      
      [Bindable(event="propertyChange")]
      public function get friends() : Array
      {
         return this._600094315friends;
      }
      
      [Bindable(event="propertyChange")]
      public function get networkAffiliations() : Array
      {
         return this._776713425networkAffiliations;
      }
      
      public function set sex(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._113766sex;
         if(_loc2_ !== param1)
         {
            this._113766sex = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sex",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get relationship_status() : String
      {
         return this._2025166887relationship_status;
      }
      
      [Bindable(event="propertyChange")]
      public function get grad_year() : String
      {
         return this._1524435058grad_year;
      }
      
      public function set pic_square(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1214494066pic_square;
         if(_loc2_ !== param1)
         {
            this._1214494066pic_square = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pic_square",_loc2_,param1));
         }
      }
      
      public function set meeting_sex(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._883056542meeting_sex;
         if(_loc2_ !== param1)
         {
            this._883056542meeting_sex = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"meeting_sex",_loc2_,param1));
         }
      }
      
      public function set activities(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2048605165activities;
         if(_loc2_ !== param1)
         {
            this._2048605165activities = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activities",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hs2_id() : int
      {
         return this._1209746477hs2_id;
      }
      
      [Bindable(event="propertyChange")]
      public function get activities() : String
      {
         return this._2048605165activities;
      }
      
      public function set hs1_id(param1:int) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1209776268hs1_id;
         if(_loc2_ !== param1)
         {
            this._1209776268hs1_id = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hs1_id",_loc2_,param1));
         }
      }
      
      public function set timezone(param1:int) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2076227591timezone;
         if(_loc2_ !== param1)
         {
            this._2076227591timezone = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timezone",_loc2_,param1));
         }
      }
      
      public function set isLoggedInUser(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1168278276isLoggedInUser;
         if(_loc2_ !== param1)
         {
            this._1168278276isLoggedInUser = param1;
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isLoggedInUser",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timezone() : int
      {
         return this._2076227591timezone;
      }
   }
}
