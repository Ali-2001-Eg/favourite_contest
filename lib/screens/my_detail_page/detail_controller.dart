import 'package:get/get.dart';

class DetailController extends GetxController{
  var fav = 0.obs;

  void favCounter(){
    if(fav.value==1){
      Get.snackbar('Love it','You already Loved it!');
    }else{
      fav.value++;
      Get.snackbar('Love it','You just Loved it');
    }
  }
}