package com.adobe.webapis.flickr.methodgroups
{
   import com.adobe.webapis.flickr.FlickrService;
   import com.adobe.webapis.flickr.NameValuePair;
   import com.adobe.webapis.flickr.events.FlickrResultEvent;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   
   public class Notes
   {
       
      
      private var _service:FlickrService;
      
      public function Notes(param1:FlickrService)
      {
         super();
         _service = param1;
      }
      
      private function delete_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_NOTES_DELETE);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      private function edit_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_NOTES_EDIT);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_);
      }
      
      public function add(param1:String, param2:Rectangle, param3:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,add_result,"flickr.photos.notes.add",false,new NameValuePair("photo_id",param1),new NameValuePair("note_x",param2.x.toString()),new NameValuePair("note_y",param2.y.toString()),new NameValuePair("note_width",param2.width.toString()),new NameValuePair("note_height",param2.height.toString()),new NameValuePair("note_text",param3));
      }
      
      public function edit(param1:String, param2:Rectangle, param3:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,edit_result,"flickr.photos.notes.edit",false,new NameValuePair("note_id",param1),new NameValuePair("note_x",param2.x.toString()),new NameValuePair("note_y",param2.y.toString()),new NameValuePair("note_width",param2.width.toString()),new NameValuePair("note_height",param2.height.toString()),new NameValuePair("note_text",param3));
      }
      
      private function add_result(param1:Event) : void
      {
         var _loc2_:FlickrResultEvent = null;
         _loc2_ = new FlickrResultEvent(FlickrResultEvent.PHOTOS_NOTES_ADD);
         MethodGroupHelper.processAndDispatch(_service,URLLoader(param1.target).data,_loc2_,"note",MethodGroupHelper.parsePhotoNote);
      }
      
      public function deleteNote(param1:String) : void
      {
         MethodGroupHelper.invokeMethod(_service,delete_result,"flickr.photos.notes.delete",false,new NameValuePair("note_id",param1));
      }
   }
}
