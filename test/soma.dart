int sumDigits(int number) {
  if (number < 0) {
    throw ArgumentError("Número negativo não é permitido.");
  }
  int sum = 0;
  String numberString = number.toString();
  for (int i = 0; i < numberString.length; i++) {
    sum += int.parse(numberString[i]);
  }
  return sum;
}

void main() {
  int number1 = 123;
  int number2 = 456;

  print(
    "Soma dos dígitos de $number1: ${sumDigits(number1)}",
  ); // Saída: Soma dos dígitos de 123: 6
  print(
    "Soma dos dígitos de $number2: ${sumDigits(number2)}",
  ); // Saída: Soma dos dígitos de 456: 15

  // Exemplo de tratamento de erro:
  try {
    print("Soma dos dígitos de -789: ${sumDigits(-789)}");
  } catch (e) {
    print(
      "Erro: $e",
    ); 
  }
}
