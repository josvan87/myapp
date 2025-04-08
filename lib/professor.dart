class Professor {
  String nome;
  String disciplina;

  Professor({required this.nome, required this.disciplina});

  void ministrarAula() {
    print('$nome está ministrando aula de $disciplina.');
  }
}