import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/controllerauth.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/theme_controller.dart';
import 'package:red_periodistas/ui/widgets/appbar.dart';

import 'screen/gps_screen.dart';

class GpsPage extends StatelessWidget {
  final ThemeController controller = Get.find();
  GpsPage({Key? key}) : super(key: key);

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    Controllerauth controluser = Get.find();
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: GpsScreen(),
        ),
      ),
    );
  }
}
