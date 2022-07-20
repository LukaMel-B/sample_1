import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_1/db/model/data_model.dart';
import 'package:sample_1/widgets/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
  // if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
  //   Hive.registerAdapter(StudentModelAdapter());
  // } else {
  //   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
  // }
}
// void main() {
//   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenHome();
  }
}
