class Atividade {
  final String date;
  final String descricao;

  Atividade({required this.date, required this.descricao});

  factory Atividade.fromJson(Map<String, dynamic> json) {
    return Atividade(
      date: json['date'], 
      descricao: json['descricao']
    );
  }
}
