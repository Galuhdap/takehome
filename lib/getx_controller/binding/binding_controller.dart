import 'package:get/get.dart';
import 'package:takehomechallenge/getx_controller/cartoon_controller.dart';
import 'package:takehomechallenge/getx_controller/favorit_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {

    Get.put(FavoriteController());
    Get.put(CartoonController());
  }
}
