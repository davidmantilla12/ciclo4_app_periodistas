import 'package:get/get.dart';

class Useroffercontroller extends GetxController {
  //Controlador para reacciones

  var _reacciones = 0.obs;
  var _reaccionado = false.obs;
  int get cantreacciones => _reacciones.value;
  bool get reaccionado => _reaccionado.value;

  reaccionar() {
    if (_reaccionado.value) {
      _reacciones.value -= 1;
      _reaccionado.value = false;
    } else {
      _reacciones.value += 1;
      _reaccionado.value = true;
    }
    _reacciones.refresh();
    _reaccionado.refresh();
  }

  // Controlador para compartidas

  final _compartidas = 0.obs;
  int get cantcompartidas => _compartidas.value;

  compartir() {
    _compartidas.value += 1;
    _compartidas.refresh();
  }

  // Controlador para comentarios

  var _comentar = 0.obs;
  int get cantcomentarios => _comentar.value;

  comentar() {
    _comentar.value += 1;
  }
}
