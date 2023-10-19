import 'dart:math' as math;

class TasaInternaRetorno {
  static double calcularTIR(double cf1, double cf2, double inversion) {
    print(cf1);
    print(cf2);
    print(inversion);
    double epsilon = 0.0001;
    double a = 0.0;
    double b = 0.5; // Establecer límite superior según el escenario

    double tir = (a + b) / 2;

    double vpn = calcularVPN(tir, cf1, cf2, inversion);

    while ((b - a).abs() > epsilon) {
      if (vpn > 0) {
        a = tir;
      } else {
        b = tir;
      }

      tir = (a + b) / 2;
      vpn = calcularVPN(tir, cf1, cf2, inversion);
    }

    return tir;
  }

  static double calcularVAN(double tasaDescuento, List<double> flujosDeEfectivo, double inversion) {
    double van = -inversion;

    for (int t = 0; t < flujosDeEfectivo.length; t++) {
      van += flujosDeEfectivo[t] / math.pow(1 + tasaDescuento, t + 1);
    }

    return van;
  }

  static double calcularVPN(double tir, double cf1, double cf2, double inversion) {
    if (cf2 == 0) {
      // Caso de un solo año
      return cf1 / math.pow(1 + tir, 1) - inversion;
    } else {
      // Caso de dos años
      return cf1 / math.pow(1 + tir, 1) + cf2 / math.pow(1 + tir, 2) - inversion;
    }
  }
}
