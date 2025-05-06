import 'dart:async'; // Importa a biblioteca para trabalhar com operações assíncronas (como Futures e Streams)
import 'dart:math';   // Importa a biblioteca para funcionalidades matemáticas, incluindo geração de números aleatórios

/// Simula uma operação assíncrona para pesquisar e calcular a média das notas de um aluno.
/// Retorna um Future que eventualmente conterá a média calculada.
Future<double> pesquisarMedia(String nome) async {

  // Simula um atraso aleatório para representar o tempo de uma operação assíncrona 
  //(e.g., busca em banco de dados).
  await Future.delayed(Duration(milliseconds: Random().nextInt(1000)));

  // Gera uma lista aleatória de notas (entre 2 e 6 notas, cada uma entre 0.0 e 10.0).
  List<double> notas = List.generate(Random().nextInt(5) + 2, (_) => Random().nextDouble() * 10);

  // Verifica se a lista de notas está vazia e retorna 0.0 se estiver.
  if (notas.isEmpty) {
    return 0.0;
  }

  // Calcula a média das notas utilizando a função reduce para somar todos os elementos e dividindo pelo número de notas.
  double media = notas.reduce((a, b) => a + b) / notas.length;

  // Imprime no console o nome do aluno, suas notas e a média calculada.
  print('$nome: Notas = $notas, Média = $media');

  // Retorna a média calculada.
  return media;
}

/// Cria uma Stream que itera sobre uma lista de nomes de alunos e, para cada um,
/// chama a função assíncrona pesquisarMedia para obter a média.
/// Emite uma string formatada com o nome do aluno e sua média para a Stream.
Stream<String> calcularMedias(List<String> nomes) async* {

  // Itera sobre cada nome na lista de alunos fornecida.
  for (String nome in nomes) {

    // Chama a função assíncrona pesquisarMedia para obter a média do aluno atual.
    double media = await pesquisarMedia(nome);

    // Emite um valor para a Stream. A palavra-chave 'yield' pausa a execução desta função,
    // envia o valor para o ouvinte da Stream e depois retoma a execução para o próximo aluno.
    yield '$nome - Média: ${media.toStringAsFixed(2)}';
  }
  // Quando o loop termina, a Stream é automaticamente fechada.
}

/// Função principal que demonstra o uso da Stream calcularMedias.
void main() async {

  // Cria uma lista de nomes de alunos.
  List<String> alunos = ['Ana', 'Pedro', 'Carla', 'Lucas'];

  // Chama a função calcularMedias para obter uma Stream de resultados de médias.
  Stream<String> streamMedias = calcularMedias(alunos);

  // Utiliza um loop 'await for' para consumir os valores emitidos pela Stream de forma assíncrona.
  // O loop espera por cada valor emitido pela Stream antes de executar o código dentro dele.
  await for (String resultado in streamMedias) {
    
    // Imprime no console cada resultado (nome do aluno e sua média) emitido pela Stream.
    print('Resultado da Stream: $resultado');
  }

  // Imprime uma mensagem quando todos os valores da Stream foram processados e a Stream foi fechada.
  print('Processamento da Stream concluído.');
}