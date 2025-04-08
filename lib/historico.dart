class Historico {
  List<double> notas;
  double mediaAprovacao;

  Historico({required this.notas, this.mediaAprovacao = 7.0});

  double calcularMedia() {
    if (notas.isEmpty) {
      return 0.0;
    }
    return notas.reduce((a, b) => a + b) / notas.length;
  }

  bool verificarAprovacao() {
    return calcularMedia() >= mediaAprovacao;
  }
}