import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/chats_controller.dart';
import 'package:red_periodistas/ui/app.dart';

import 'domain/use _cases/controllers/userofferscontroller.dart';

void main() {
  Get.put(Useroffercontroller());
  Get.put(chatscontroller());
  runApp(const App());
}
