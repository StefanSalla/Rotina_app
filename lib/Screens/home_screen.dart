import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/routine_provider.dart';
import 'package:rotina_app/app_routes.dart';
import '../components/routine_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routines = Provider.of<RoutineProvider>(context).routines;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas a fazer'),
        actions: [
           ElevatedButton.icon(
            icon: Icon(Icons.check),
            label: Text('home'),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.completedTasks);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: routines.length,
        itemBuilder: (ctx, i) => RoutineTile(
          routine: routines[i],
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.taskDetails,
              arguments: routines[i].id,
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
