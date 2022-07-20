import 'package:flutter/material.dart';
import 'package:sample_1/db/functions/db_functions.dart';
import 'package:sample_1/db/model/data_model.dart';

class AddStudentWidget extends StatefulWidget {
  const AddStudentWidget({Key? key}) : super(key: key);

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'age',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonClicked();
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Student'))
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final String name = _nameController.text.trim();
    final String age = _ageController.text.trim();
    if (name.isEmpty || age.isEmpty) {
      return;
    }
    //print('$_name $age');
    final student = StudentModel(name: name, age: age);
    addStudent(student);
    //getAllStudents();
  }
}
