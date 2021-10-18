import 'package:flutter/material.dart';
import 'package:flutter_getx_internet_check/app/networks/bindings/network_binding.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: NetWorkBinding(),
    ),
  );
}
