package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.net.URLLoader;
   
   public class PhotoSets
   {
       
      
      private var _service:FlickrService;
      
      public function PhotoSets(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      private function create_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_CREATE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photoSet",MethodGroupHelper.parsePhotoSet);
      }
      
      private function addPhoto_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_ADD_PHOTO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function removePhoto(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,removePhoto_result,"flickr.photosets.removePhoto",false,new NameValuePair("photoset_id",param1),new NameValuePair("photo_id",param2));
      }
      
      public function addPhoto(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,addPhoto_result,"flickr.photosets.addPhoto",false,new NameValuePair("photoset_id",param1),new NameValuePair("photo_id",param2));
      }
      
      public function getList(param1:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,getList_result,"flickr.photosets.getList",false,new NameValuePair("user_id",param1));
      }
      
      private function getInfo_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_INFO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photoSet",MethodGroupHelper.parsePhotoSet);
      }
      
      private function orderSets_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_ORDER_SETS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function getContext_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_CONTEXT);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"context",MethodGroupHelper.parseContext);
      }
      
      public function getInfo(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getInfo_result,"flickr.photosets.getInfo",false,new NameValuePair("photoset_id",param1));
      }
      
      private function getPhotos_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_PHOTOS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photoSet",MethodGroupHelper.parsePhotoSet);
      }
      
      private function getList_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_LIST);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"photoSets",MethodGroupHelper.parsePhotoSetList);
      }
      
      public function editPhotos(param1:String, param2:String, param3:Array) : void
      {
         MethodGroupHelper.invokeMethod(_service,editPhotos_result,"flickr.photosets.editPhotos",false,new NameValuePair("photoset_id",param1),new NameValuePair("primary_photo_id",param2),new NameValuePair("photo_ids",param3.join(",")));
      }
      
      private function editMeta_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_EDIT_META);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function removePhoto_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_REMOVE_PHOTO);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function editMeta(param1:String, param2:String, param3:String = "") : void
      {
         MethodGroupHelper.invokeMethod(_service,editMeta_result,"flickr.photosets.editMeta",false,new NameValuePair("photoset_id",param1),new NameValuePair("title",param2),new NameValuePair("description",param3));
      }
      
      private function editPhotos_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_EDIT_PHOTOS);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function getPhotos(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getPhotos_result,"flickr.photosets.getPhotos",false,new NameValuePair("photoset_id",param1));
      }
      
      private function delete_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_DELETE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function getContext(param1:String, param2:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,getContext_result,"flickr.photosets.getContext",false,new NameValuePair("photo_id",param1),new NameValuePair("photoset_id",param2));
      }
      
      public function create(param1:String, param2:String, param3:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,create_result,"flickr.photosets.create",false,new NameValuePair("title",param1),new NameValuePair("description",param2),new NameValuePair("primary_photo_id",param3));
      }
      
      public function deleteSet(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,delete_result,"flickr.photosets.delete",false,new NameValuePair("photoset_id",param1));
      }
      
      public function orderSets(param1:Array) : void
      {
         MethodGroupHelper.invokeMethod(_service,orderSets_result,"flickr.photosets.orderSets",false,new NameValuePair("photoset_ids",param1.join(",")));
      }
   }
}
