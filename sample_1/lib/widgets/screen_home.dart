import 'package:flutter/material.dart';
import 'package:sample_1/widgets/add_student_widget.dart';
import 'package:sample_1/widgets/list_student_widget.dart';
import '../db/functions/db_functions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //clearAllStudents();
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [
          AddStudentWidget(),
          Expanded(
            child: ListStudentsWidget(),
          ),
        ],
      )),
    );
  }
}
