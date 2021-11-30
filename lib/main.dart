import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/ui/app.dart';

import 'domain/use _cases/controllers/userofferscontroller.dart';

void main() {
  Get.put(Useroffercontroller());
  runApp(const App());
}
