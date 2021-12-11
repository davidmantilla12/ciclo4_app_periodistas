import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Controllerauth extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<dynamic> _usuarior = "Sin Registro".obs;

  String get userf => _usuarior.value;

  Future<void> registrarEmail(dynamic _email, dynamic _passw) async {
    try {
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: _email, password: _passw);

      _usuarior.value = usuario.user!.email;
      Get.showSnackbar(
        GetBar(
          message: "registro satisfactorio",
          duration: const Duration(seconds: 2),
        ),
      );

      print(usuario);

      return Future.value(true);
      // return Future.value(true);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetBar(
          message: e.code,
          duration: const Duration(seconds: 2),
        ),
      );
      if (e.code == 'weak-password') {
        return Future.error('La contraseña ingresada es muy débil.');
      } else if (e.code == 'email-already-in-use') {
        print('Correo ya Existe');

        return Future.error('Ya existe un usuario con ese correo.');
      }
    } catch (e) {
      print(e);
      Get.showSnackbar(
        GetBar(
          message: e.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> ingresarEmail(dynamic email, dynamic pass) async {
    try {
      UserCredential usuario =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      _usuarior.value = usuario.user!.email;
      Get.showSnackbar(
        GetBar(
          message: "Bienvenido " + _usuarior.value,
          duration: const Duration(seconds: 2),
        ),
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetBar(
          message: e.code,
          duration: const Duration(seconds: 2),
        ),
      );
      if (e.code == 'user-not-found') {
        print('Correo no encontrado');
        return Future.error('user-not-found');
      } else if (e.code == 'wrong-password') {
        print('Password incorrecto');
        return Future.error('wrong-password');
      }
    }
  }
}
