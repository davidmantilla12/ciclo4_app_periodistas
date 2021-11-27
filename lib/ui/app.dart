import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/ui/pages/authentication/auth_page.dart';
import 'package:red_periodistas/ui/pages/content/content_page.dart';
import 'package:red_periodistas/ui/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // Este widget es la raíz de su aplicación.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Query News',
      // Quitamos el banner DEBUG
      debugShowCheckedModeBanner: false,
      // Establecemos el tema claro
      theme: MyTheme.ligthTheme,
      // Establecemos el tema oscuro
      darkTheme: MyTheme.darkTheme,
      // Por defecto tomara la seleccion del sistema
      themeMode: ThemeMode.system,
      home: const AuthenticationPage(),
      // ---------------------------------------
      // 1. Crea las rutas posibles para nuestra app
      // ---------------------------------------
      routes: {
        '/auth': (context) => const AuthenticationPage(),
        '/content': (context) => const ContentPage(),
      },
    );
  }
}
