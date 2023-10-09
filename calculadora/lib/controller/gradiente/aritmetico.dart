class ResultadoController {
  double _resultado = 0;

  double get resultado => _resultado;

  void actualizarResultado(double nuevoResultado) {
    _resultado = nuevoResultado;
  }
}
