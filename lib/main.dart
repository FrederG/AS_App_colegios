import 'package:a/firebase_options.dart';
import 'package:a/screens/Iniciop.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
=======
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  const MyApp({super.key});
=======
  const MyApp({Key? key}) : super(key: key);
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      theme: ThemeData(primarySwatch: Colors.blue),
=======
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
