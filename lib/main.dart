import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/ui/app.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/chats_controller.dart';
import 'domain/use _cases/controllers/connectivity.dart';
import 'domain/use _cases/controllers/controllerauth.dart';
import 'domain/use _cases/controllers/firestore.dart';
import 'domain/use _cases/controllers/userofferscontroller.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controllerauth());
  Get.put(Useroffercontroller());
  Get.put(chatscontroller());
  Get.put(ControllerFirestore());
  Get.put(ConnectivityController());
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  Connectivity().onConnectivityChanged.listen((connectivityStatus) {
    connectivityController.connectivity = connectivityStatus;
  });
  runApp(const App());
}
