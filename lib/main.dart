import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/pages/signup.dart';



void main() async {
  // final storage = FirebaseStorage.instance;
  WidgetsFlutterBinding.ensureInitialized(

  );
  await Firebase.initializeApp(

      options: FirebaseOptions(
          apiKey: "AIzaSyAWyI1MQfKyW3uEobhMCo5I8orYyr6xdxc",
          projectId: "wallify-66b29",
          messagingSenderId: "219002192696",
          appId: "1:219002192696:android:3c903e5d17c15d1fe7f7cd",
          storageBucket: "wallify-66b29.appspot.com"
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUp()
    );
  }
}

