import 'package:get/get.dart';



import '../controllers/network_controller.dart';

class NetWorkBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<NetWorkController>(
      () => NetWorkController(),
    );
  }
}
