import 'package:get/get.dart';
import 'package:getx_basic/animated_bottom_navbar/add/add_controller.dart';
import 'package:getx_basic/animated_bottom_navbar/dashboard/dashboard_controller.dart';
import 'package:getx_basic/animated_bottom_navbar/home/home_controller.dart';
import 'package:getx_basic/animated_bottom_navbar/messages/messages_controller.dart';
import 'package:getx_basic/animated_bottom_navbar/user/user_controller.dart';
//to load our dependencies
class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    //lazy put is the most efficient way to load our dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<MessangerController>(() => MessangerController());
    Get.lazyPut<AddController>(() => AddController());


  }
}