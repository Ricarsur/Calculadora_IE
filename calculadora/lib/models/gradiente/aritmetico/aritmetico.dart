import 'dart:math';

class MGradienteAritmetico {
  static double calcularPresenteInfinito(
      {required double A,
      required double G,
      required double I,
      required bool positivo}) {
    return positivo ? A / I + G / (I * I) : A / I - G / (I * I);
  }

  static double calcularValorFuturo(
      {required double A,
      required double i,
      required int n,
      required double g,
      required bool positivo}) {
    double signo = positivo ? 1 : -1;

    double primeraParte = pow(1 + i, n) - 1;
    primeraParte = primeraParte / i;
    primeraParte = primeraParte * A;

    double segundaParte = (pow(1 + i, n) - 1);
    segundaParte = segundaParte / i;
    segundaParte = segundaParte - n;
    double aux = g / i;
    segundaParte = segundaParte * aux;

    return primeraParte + signo * segundaParte;
  }

  //RENOMBRAR PLIS
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
