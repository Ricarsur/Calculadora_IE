class ResultadoAritmeticoController {
  double _resultadoPositivo = 0;
  double _resultadoNegativo = 0;
  double _resultadoNominal = 0;

  double get resultadoPositivo => _resultadoPositivo;
  double get resultadoNegativo => _resultadoNegativo;
  double get resultadoNominal => _resultadoNominal;

  void actualizarResultadoPositivo(double nuevoResultado) {
    _resultadoPositivo = nuevoResultado;
  }

  void actualizarResultadoNegativo(double nuevoResultado) {
    _resultadoNegativo = nuevoResultado;
  }

  void actualizarResultadoNomial(double nuevoNominal){
    _resultadoNominal = nuevoNominal;
  }
}
