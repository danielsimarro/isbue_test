// Esta clase nos devuelve si las resolución es la de una tablet o web
import 'package:flutter_screenutil/flutter_screenutil.dart';

class isDevice {
  bool isTablet() {
    var widthScreen = 1.sw; // sw es el ancho de la pantalla actual
    return widthScreen > 600; // Considera >600 como una tablet
  }
}
