void main() {
  // Lista com as 6 notas predefinidas
  List<double> notas = [8.5, 4.5,  6.3, 9.8 ];

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