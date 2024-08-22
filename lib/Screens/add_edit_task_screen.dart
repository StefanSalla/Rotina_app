import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/routine_provider.dart';
import '../models/routine.dart';

class AddEditTaskScreen extends StatefulWidget {
  @override
  _AddEditTaskScreenState createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _descricao = '';
  String _horario = '';
  bool _recorrente = false;
  bool _urgencia = false;
  Routine? _editedRoutine;

  @override
  void didChangeDependencies() {
    final routineId = ModalRoute.of(context)!.settings.arguments as String?;
    if (routineId != null) {
      _editedRoutine = Provider.of<RoutineProvider>(context, listen: false)
          .routines
          .firstWhere((routine) => routine.id == routineId);

      _nome = _editedRoutine!.nome;
      _descricao = _editedRoutine!.descricao;
      _horario = _editedRoutine!.horario;
      _recorrente = _editedRoutine!.recorrente;
      _urgencia = _editedRoutine!.urgencia;
    }
    super.didChangeDependencies();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_editedRoutine != null) {
        Provider.of<RoutineProvider>(context, listen: false).updateRoutine(
          _editedRoutine!.id,
          Routine(
            id: _editedRoutine!.id,
            nome: _nome,
            descricao: _descricao,
            horario: _horario,
            recorrente: _recorrente,
            urgencia: _urgencia,
          ),
        );
      } else {
        Provider.of<RoutineProvider>(context, listen: false).addRoutine(
          Routine(
            id: DateTime.now().toString(),
            nome: _nome,
            descricao: _descricao,
            horario: _horario,
            recorrente: _recorrente,
            urgencia: _urgencia,
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editedRoutine == null ? 'Adicionar Tarefa' : 'Editar Tarefa'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) {
                  _nome = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe um nome.';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _descricao,
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) {
                  _descricao = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe uma descrição.';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _horario,
                decoration: InputDecoration(labelText: 'Horário'),
                onSaved: (value) {
                  _horario = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe um horário.';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: Text('Recorrente'),
                value: _recorrente,
                onChanged: (value) {
                  setState(() {
                    _recorrente = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Urgente'),
                value: _urgencia,
                onChanged: (value) {
                  setState(() {
                    _urgencia = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
