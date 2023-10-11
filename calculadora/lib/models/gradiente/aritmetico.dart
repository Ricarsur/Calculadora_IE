import 'dart:math';

class GradienteGeometrico {
  static double calcularPresenteInfinito(
      {required double A,
      required double G,
      required double I,
      required bool positivo}) {
    return positivo ? A / I + G / (I * I) : A / I - G / (I * I);
  }

  static double CalcularValorFuturo(
      {required double A,
      required double i,
      required int n,
      required double g,
      required bool positivo}) {
    double signo = positivo ? 1 : -1;

    double primeraParte = A * ((pow(1 + i, n) - 1) / i);
    double segundaParte = (g / i) * (((pow(1 + i, n) - 1) / i) - n);

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
