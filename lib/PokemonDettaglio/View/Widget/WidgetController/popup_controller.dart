import 'package:get/get.dart';

class ImagePopUpController extends GetxController{

  Map<String, dynamic> listaSprite = {};

  @override

  void onInit(){


    super.onInit();
  }

   trasformList() {
    List<String>? url;
    listaSprite.forEach((key, value) {
      if (value.runtimeType == String && value != null) {
        url?.addAll(value);
      }
    });
    return url;
  }
}
