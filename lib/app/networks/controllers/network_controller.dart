import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetWorkController extends GetxController {
  //TODO: Implement HomeController

  var connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscribtion;
  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscribtion=_connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result!);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar("Network Error", "Failed to get network Connection");
        break;
    }
  }

  @override
  void onClose() {
    _connectivitySubscribtion.cancel();

  }
}
