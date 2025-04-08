import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/professor.dart'; 

void main() {
  test('Criar um objeto Professor', () {
    final professor = Professor(nome: 'João Silva', disciplina: 'Matemática');
    expect(professor, isNotNull);
    expect(professor.nome, 'João Silva');
    expect(professor.disciplina, 'Matemática');
  });

  test('Professor ministra aula', () {
    final professor = Professor(nome: 'Maria Souza', disciplina: 'Português');
    expect(() => professor.ministrarAula(), prints('Maria Souza está ministrando aula de Português.\n'));
  });
}