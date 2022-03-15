package com.pbking.util.collection
{
   import flash.utils.Dictionary;
   import mx.collections.ArrayCollection;
   
   public class HashableArrayCollection extends ArrayCollection
   {
       
      
      private var itemKeyProperty:String;
      
      private var allowDuplicateKey:Boolean;
      
      private var hashedValues:Dictionary;
      
      public function HashableArrayCollection(param1:String = "id", param2:Boolean = true)
      {
         super();
         this.itemKeyProperty = param1;
         this.allowDuplicateKey = param2;
         hashedValues = new Dictionary(true);
      }
      
      private function checkHashItem(param1:Object) : Boolean
      {
         if(param1[itemKeyProperty] == undefined || param1[itemKeyProperty] == null)
         {
            throw new Error("An item added to a HashableArrayCollection must have an ID property");
         }
         return true;
      }
      
      public function getItemById(param1:*) : Object
      {
         return hashedValues[param1];
      }
      
      override public function contains(param1:Object) : Boolean
      {
         if(hashedValues[param1[itemKeyProperty]])
         {
            return true;
         }
         return false;
      }
      
      private function addToHash(param1:Object) : Boolean
      {
         if(checkHashItem(param1))
         {
            if(hashedValues[param1[itemKeyProperty]])
            {
               if(allowDuplicateKey)
               {
                  trace("hashed value already exists!  Adding to array and replacing in hash: " + param1[itemKeyProperty]);
                  hashedValues[param1[itemKeyProperty]] = param1;
                  return true;
               }
               trace("hashed value already exists!  Not adding to the array: " + param1[itemKeyProperty]);
               return false;
            }
            hashedValues[param1[itemKeyProperty]] = param1;
            return true;
         }
         return false;
      }
      
      override public function setItemAt(param1:Object, param2:int) : Object
      {
         if(addToHash(param1))
         {
            return super.setItemAt(param1,param2);
         }
         return null;
      }
      
      override public function addItemAt(param1:Object, param2:int) : void
      {
         if(addToHash(param1))
         {
            super.addItemAt(param1,param2);
         }
      }
      
      public function removeItem(param1:Object) : Boolean
      {
         if(contains(param1))
         {
            removeItemAt(getItemIndex(param1));
            return true;
         }
         return false;
      }
      
      override public function removeItemAt(param1:int) : Object
      {
         var _loc2_:Object = null;
         _loc2_ = super.removeItemAt(param1);
         if(_loc2_)
         {
            removeFromHash(_loc2_);
         }
         return _loc2_;
      }
      
      private function removeFromHash(param1:Object) : void
      {
         delete hashedValues[param1[itemKeyProperty]];
      }
      
      override public function removeAll() : void
      {
         this.hashedValues = new Dictionary(true);
         super.removeAll();
      }
   }
}
