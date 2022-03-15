package anifire.events
{
   import flash.events.Event;
   
   public class SoundsnapCellEvent extends Event
   {
      
      public static const UPLOAD_SOUND_EVENT:String = "Upload";
      
      public static const ON_SELECTED_EVENT:String = "On_Click";
      
      public static const START_PLAY_SOUND:String = "start_sound";
      
      public static const STOP_PLAY_SOUND:String = "stop_sound";
       
      
      public function SoundsnapCellEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
