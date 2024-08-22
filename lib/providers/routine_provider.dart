import 'package:flutter/material.dart';
import '../models/routine.dart';

class RoutineProvider with ChangeNotifier {
  List<Routine> _routines = [
    Routine(id: '1',nome: 'Acordar', descricao: 'Acordar para começar o dia', horario: '07:00',recorrente:  true,urgencia:  true,concluido:  true),
    Routine(id: '2',nome: 'Arrumar a cama', descricao: 'Arrumar a cama sempre que acordar', horario: '07:10', recorrente:  true, urgencia: false, concluido: false),
    Routine(id: '3',nome: 'Escovar os dentes', descricao: 'Escovar os dentes para manter uma boa higiene durante o dia', horario: '07:20', recorrente:  true,urgencia: true, concluido: false),
  ];

  List<Routine> get routines => _routines.where((routine) => !routine.concluido).toList();

  List<Routine> get completedRoutines => _routines.where((routine) => routine.concluido).toList();

  void addRoutine(Routine routine) {
    _routines.add(routine);
    notifyListeners();
  }

  void updateRoutine(String id, Routine newRoutine) {
    final routineIndex = _routines.indexWhere((routine) => routine.id == id);
    if (routineIndex >= 0) {
      _routines[routineIndex] = newRoutine;
      notifyListeners();
    }
  }

  void deleteRoutine(String id) {
    _routines.removeWhere((routine) => routine.id == id);
    notifyListeners();
  }

  void toggleCompletion(String id) {
    final routineIndex = _routines.indexWhere((routine) => routine.id == id);
    if (routineIndex >= 0) {
      _routines[routineIndex].concluido = !_routines[routineIndex].concluido;
      notifyListeners();
    }
  }
}
