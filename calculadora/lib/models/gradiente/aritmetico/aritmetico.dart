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

  static double calcularValorFuturoNominal(
      {required double A,
      required double G,
      required double j,
      required double m,
      required double n}) {
    double resultado = A * ((pow(1 + (j / m), n * m) - 1) / (j / m)) +
        G / (j / m) * ((pow(1 + (j / m), n * m) - 1) / (j / m) - n * m);

    return resultado;
  }

  static double calcularValorEfectiva(
      {required double A,
      required double G,
      required double j,
      required double n}) {
    double numerador = A - ((G / j) * (((pow(1 + j, n) - 1) / j) - n));
    double denominador = ((pow(1 + j, n) - 1) / j);
    double resultado = numerador / denominador;
    return resultado;
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
