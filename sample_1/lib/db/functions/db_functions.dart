// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_1/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
Future<void> addStudent(StudentModel value) async {
  //studentListNotifier.value.add(value);
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);
  await studentDB.put(_id, value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> clearAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentDB.clear();
}

Future<void> deleteStudent(StudentModel db, int index, int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  //studentDB.putAt(index, db);
  studentDB.delete(id);
  getAllStudents();
}
