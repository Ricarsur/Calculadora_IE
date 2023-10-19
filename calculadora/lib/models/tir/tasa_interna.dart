import 'dart:math' as math;

class TasaInternaRetorno {

  static double calcularVPN(double tir, double cf1, double cf2, double inversion) {
    return cf1 / math.pow(1 + tir, 1) + cf2 / math.pow(1 + tir, 2) - inversion;
  }
    

  static double calcularTIR(double cf1, double cf2, double inversion) {
    print(cf1);
    print(cf2); 
    print(inversion);
    double epsilon = 0.0001;
    double a = 0.0;
    double b = 0.2; // Establecer límite superior según el escenario

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
}
