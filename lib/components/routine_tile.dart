import 'package:flutter/material.dart';
import '../models/routine.dart';

class RoutineTile extends StatelessWidget {
  final Routine routine;
  final Function onTap;

  RoutineTile({required this.routine, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(routine.nome),
      subtitle: Text('${routine.descricao} - ${routine.horario}'),
      trailing: routine.urgencia ? Icon(Icons.priority_high, color: Colors.red) : null,
      onTap: () => onTap(),
    );
  }
}
