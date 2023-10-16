class ResultadoGeomtricoController {
  double _resultado = 0;

  double get resultado => _resultado;

  void actualizarResultadoPositivo(double nuevoResultado) {
    _resultado = nuevoResultado;
  }
}
