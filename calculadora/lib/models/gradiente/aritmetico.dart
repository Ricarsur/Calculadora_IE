import 'dart:math';

class GradienteGeometrico {//RENOMBRAR PLIS
  static double calcularValorPresente(
      {required double A,
      required double i,
      required int n,
      required double g,
      required bool positivo}) {
    double signo = positivo ? 1 : -1;

    double primeraParte = A * ((pow(1 + i, n) - 1) / (i * pow(1 + i, n)));
    double segundaParte = (g / i) *
        (((pow(1 + i, n) - 1) / (i * pow(1 + i, n))) - (n / pow(1 + i, n)));

    return primeraParte + signo * segundaParte;
  }
}
