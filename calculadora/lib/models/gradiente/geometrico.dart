import 'dart:math';

class GradienteGeometrio {
  //VALOR FUTURO
  static double ValorFuturoGeoAnticipado_GdiferentI(
      {required A, required G, required I, required N}) {
    double primeraParte = (A * (pow(1 - G, N) - pow(1 + I, N)) * (1 + I));
    double segundaParte = (G - I);
    return primeraParte / segundaParte;
  }

  static double ValorFuturoGeoAnticipado_GigualI(
      {required A, required G, required I, required N}) {
    double primeraParte = (N * A * pow(1 + I, N));
    return primeraParte;
  }

  static double ValorFuturoGeoVencido_GdiferentI(
      {required A, required G, required I, required N}) {
    double primeraParte = (A * (pow(1 - G, N) - pow(1 + I, N)));
    double segundaParte = (G - I);
    return primeraParte / segundaParte;
  }

  static double ValorFuturoGeoVencido_GigualI(
      {required A, required G, required I, required N}) {
    double primeraParte = (N * A * pow(1 + I, N));
    return primeraParte / (1 + I);
  }

//VALOR INFINITO
  static double ValorInfinito({required A, required I, required G}) {
    double primeraParte = A / (I * G);
    return primeraParte;
  }

  //VALOR PRESENTE
  static double ValorPresenteGeometricoAnticipado_GdiferentI(
      {required A, required G, required I, required N}) {
    double primeraParte = (A * (pow(1 - G, N) * pow(1 + I, -N) - 1) * (1 + I));
    double segundaParte = (G - I);
    return primeraParte / segundaParte;
  }

  static double ValorPresenteGeometricoAnticipado_GigualI(
      {required A, required N}) {
    return N * A;
  }

  static double ValorPresenteGeometricoVencido_GdiferentI(
      {required A, required G, required I, required N}) {
    double primeraParte = (A * (pow(1 - G, N) * pow(1 + I, -N) - 1));
    double segundaParte = (G - I);
    return primeraParte / segundaParte;
  }

  static double ValorPresenteGeometricoVencido_GigualI(
      {required A, required G, required I, required N}) {
    double primeraParte = (N * A);
    double segundaParte = primeraParte / (1 + I);
    return segundaParte;
  }
}
