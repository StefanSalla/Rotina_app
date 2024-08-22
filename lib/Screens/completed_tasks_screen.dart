import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotina_app/components/routine_tile.dart';
import '../providers/routine_provider.dart';
import 'package:rotina_app/app_routes.dart';

class CompletedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final completedRoutines = Provider.of<RoutineProvider>(context).completedRoutines;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas Concluídas'),
        actions: [
         ElevatedButton.icon(
            icon: Icon(Icons.home),
            label: Text('home'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: completedRoutines.length,
        itemBuilder: (ctx, i) => RoutineTile(
          routine: completedRoutines[i],
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.taskDetails,
              arguments: completedRoutines[i].id,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addEditTask);
        },
      ),
    );
  }
}
