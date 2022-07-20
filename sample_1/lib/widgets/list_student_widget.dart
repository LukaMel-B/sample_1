import 'package:flutter/material.dart';
import 'package:sample_1/db/functions/db_functions.dart';
import 'package:sample_1/db/model/data_model.dart';

class ListStudentsWidget extends StatefulWidget {
  const ListStudentsWidget({Key? key}) : super(key: key);

  @override
  State<ListStudentsWidget> createState() => _ListStudentsWidgetState();
}

class _ListStudentsWidgetState extends State<ListStudentsWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, List<StudentModel> studentList,
          Widget? child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = studentList[index];
              return ListTile(
                leading: Text(data.id.toString()),
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_rounded),
                  onPressed: () {
                    deleteStudent(StudentModel(name: data.name, age: data.age),
                        index, data.id!);
                  },
                  color: const Color.fromARGB(255, 182, 4, 4),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: studentList.length);
      },
      valueListenable: studentListNotifier,
    );
  }
}
