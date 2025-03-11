import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Connnectinity {
  Connnectinity._();

  static final Connnectinity instance = Connnectinity._();
  ValueNotifier<bool> isConnect = ValueNotifier(true);
  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    inIntrnetConnect(result);
    Connectivity().onConnectivityChanged.listen(inIntrnetConnect);
  }

  bool inIntrnetConnect(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      isConnect.value = false;
      return false;
    } else if (result.contains(ConnectivityResult.wifi)) {
      isConnect.value = true;
      return true;
    } else if (result.contains(ConnectivityResult.mobile)) {
      isConnect.value = true;
      return true;
    }
    return false;
  }
}
