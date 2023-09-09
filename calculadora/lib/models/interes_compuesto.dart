import 'dart:math' as math;

class InteresCompuesto {
  InteresCompuesto(
      {this.capital, this.montoCompuesto, this.tasaInteres, this.tiempo});

  final double? capital;
  final double? montoCompuesto;
  final double? tasaInteres;
  final double? tiempo;

  double calcularCapital(tasaInteres, montoCompuesto, tiempo) {
    double porcentaje = tasaInteres / 100;
    double capitalCalculado =
        montoCompuesto / math.pow(1 + porcentaje, tiempo);
    return capitalCalculado;
  }

  double calcularTasaInteres(montoCompuesto, capital, tiempo) {
    double interesCalculado =
        math.pow(montoCompuesto / capital, 1 / tiempo) - 1;
    return interesCalculado;
  }

  double calcularTiempo(tasaInteres, montoCompuesto, capital){
    double porcentaje = tasaInteres / 100; 
    double capitalCalculado = math.log(montoCompuesto) - math.log(capital) / math.log(1+porcentaje);
    return capitalCalculado; 
  }

double calcularMontoCompuesto(tasaInteres, capital) {
  double porcentaje = tasaInteres / 100; 
  double montoCalculado = capital * math.pow(1 + porcentaje, 8);
  return montoCalculado; 
}

}
