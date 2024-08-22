class Routine {
  final String id;
  String nome;
  String descricao;
  String horario;
  bool recorrente;
  final bool urgencia;
  bool concluido;

  Routine({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.horario,
    required this.recorrente,
    required this.urgencia,
    this.concluido = false,
  });
}
