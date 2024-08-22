import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/routine_provider.dart';
import 'package:rotina_app/app_routes.dart';


class TaskDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String routineId = ModalRoute.of(context)!.settings.arguments as String;
    final routine = Provider.of<RoutineProvider>(context, listen: false)
        .routines
        .firstWhere((routine) => routine.id == routineId);

    return Scaffold(
      appBar: AppBar(
        title: Text(routine.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(routine.descricao, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Horário: ${routine.horario}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Recorrente: ${routine.recorrente ? "Sim" : "Não"}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Urgência: ${routine.urgencia ? "Alta" : "Baixa"}', style: TextStyle(fontSize: 16)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('Concluir'),
                  onPressed: () {
                    Provider.of<RoutineProvider>(context, listen: false).toggleCompletion(routineId);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.addEditTask,
                      arguments: routineId,
                    );
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text('Excluir'),
                  onPressed: () {
                    Provider.of<RoutineProvider>(context, listen: false).deleteRoutine(routineId);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
