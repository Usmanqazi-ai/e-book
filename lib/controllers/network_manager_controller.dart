import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_book_store/services/firebase_toast.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManagerController extends GetxController {
  static NetworkManagerController get instance => Get.find();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(
            _updateConnectionStatus as void Function(
                List<ConnectivityResult> event)?)
        as StreamSubscription<ConnectivityResult>;
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;

    if (_connectionStatus.value == ConnectivityResult.none) {
      CustomToast().showToastMsg("No Internet Connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException {
      return false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectionStatus.close();
  }
}
