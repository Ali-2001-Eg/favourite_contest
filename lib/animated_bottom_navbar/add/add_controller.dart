import 'package:get/get.dart';

class AddController extends GetxController{
    //obs refers to observable
    var counter=0.obs;
    void increment(){
        counter.value ++;
    }
}