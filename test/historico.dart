import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/historico.dart'; 

void main() {
  test('Calcular média de notas', () {
    final historico = Historico(notas: [8.0, 9.0, 7.5]);
    expect(historico.calcularMedia(), closeTo(8.166666666666666, 0.001));
  });

  test('Aluno aprovado com média maior que a média de aprovação padrão', () {
    final historico = Historico(notas: [8.0, 9.0, 7.5]);
    expect(historico.verificarAprovacao(), isTrue);
  });

  test('Aluno reprovado com média menor que a média de aprovação padrão', () {
    final historico = Historico(notas: [5.0, 6.0, 4.5]);
    expect(historico.verificarAprovacao(), isFalse);
  });

  test('Aluno aprovado com média igual à média de aprovação definida', () {
    final historico = Historico(notas: [7.0, 7.0, 7.0], mediaAprovacao: 7.0);
    expect(historico.verificarAprovacao(), isTrue);
  });

  test('Aluno reprovado com média menor que a média de aprovação definida', () {
    final historico = Historico(notas: [6.5, 6.5, 6.5], mediaAprovacao: 7.0);
    expect(historico.verificarAprovacao(), isFalse);
  });

  test('Calcular média de histórico vazio', () {
    final historico = Historico(notas: []);
    expect(historico.calcularMedia(), 0.0);
  });
}