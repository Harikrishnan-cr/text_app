


import 'package:get/get.dart';

class LikedContrller extends GetxController{

   bool likedOrNotSample = false; 

   void onLikeChanges(value){
likedOrNotSample = value;  
update(); 
   }
} 