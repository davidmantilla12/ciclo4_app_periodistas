import 'package:get/get.dart';

class chatscontroller extends GetxController {
  var _chatiniciado = false.obs;
  bool get chat => _chatiniciado.value;

  var _mensajespendientes = 0.obs;
  int get cantmensajes => _mensajespendientes.value;

  enviarMensaje() {}

  leermensajesPendientes() {
    _mensajespendientes.value = (10);
  }
}
