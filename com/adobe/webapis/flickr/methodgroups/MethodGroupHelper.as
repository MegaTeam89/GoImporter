package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.crypto.MD5;
   import com.adobe.webapis.flickr.AuthPerm;
   import com.adobe.webapis.flickr.AuthResult;
   import com.adobe.webapis.flickr.Blog;
   import com.adobe.webapis.flickr.Category;
   import com.adobe.webapis.flickr.FlickrError;
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.Group;
   import com.adobe.webapis.flickr.License;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.PagedGroupList;
   import com.adobe.webapis.flickr.PagedPhotoList;
   import com.adobe.webapis.flickr.Photo;
   import com.adobe.webapis.flickr.PhotoContext;
   import com.adobe.webapis.flickr.PhotoCount;
   import com.adobe.webapis.flickr.PhotoExif;
   import com.adobe.webapis.flickr.PhotoNote;
   import com.adobe.webapis.flickr.PhotoPool;
   import com.adobe.webapis.flickr.PhotoSet;
   import com.adobe.webapis.flickr.PhotoSize;
   import com.adobe.webapis.flickr.PhotoTag;
   import com.adobe.webapis.flickr.PhotoUrl;
   import com.adobe.webapis.flickr.UploadTicket;
   import com.adobe.webapis.flickr.User;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import com.adobe.webapis.flickr.flickrservice_internal;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   
   class MethodGroupHelper
   {
       
      
      function MethodGroupHelper()
      {
         super();
      }
      
      static function stringToDate(param1:String = "") : Date
      {
         var _loc2_:Date = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         if(param1 == "")
         {
            return null;
         }
         _loc2_ = new Date();
         _loc3_ = param1.split(" ");
         if(_loc3_.length == 2)
         {
            _loc4_ = _loc3_[0].split("-");
            _loc5_ = _loc3_[1].split(":");
            _loc2_.setFullYear(_loc4_[0]);
            _loc2_.setMonth(_loc4_[1] - 1);
            _loc2_.setDate(_loc4_[2]);
            _loc2_.setHours(_loc5_[0]);
            _loc2_.setMinutes(_loc5_[1]);
            _loc2_.setSeconds(_loc5_[2]);
         }
         else
         {
            _loc2_.setTime(parseInt(param1) * 1000);
         }
         return _loc2_;
      }
      
      static function processAndDispatch(param1:FlickrService, param2:String, param3:FlickrResultEvent, param4:String = "", param5:Function = null) : void
      {
         var _loc6_:Object = null;
         _loc6_ = processResponse(param2,param4,param5);
         param3.success = _loc6_.success;
         param3.data = _loc6_.data;
         param1.dispatchEvent(param3);
      }
      
      static function parsePhotoPerms(param1:XML) : Photo
      {
         var _loc2_:Photo = null;
         _loc2_ = new Photo();
         _loc2_.id = param1.perms.@id.toString();
         _loc2_.isPublic = param1.perms.@ispublic.toString() == "1";
         _loc2_.isFriend = param1.perms.@isfriend.toString() == "1";
         _loc2_.isFamily = param1.perms.@isfamily.toString() == "1";
         _loc2_.canComment = parseInt(param1.perms.@permcomment);
         _loc2_.canAddMeta = parseInt(param1.perms.@permaddmeta);
         return _loc2_;
      }
      
      static function parseGroupList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:Group = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.groups.group)
         {
            (_loc4_ = new Group()).nsid = _loc3_.@nsid.toString();
            _loc4_.name = _loc3_.@name.toString();
            _loc4_.isAdmin = _loc3_.@admin.toString == "1";
            if(_loc3_.@privacy.toString())
            {
               _loc4_.privacy = parseInt(_loc3_.@privacy);
            }
            if(_loc3_.@photos.toString())
            {
               _loc4_.photos = parseInt(_loc3_.@photos);
            }
            if(_loc3_.@iconserver.toString())
            {
               _loc4_.iconServer = parseInt(_loc3_.@iconserver);
            }
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parseGroup(param1:XML) : Group
      {
         var _loc2_:Group = null;
         _loc2_ = new Group();
         _loc2_.nsid = param1.group.@id.toString();
         if(_loc2_.nsid == "")
         {
            _loc2_.nsid = param1.group.@nsid.toString();
         }
         _loc2_.name = param1.group.name.toString();
         if(_loc2_.name == "")
         {
            _loc2_.name = param1.group.groupname.toString();
         }
         _loc2_.description = param1.group.description.toString();
         if(param1.group.members.toString())
         {
            _loc2_.members = parseInt(param1.group.members);
         }
         if(param1.group.privacy.toString())
         {
            _loc2_.privacy = parseInt(param1.group.privacy);
         }
         _loc2_.url = param1.group.@url.toString();
         return _loc2_;
      }
      
      static function parsePagedPhotoList(param1:XML) : PagedPhotoList
      {
         var _loc2_:PagedPhotoList = null;
         var _loc3_:Array = null;
         var _loc4_:XML = null;
         var _loc5_:Photo = null;
         _loc2_ = new PagedPhotoList();
         _loc2_.page = parseInt(param1.photos.@page);
         _loc2_.pages = parseInt(param1.photos.@pages);
         _loc2_.perPage = parseInt(param1.photos.@perpage);
         _loc2_.total = parseInt(param1.photos.@total);
         _loc3_ = new Array();
         for each(_loc4_ in param1.photos.photo)
         {
            (_loc5_ = new Photo()).id = _loc4_.@id.toString();
            _loc5_.ownerId = _loc4_.@owner.toString();
            _loc5_.secret = _loc4_.@secret.toString();
            _loc5_.server = parseInt(_loc4_.@server);
            _loc5_.title = _loc4_.@title.toString();
            _loc5_.isPublic = _loc4_.@ispublic.toString() == "1";
            _loc5_.isFriend = _loc4_.@isfriend.toString() == "1";
            _loc5_.isFamily = _loc4_.@isfamily.toString() == "1";
            if(_loc4_.@license.toString())
            {
               _loc5_.license = parseInt(_loc4_.@license);
            }
            _loc5_.dateUploaded = stringToDate(_loc4_.@dateupload.toString());
            _loc5_.dateTaken = stringToDate(_loc4_.@datetaken.toString());
            _loc5_.dateAdded = stringToDate(_loc4_.@dateadded.toString());
            _loc5_.ownerName = _loc4_.@ownername.toString();
            if(_loc4_.@iconserver.toString())
            {
               _loc5_.iconServer = parseInt(_loc4_.@iconserver);
            }
            _loc5_.originalFormat = _loc4_.@originalformat.toString();
            _loc3_.push(_loc5_);
         }
         _loc2_.photos = _loc3_;
         return _loc2_;
      }
      
      static function processResponse(param1:String, param2:String, param3:Function) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:XMLDocument = null;
         var _loc6_:XMLNode = null;
         var _loc7_:FlickrError = null;
         (_loc4_ = new Object()).data = new Object();
         (_loc5_ = new XMLDocument()).ignoreWhite = true;
         _loc5_.parseXML(param1);
         _loc6_ = _loc5_.firstChild;
         _loc5_ = null;
         if(_loc6_.attributes.stat == "ok")
         {
            _loc4_.success = true;
            if(param3 == null)
            {
               _loc4_.data = XML(_loc6_);
            }
            else
            {
               _loc4_.data[param2] = param3(XML(_loc6_));
            }
         }
         else
         {
            _loc4_.success = false;
            _loc7_ = new FlickrError();
            if(_loc6_.firstChild != null)
            {
               _loc7_.errorCode = int(_loc6_.firstChild.attributes.code);
               _loc7_.errorMessage = _loc6_.firstChild.attributes.msg;
               _loc4_.data.error = _loc7_;
            }
            else
            {
               _loc7_.errorCode = -1;
               _loc7_.errorMessage = _loc6_.nodeValue;
               _loc4_.data.error = _loc7_;
            }
         }
         return _loc4_;
      }
      
      static function parsePhotoNote(param1:XML) : PhotoNote
      {
         var _loc2_:PhotoNote = null;
         _loc2_ = new PhotoNote();
         _loc2_.id = param1.note.@id.toString();
         return _loc2_;
      }
      
      static function parseLicenseList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:License = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.licenses.license)
         {
            (_loc4_ = new License()).id = parseInt(_loc3_.@id);
            _loc4_.name = _loc3_.@name.toString();
            _loc4_.url = _loc3_.@url.toString();
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePhotoCountList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:PhotoCount = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.photocounts.photocount)
         {
            (_loc4_ = new PhotoCount()).count = parseInt(_loc3_.@count);
            _loc4_.fromDate = stringToDate(_loc3_.@fromdate.toString());
            _loc4_.toDate = stringToDate(_loc3_.@todate.toString());
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parseUserTags(param1:XML) : User
      {
         var _loc2_:User = null;
         var _loc3_:XML = null;
         var _loc4_:PhotoTag = null;
         _loc2_ = new User();
         _loc2_.nsid = param1.who.@id.toString();
         for each(_loc3_ in param1.who.tags.tag)
         {
            (_loc4_ = new PhotoTag()).raw = _loc3_.toString();
            _loc4_.tag = _loc3_.toString();
            if(_loc3_.@count.toString())
            {
               _loc4_.count = parseInt(_loc3_.@count);
            }
            _loc2_.tags.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePagedGroupList(param1:XML) : PagedGroupList
      {
         var _loc2_:PagedGroupList = null;
         var _loc3_:XML = null;
         var _loc4_:Group = null;
         _loc2_ = new PagedGroupList();
         _loc2_.page = parseInt(param1.groups.@page);
         _loc2_.pages = parseInt(param1.groups.@pages);
         _loc2_.perPage = parseInt(param1.groups.@perpage);
         _loc2_.total = parseInt(param1.groups.@total);
         for each(_loc3_ in param1.groups.group)
         {
            (_loc4_ = new Group()).nsid = _loc3_.@nsid.toString();
            _loc4_.name = _loc3_.@name.toString();
            _loc4_.isEighteenPlus = _loc3_.@eighteenplus.toString() == "1";
            _loc2_.groups.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePhotoSizeList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:PhotoSize = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.sizes.size)
         {
            (_loc4_ = new PhotoSize()).label = _loc3_.@label.toString();
            _loc4_.width = parseInt(_loc3_.@width);
            _loc4_.height = parseInt(_loc3_.@height);
            _loc4_.source = _loc3_.@source.toString();
            _loc4_.url = _loc3_.@url.toString();
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePhotoSetList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:PhotoSet = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.photosets.photoset)
         {
            (_loc4_ = new PhotoSet()).id = _loc3_.@id.toString();
            _loc4_.url = _loc3_.@url.toString();
            _loc4_.ownerId = _loc3_.@ownerid.toString();
            _loc4_.primaryPhotoId = _loc3_.@primary.toString();
            _loc4_.photoCount = parseInt(_loc3_.@photos.toString());
            _loc4_.secret = _loc3_.@secret.toString();
            _loc4_.server = parseInt(_loc3_.@server.toString());
            _loc4_.title = _loc3_.title.toString();
            _loc4_.description = _loc3_.description.toString();
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePhotoSet(param1:XML) : PhotoSet
      {
         var _loc2_:PhotoSet = null;
         var _loc3_:XML = null;
         var _loc4_:Photo = null;
         _loc2_ = new PhotoSet();
         _loc2_.id = param1.photoset.@id.toString();
         _loc2_.url = param1.photoset.@url.toString();
         _loc2_.ownerId = param1.photoset.@owner.toString();
         _loc2_.primaryPhotoId = param1.photoset.@primary.toString();
         if(param1.photoset.@photos.toString())
         {
            _loc2_.photoCount = parseInt(param1.photoset.@photos.toString());
         }
         _loc2_.title = param1.photoset.title.toString();
         _loc2_.description = param1.photoset.description.toString();
         _loc2_.secret = param1.photoset.@secret.toString();
         if(param1.photoset.@server.toString())
         {
            _loc2_.server = parseInt(param1.photoset.@server.toString());
         }
         for each(_loc3_ in param1.photoset.photo)
         {
            (_loc4_ = new Photo()).id = _loc3_.@id.toString();
            _loc4_.secret = _loc3_.@secret.toString();
            _loc4_.title = _loc3_.@title.toString();
            _loc4_.server = parseInt(_loc3_.@server);
            _loc2_.photos.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePhotoExifs(param1:XML) : Photo
      {
         var _loc2_:Photo = null;
         var _loc3_:XML = null;
         var _loc4_:PhotoExif = null;
         _loc2_ = new Photo();
         _loc2_.id = param1.photo.@id.toString();
         _loc2_.secret = param1.photo.@secret.toString();
         _loc2_.server = parseInt(param1.photo.@server);
         for each(_loc3_ in param1.photo.exif)
         {
            (_loc4_ = new PhotoExif()).tag = parseInt(_loc3_.@tag);
            _loc4_.tagspaceId = parseInt(_loc3_.@tagspaceid);
            _loc4_.tagspace = _loc3_.@tagspace.toString();
            _loc4_.label = _loc3_.@label.toString();
            _loc4_.raw = _loc3_.raw.toString();
            _loc4_.clean = _loc3_.clean.toString();
            _loc2_.exifs.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parseUser(param1:XML) : User
      {
         var _loc2_:User = null;
         _loc2_ = new User();
         _loc2_.nsid = param1.user.@nsid.toString();
         if(_loc2_.nsid.length == 0)
         {
            _loc2_.nsid = param1.user.@id.toString();
         }
         _loc2_.username = param1.user.username.toString();
         _loc2_.isPro = param1.user.@ispro.toString() == "1";
         _loc2_.bandwidthMax = Number(param1.user.bandwidth.@max.toString());
         _loc2_.bandwidthUsed = Number(param1.user.bandwidth.@used.toString());
         _loc2_.filesizeMax = Number(param1.user.filesize.@max.toString());
         _loc2_.url = param1.user.@url.toString();
         return _loc2_;
      }
      
      static function parsePerson(param1:XML) : User
      {
         var _loc2_:User = null;
         _loc2_ = new User();
         _loc2_.nsid = param1.person.@nsid.toString();
         _loc2_.isAdmin = param1.person.@isadmin.toString() == "1";
         _loc2_.isPro = param1.person.@ispro.toString() == "1";
         _loc2_.iconServer = parseInt(param1.person.@iconserver);
         _loc2_.username = param1.person.username.toString();
         _loc2_.fullname = param1.person.realname.toString();
         _loc2_.mboxSha1Sum = param1.person.mbox_sha1sum.toString();
         _loc2_.location = param1.person.location.toString();
         _loc2_.photoUrl = param1.person.photosurl.toString();
         _loc2_.profileUrl = param1.person.profileurl.toString();
         _loc2_.firstPhotoUploadDate = stringToDate(param1.person.photos.firstdate.toString());
         _loc2_.firstPhotoTakenDate = stringToDate(param1.person.photos.firstdatetaken.toString());
         _loc2_.photoCount = parseInt(param1.person.photos.count);
         return _loc2_;
      }
      
      static function parseGroupCategory(param1:XML) : Category
      {
         var _loc2_:Category = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:Category = null;
         var _loc6_:Group = null;
         _loc2_ = new Category();
         _loc2_.name = param1.category.@name.toString();
         _loc2_.path = param1.category.@path.toString();
         _loc2_.pathIds = param1.category.@pathids.toString();
         for each(_loc3_ in param1.category.subcat)
         {
            (_loc5_ = new Category()).id = _loc3_.@id.toString();
            _loc5_.name = _loc3_.@name.toString();
            _loc5_.count = parseInt(_loc3_.@count);
            _loc2_.subCategories.push(_loc5_);
         }
         for each(_loc4_ in param1.category.group)
         {
            (_loc6_ = new Group()).nsid = _loc4_.@id.toString();
            _loc6_.name = _loc4_.@name.toString();
            _loc6_.members = parseInt(_loc4_.@members);
            _loc6_.online = parseInt(_loc4_.@online);
            _loc6_.chatNsid = _loc4_.@chatnsid.toString();
            _loc6_.inChat = parseInt(_loc4_.@inchat);
            _loc2_.groups.push(_loc6_);
         }
         return _loc2_;
      }
      
      static function parseContactList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:User = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.contacts.contact)
         {
            (_loc4_ = new User()).nsid = _loc3_.@nsid.toString();
            _loc4_.username = _loc3_.@username.toString();
            _loc4_.fullname = _loc3_.@realname.toString();
            _loc4_.isFriend = _loc3_.@friend.toString() == "1";
            _loc4_.isFamily = _loc3_.@family.toString() == "1";
            _loc4_.isIgnored = _loc3_.@ignored.toString() == "1";
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parseTagList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:PhotoTag = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.tags.tag)
         {
            (_loc4_ = new PhotoTag()).raw = _loc3_.toString();
            _loc4_.tag = _loc3_.toString();
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePhotoContext(param1:XML) : PhotoContext
      {
         var _loc2_:PhotoContext = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:PhotoSet = null;
         var _loc6_:PhotoPool = null;
         _loc2_ = new PhotoContext();
         for each(_loc3_ in param1.set)
         {
            (_loc5_ = new PhotoSet()).id = _loc3_.@id.toString();
            _loc5_.title = _loc3_.@title.toString();
            _loc2_.sets.push(_loc5_);
         }
         for each(_loc4_ in param1.pool)
         {
            (_loc6_ = new PhotoPool()).id = _loc4_.@id.toString();
            _loc6_.title = _loc4_.@title.toString();
            _loc2_.pools.push(_loc6_);
         }
         return _loc2_;
      }
      
      static function parseFrob(param1:XML) : String
      {
         return param1.frob.toString();
      }
      
      static function parseBlogList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:Blog = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.blogs.blog)
         {
            (_loc4_ = new Blog()).id = _loc3_.@id.toString();
            _loc4_.name = _loc3_.@name.toString();
            _loc4_.needsPassword = _loc3_.@needspassword.toString() == "1";
            _loc4_.url = _loc3_.@url.toString();
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parseAuthResult(param1:XML) : AuthResult
      {
         var _loc2_:AuthResult = null;
         _loc2_ = new AuthResult();
         _loc2_.token = param1.auth.token.toString();
         _loc2_.perms = param1.auth.perms.toString();
         _loc2_.user = new User();
         _loc2_.user.nsid = param1.auth.user.@nsid.toString();
         _loc2_.user.username = param1.auth.user.@username.toString();
         _loc2_.user.fullname = param1.auth.user.@fullname.toString();
         return _loc2_;
      }
      
      static function invokeMethod(param1:FlickrService, param2:Function, param3:String, param4:Boolean, ... rest) : void
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:URLLoader = null;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         (_loc6_ = new Array()).push(new NameValuePair("api_key",param1.api_key));
         _loc6_.push(new NameValuePair("method",param3));
         _loc7_ = 0;
         while(_loc7_ < rest.length)
         {
            if(rest[_loc7_] is NameValuePair)
            {
               _loc6_.push(rest[_loc7_]);
            }
            else
            {
               _loc6_.push(new NameValuePair("param" + _loc7_,rest[_loc7_].toString()));
            }
            _loc7_++;
         }
         if(param1.permission != AuthPerm.NONE && param1.token)
         {
            _loc6_.push(new NameValuePair("auth_token",param1.token));
            param4 = true;
         }
         if(param4)
         {
            _loc6_.sortOn("name");
            _loc11_ = param1.secret;
            _loc12_ = 0;
            while(_loc12_ < _loc6_.length)
            {
               _loc11_ += _loc6_[_loc12_].name.toString() + _loc6_[_loc12_].value.toString();
               _loc12_++;
            }
            _loc6_.push(new NameValuePair("api_sig",MD5.hash(_loc11_)));
         }
         _loc8_ = "";
         _loc9_ = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc8_ += _loc6_[_loc9_].name + "=" + _loc6_[_loc9_].value + "&";
            _loc9_++;
         }
         (_loc10_ = param1.flickrservice_internal::urlLoader).addEventListener("complete",param2);
         _loc10_.load(new URLRequest(FlickrService.END_POINT + _loc8_));
      }
      
      static function dateToString(param1:Date) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return param1.getFullYear() + "-" + (param1.getMonth() + 1) + "-" + param1.getDate() + " " + param1.getHours() + ":" + param1.getMinutes() + ":" + param1.getSeconds();
      }
      
      static function parseContext(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:Photo = null;
         _loc2_ = new Array();
         _loc3_ = new Photo();
         _loc3_.id = param1.prevphoto.@id.toString();
         _loc3_.secret = param1.prevphoto.@secret.toString();
         _loc3_.title = param1.prevphoto.@title.toString();
         _loc3_.url = param1.prevphoto.@url.toString();
         _loc2_.push(_loc3_);
         _loc3_ = new Photo();
         _loc3_.id = param1.nextphoto.@id.toString();
         _loc3_.secret = param1.nextphoto.@secret.toString();
         _loc3_.title = param1.nextphoto.@title.toString();
         _loc3_.url = param1.nextphoto.@url.toString();
         _loc2_.push(_loc3_);
         return _loc2_;
      }
      
      static function parsePhotoList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:Photo = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.photos.photo)
         {
            (_loc4_ = new Photo()).id = _loc3_.@id.toString();
            _loc4_.ownerId = _loc3_.@owner.toString();
            _loc4_.secret = _loc3_.@secret.toString();
            _loc4_.server = parseInt(_loc3_.@server);
            _loc4_.ownerName = _loc3_.@username.toString();
            _loc4_.title = _loc3_.@title.toString();
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parseUploadTicketList(param1:XML) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:XML = null;
         var _loc4_:UploadTicket = null;
         _loc2_ = new Array();
         for each(_loc3_ in param1.uploader.ticket)
         {
            (_loc4_ = new UploadTicket()).id = _loc3_.@id.toString();
            _loc4_.photoId = _loc3_.@photoid.toString();
            _loc4_.isComplete = _loc3_.@complete.toString() == "1";
            _loc4_.uploadFailed = _loc3_.@complete.toString() == "2";
            _loc4_.isInvalid = _loc3_.@invalid.toString() == "1";
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      static function parsePhoto(param1:XML) : Photo
      {
         var _loc2_:Photo = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:PhotoNote = null;
         var _loc7_:PhotoTag = null;
         var _loc8_:PhotoUrl = null;
         _loc2_ = new Photo();
         _loc2_.id = param1.photo.@id.toString();
         _loc2_.secret = param1.photo.@secret.toString();
         if(param1.photo.@server.toString())
         {
            _loc2_.server = parseInt(param1.photo.@server);
         }
         _loc2_.isFavorite = param1.photo.@isfavorite.toString == "1";
         if(param1.photo.@license.toString())
         {
            _loc2_.license = parseInt(param1.photo.@license);
         }
         if(param1.photo.@rotation.toString())
         {
            _loc2_.rotation = parseInt(param1.photo.@rotation);
         }
         _loc2_.originalFormat = param1.photo.@originalformat.toString();
         _loc2_.ownerId = param1.photo.owner.@nsid.toString();
         _loc2_.ownerName = param1.photo.owner.@username.toString();
         _loc2_.ownerRealName = param1.photo.owner.@realname.toString();
         _loc2_.ownerLocation = param1.photo.owner.@location.toString();
         _loc2_.title = param1.photo.title.toString();
         _loc2_.description = param1.photo.description.toString();
         if(param1.photo.permissions.@permcomment.toString())
         {
            _loc2_.commentPermission = parseInt(param1.photo.permissions.@permcomment);
         }
         if(param1.photo.permissions.@permaddmeta.toString())
         {
            _loc2_.addMetaPermission = parseInt(param1.photo.permissions.@permaddmeta);
         }
         _loc2_.dateAdded = stringToDate(param1.photo.dates.@posted.toString());
         _loc2_.dateTaken = stringToDate(param1.photo.dates.@taken.toString());
         if(param1.photo.editability.@cancomment.toString())
         {
            _loc2_.canComment = parseInt(param1.photo.editability.@cancomment);
         }
         if(param1.photo.editability.@canaddmeta.toString())
         {
            _loc2_.canAddMeta = parseInt(param1.photo.editability.@canaddmeta);
         }
         if(param1.photo.comments.toString())
         {
            _loc2_.commentCount = parseInt(param1.photo.comments);
         }
         for each(_loc3_ in param1.photo.notes.note)
         {
            (_loc6_ = new PhotoNote()).id = _loc3_.@id.toString();
            _loc6_.authorId = _loc3_.@author.toString();
            _loc6_.authorName = _loc3_.@authorname.toString();
            _loc6_.rectangle = new Rectangle();
            _loc6_.rectangle.x = parseInt(_loc3_.@x);
            _loc6_.rectangle.y = parseInt(_loc3_.@y);
            _loc6_.rectangle.width = parseInt(_loc3_.@w);
            _loc6_.rectangle.height = parseInt(_loc3_.@h);
            _loc6_.note = _loc3_.toString();
            _loc2_.notes.push(_loc6_);
         }
         for each(_loc4_ in param1.photo.tags.tag)
         {
            (_loc7_ = new PhotoTag()).id = _loc4_.@id.toString();
            _loc7_.authorId = _loc4_.@author.toString();
            _loc7_.raw = _loc4_.@raw.toString();
            _loc7_.tag = _loc4_.toString();
            _loc2_.tags.push(_loc7_);
         }
         for each(_loc5_ in param1.photo.urls.url)
         {
            (_loc8_ = new PhotoUrl()).type = _loc5_.@type.toString();
            _loc8_.url = _loc5_.toString();
            _loc2_.urls.push(_loc8_);
         }
         return _loc2_;
      }
   }
}
