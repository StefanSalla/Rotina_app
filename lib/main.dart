import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotina_app/Screens/singin_screen.dart';
import 'package:rotina_app/Screens/singup_screen.dart';
import './providers/routine_provider.dart';
import './screens/home_screen.dart';
import './screens/completed_tasks_screen.dart';
import './screens/task_details_screen.dart';
import './screens/add_edit_task_screen.dart';
import 'app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoutineProvider(),
      child: MaterialApp(
        title: 'Gerenciador de Tarefas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.singin,
        routes: {
          AppRoutes.singin: (ctx) => SinginScreen(),
          AppRoutes.singup: (ctx) => SingupScreen(),
          AppRoutes.home: (ctx) => HomeScreen(),
          AppRoutes.completedTasks: (ctx) => CompletedTasksScreen(),
          AppRoutes.taskDetails: (ctx) => TaskDetailsScreen(),
          AppRoutes.addEditTask: (ctx) => AddEditTaskScreen(),
        },
      ),
    );
  }
}
