void main() {

  List<double> notas = [8.5, 4.5,  6.3, 9.8 ];

  
  if (notas.isNotEmpty) {
 
    double soma = notas.reduce((valor, elemento) => valor + elemento);

    double media = soma / notas.length;

    print("A média das notas é: $media");
    
  } else {
    print("Nenhuma nota foi fornecida.");
  }
}