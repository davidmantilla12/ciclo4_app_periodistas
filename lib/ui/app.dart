import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/location.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/permissions.dart';
import 'package:red_periodistas/domain/use%20_cases/controllers/theme_controller.dart';
import 'package:red_periodistas/domain/use%20_cases/permission_management.dart';
import 'package:red_periodistas/domain/use%20_cases/theme_management.dart';
import 'package:red_periodistas/ui/pages/authentication/auth_page.dart';
import 'package:red_periodistas/ui/pages/content/content_page.dart';
import 'package:red_periodistas/ui/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Dependency injection: setting up state management
  late final ThemeController controller = Get.put(ThemeController());
  // Theme management
  late final ThemeManager manager = ThemeManager();
  bool isLoaded = false;

  Future<void> initializeTheme() async {
    controller.darkMode = await manager.storedTheme;
    setState(() => isLoaded = true);
  }

  // Este widget es la raíz de su aplicación.
  @override
  void initState() {
    ever(controller.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    PermissionsController permissionsController =
        Get.put(PermissionsController());
    permissionsController.permissionManager = PermissionManager();
    Get.lazyPut(() => LocationController());
    initializeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const CircularProgressIndicator()
        : GetMaterialApp(
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
