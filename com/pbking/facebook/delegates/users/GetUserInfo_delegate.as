package com.pbking.facebook.delegates.users
{
   import com.pbking.facebook.Facebook;
   import com.pbking.facebook.FacebookCall;
   import com.pbking.facebook.data.misc.FacebookEducationInfo;
   import com.pbking.facebook.data.misc.FacebookLocation;
   import com.pbking.facebook.data.misc.FacebookNetwork;
   import com.pbking.facebook.data.misc.FacebookWorkInfo;
   import com.pbking.facebook.data.users.FacebookUser;
   import com.pbking.facebook.data.util.FacebookDataParser;
   import com.pbking.facebook.delegates.FacebookDelegate;
   import com.pbking.util.collection.HashableArrayCollection;
   import flash.events.Event;
   
   public class GetUserInfo_delegate extends FacebookDelegate
   {
       
      
      public var users:HashableArrayCollection;
      
      private var _userCollection:HashableArrayCollection;
      
      public function GetUserInfo_delegate(param1:Facebook, param2:Array, param3:Array)
      {
         var _loc4_:Array = null;
         var _loc5_:FacebookUser = null;
         var _loc6_:FacebookCall = null;
         _userCollection = new HashableArrayCollection("uid",false);
         super(param1);
         _loc4_ = [];
         for each(_loc5_ in param2)
         {
            _userCollection.addItem(_loc5_);
            _loc4_.push(_loc5_.uid);
         }
         (_loc6_ = new FacebookCall(fBook)).addEventListener(Event.COMPLETE,result);
         _loc6_.setRequestArgument("uids",_loc4_.join(","));
         _loc6_.setRequestArgument("fields",param3.join(","));
         _loc6_.post("facebook.users.getInfo");
      }
      
      override protected function result(param1:Event) : void
      {
         var _loc2_:FacebookCall = null;
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         var _loc5_:FacebookUser = null;
         var _loc6_:XML = null;
         var _loc7_:FacebookNetwork = null;
         var _loc8_:XML = null;
         var _loc9_:XML = null;
         var _loc10_:XML = null;
         var _loc11_:FacebookEducationInfo = null;
         var _loc12_:XML = null;
         var _loc13_:XML = null;
         var _loc14_:FacebookWorkInfo = null;
         _loc2_ = param1.target as FacebookCall;
         default xml namespace = fBook.FACEBOOK_NAMESPACE;
         _loc3_ = _loc2_.getResponse()..user;
         for each(_loc4_ in _loc3_)
         {
            if(_loc5_ = _userCollection.getItemById(parseInt(_loc4_.uid)) as FacebookUser)
            {
               if(_loc4_.name != undefined)
               {
                  _loc5_.name = _loc4_.name.toString();
               }
               if(_loc4_.first_name != undefined)
               {
                  _loc5_.first_name = _loc4_.first_name.toString();
               }
               if(_loc4_.last_name != undefined)
               {
                  _loc5_.last_name = _loc4_.last_name.toString();
               }
               if(_loc4_.pic_small != undefined)
               {
                  _loc5_.pic_small = _loc4_.pic_small.toString();
               }
               if(_loc4_.pic_big != undefined)
               {
                  _loc5_.pic_big = _loc4_.pic_big.toString();
               }
               if(_loc4_.pic_square != undefined)
               {
                  _loc5_.pic_square = _loc4_.pic_square.toString();
               }
               if(_loc4_.pic != undefined)
               {
                  _loc5_.pic = _loc4_.pic.toString();
               }
               if(_loc4_.status_message != undefined)
               {
                  _loc5_.status_message = _loc4_.status.message.toString();
               }
               if(_loc4_.status_time != undefined)
               {
                  _loc5_.status_time = FacebookDataParser.formatDate(_loc4_.status.time);
               }
               if(_loc4_.pic != undefined)
               {
                  _loc5_.affiliations = [];
                  for each(_loc6_ in _loc4_.affiliations)
                  {
                     (_loc7_ = new FacebookNetwork()).nid = parseInt(_loc6_.nid);
                     _loc7_.name = _loc6_.name.toString();
                     _loc7_.type = _loc6_.type.toString();
                     _loc7_.status = _loc6_.status.toString();
                     _loc7_.year = _loc6_.year.toString();
                     _loc5_.affiliations.push(_loc7_);
                  }
               }
               if(_loc4_.hometown_location != undefined)
               {
                  _loc5_.hometown_location = new FacebookLocation();
                  _loc5_.hometown_location.city = _loc4_.hometown_location.city.toString();
                  _loc5_.hometown_location.state = _loc4_.hometown_location.state.toString();
                  _loc5_.hometown_location.country = _loc4_.hometown_location.country.toString();
                  _loc5_.hometown_location.zip = _loc4_.hometown_location.zip.toString();
               }
               if(_loc4_.profile_update_time != undefined)
               {
                  _loc5_.profile_update_time = FacebookDataParser.formatDate(_loc4_.profile_update_time.toString());
               }
               if(_loc4_.timezone != undefined)
               {
                  _loc5_.timezone = parseInt(_loc4_.timezone);
               }
               if(_loc4_.religion != undefined)
               {
                  _loc5_.religion = _loc4_.religion.toString();
               }
               if(_loc4_.birthday != undefined)
               {
                  _loc5_.birthday = FacebookDataParser.formatDate(_loc4_.birthday.toString());
               }
               if(_loc4_.sex != undefined)
               {
                  _loc5_.sex = _loc4_.sex.toString();
               }
               if(_loc4_.political != undefined)
               {
                  _loc5_.political = _loc4_.political.toString();
               }
               if(_loc4_.notes_count != undefined)
               {
                  _loc5_.notes_count = _loc4_.notes_count.toString();
               }
               if(_loc4_.wall_count != undefined)
               {
                  _loc5_.wall_count = _loc4_.wall_count.toString();
               }
               if(_loc4_.meeting_sex != undefined)
               {
                  _loc5_.meeting_sex = [];
                  for each(_loc8_ in _loc4_.meeting_sex.sex)
                  {
                     _loc5_.meeting_sex.push(_loc8_.toString());
                  }
               }
               if(_loc4_.meeting_sex != undefined)
               {
                  _loc5_.meeting_for = [];
                  for each(_loc9_ in _loc4_.meeting_for.seeking)
                  {
                     _loc5_.meeting_for.push(_loc9_.toString());
                  }
               }
               if(_loc4_.relationship_status != undefined)
               {
                  _loc5_.relationship_status = _loc4_.relationship_status.toString();
               }
               if(_loc4_.significant_other_id != undefined)
               {
                  _loc5_.significant_other_id = parseInt(_loc4_.significant_other_id);
               }
               if(_loc4_.hometown_location != undefined)
               {
                  _loc5_.hometown_location = new FacebookLocation();
                  _loc5_.hometown_location.city = _loc4_.hometown_location.city.toString();
                  _loc5_.hometown_location.state = _loc4_.hometown_location.state.toString();
                  _loc5_.hometown_location.country = _loc4_.hometown_location.country.toString();
                  _loc5_.hometown_location.zip = _loc4_.hometown_location.zip.toString();
               }
               if(_loc4_.current_location != undefined)
               {
                  _loc5_.current_location = new FacebookLocation();
                  _loc5_.current_location.city = _loc4_.current_location.city.toString();
                  _loc5_.current_location.state = _loc4_.current_location.state.toString();
                  _loc5_.current_location.country = _loc4_.current_location.country.toString();
                  _loc5_.current_location.zip = _loc4_.current_location.zip.toString();
               }
               if(_loc4_.activities != undefined)
               {
                  _loc5_.activities = _loc4_.activities.toString();
               }
               if(_loc4_.interests != undefined)
               {
                  _loc5_.interests = _loc4_.interests.toString();
               }
               if(_loc4_.music != undefined)
               {
                  _loc5_.music = _loc4_.music.toString();
               }
               if(_loc4_.tv != undefined)
               {
                  _loc5_.tv = _loc4_.tv.toString();
               }
               if(_loc4_.movies != undefined)
               {
                  _loc5_.movies = _loc4_.movies.toString();
               }
               if(_loc4_.books != undefined)
               {
                  _loc5_.books = _loc4_.books.toString();
               }
               if(_loc4_.quotes != undefined)
               {
                  _loc5_.quotes = _loc4_.quotes.toString();
               }
               if(_loc4_.about_me != undefined)
               {
                  _loc5_.about_me = _loc4_.about_me.toString();
               }
               if(_loc4_.hs1_name != undefined)
               {
                  _loc5_.hs1_name = _loc4_.hs_info.hs1_name.toString();
               }
               if(_loc4_.hs2_name != undefined)
               {
                  _loc5_.hs2_name = _loc4_.hs_info.hs2_name.toString();
               }
               if(_loc4_.grad_year != undefined)
               {
                  _loc5_.grad_year = _loc4_.hs_info.grad_year.toString();
               }
               if(_loc4_.hs1_id != undefined)
               {
                  _loc5_.hs1_id = parseInt(_loc4_.hs_info.hs1_id);
               }
               if(_loc4_.hs2_id != undefined)
               {
                  _loc5_.hs2_id = parseInt(_loc4_.hs_info.hs2_id);
               }
               if(_loc4_.education_history != undefined)
               {
                  _loc5_.education_history = [];
                  for each(_loc10_ in _loc4_.education_history)
                  {
                     (_loc11_ = new FacebookEducationInfo()).name = _loc10_.name.toString();
                     _loc11_.year = _loc10_.year.toString();
                     _loc11_.concentrations = [];
                     for each(_loc12_ in _loc10_.concentration)
                     {
                        _loc11_.concentrations.push(_loc12_.toString());
                     }
                     _loc5_.education_history.push(_loc11_);
                  }
               }
               if(_loc4_.work_history != undefined)
               {
                  _loc5_.work_history = [];
                  for each(_loc13_ in _loc4_.work_history)
                  {
                     (_loc14_ = new FacebookWorkInfo()).location = new FacebookLocation();
                     _loc14_.location.city = _loc13_.location.city.toString();
                     _loc14_.location.state = _loc13_.location.state.toString();
                     _loc14_.location.country = _loc13_.location.country.toString();
                     _loc14_.location.zip = _loc13_.location.zip.toString();
                     _loc14_.company_name = _loc13_.company_name.toString();
                     _loc14_.description = _loc13_.description.toString();
                     _loc14_.position = _loc13_.position.toString();
                     _loc14_.start_date = FacebookDataParser.formatDate(_loc13_.start_date.toString());
                     _loc14_.end_date = FacebookDataParser.formatDate(_loc13_.end_date.toString());
                     _loc5_.work_history.push(_loc14_);
                  }
               }
               if(_loc4_.has_added_app != undefined)
               {
                  _loc5_.has_added_app = _loc4_.has_added_app == 1;
               }
               if(_loc4_.is_app_user != undefined)
               {
                  _loc5_.is_app_user = _loc4_.is_app_user == 1;
               }
            }
         }
         users = _userCollection;
         onComplete();
      }
   }
}
