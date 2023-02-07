import 'package:get/get.dart';

class DashboardController extends GetxController{
  var tapIndex=0;
  void changeTapIndex(int index){
    tapIndex=index;
    update();
  }
}