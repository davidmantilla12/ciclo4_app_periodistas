import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Controllerauth extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late Rx<dynamic> _usuarior = "Sin Registro".obs;
  late Rx<dynamic> _uid = "".obs;
  late Rx<dynamic> _name = "Anonimo".obs;
  late Rx<dynamic> _photo = "".obs;

  RxString _nombreobtenido = "".obs;

  CollectionReference _nombres =
      FirebaseFirestore.instance.collection("Usuarios");

  String get userf => _usuarior.value;
  String get photorul => _photo.value;
  String get uid => _uid.value;
  String get name => _name.value;

  Future<void> registrarEmail(
      dynamic _email, dynamic _passw, dynamic name) async {
    try {
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: _email, password: _passw);

      _name.value = name;
      _usuarior.value = usuario.user!.email;
      _uid.value = usuario.user!.uid;
      await _db
          .collection('Usuarios')
          .doc(_uid.value.toString())
          .set(<String, dynamic>{'nombre': name.toString()});
      Get.showSnackbar(
        GetSnackBar(
          message: "registro satisfactorio" + name.toString(),
          duration: const Duration(seconds: 1),
        ),
      );

      return Future.value(true);
      // return Future.value(true);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.code,
          duration: const Duration(seconds: 1),
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
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  Future<void> ingresarEmail(dynamic email, dynamic pass) async {
    try {
      UserCredential usuario =
          await auth.signInWithEmailAndPassword(email: email, password: pass);

      DocumentSnapshot documento = await _nombres.doc(usuario.user!.uid).get();
      _uid.value = usuario.user!.uid;
      _name.value = documento['nombre'];
      Get.offNamed('/content');
      Get.showSnackbar(
        GetSnackBar(
          message: "Bienvenido " + _name.value,
          duration: const Duration(seconds: 1),
        ),
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.code,
          duration: const Duration(seconds: 2),
        ),
      );
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no encontrado');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña errada');
      }
    } catch (e) {
      print(e);
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> ingresarGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
// Obtain the auth details from the request

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential usuario =
          await FirebaseAuth.instance.signInWithCredential(credential);

      _usuarior.value = usuario.user!.email;
      _uid.value = usuario.user!.uid;
      _name.value = usuario.user!.displayName;
      Get.showSnackbar(
        GetSnackBar(
          message: "Bienvenido " + _name.value,
          duration: const Duration(seconds: 2),
        ),
      );
      return Future.value(true);
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
      return Future.error('Error');
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _usuarior.value = "Sin Registro";
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> getName(String uid) async {
    DocumentSnapshot documento = await _nombres.doc(uid).get();
    String nombre = documento['nombre'];
    return nombre;
  }
}
