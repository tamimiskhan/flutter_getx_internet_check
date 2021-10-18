import 'package:flutter/material.dart';
import 'package:flutter_getx_internet_check/app/networks/controllers/network_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final NetWorkController netWorkController = Get.find<NetWorkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Obx(
        () => Text(
          netWorkController.connectionStatus.value == 1
              ? 'Wi Fi Connected'
              : netWorkController.connectionStatus.value == 2
                  ? 'Mobile  Internet'
                  : 'No Connection',
          style: TextStyle(fontSize: 20),
        ),
      )),
    );
  }
}
