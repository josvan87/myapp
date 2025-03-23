void main() {
  // Lista com as 6 notas predefinidas
  List<double> notas = [8, 4,  6, 9 ];

  // Verifica se a lista não está vazia
  if (notas.isNotEmpty) {
    // Calcula a soma das notas
    double soma = notas.reduce((valor, elemento) => valor + elemento);

    // Calcula a média das notas
    double media = soma / notas.length;

    // Imprime a média
    print("A média das notas é: $media");
  } else {
    print("Nenhuma nota foi fornecida.");
  }
}