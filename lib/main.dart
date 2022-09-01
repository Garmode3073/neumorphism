import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noti/screens/loadingpage.dart';
import 'package:noti/models/userinapp.dart';
import 'package:noti/services/auth.dart';
import 'package:noti/services/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: LoadingPage());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Legal Suites',
            theme: ThemeData(primarySwatch: Colors.blue),
            // home: MyHomePage(title: 'Legal Suites'),

            home: StreamProvider<UserinApp>.value(
              value: AuthServices().userInApp,
              initialData: UserinApp.fromMap({
                "uid": "0",
                "email": "",
                "password": "",
              }),
              child: Wrapper(),
            ),
          );
          // return MaterialApp(
          //   title: 'Legal Suites',
          //   theme: ThemeData(primarySwatch: g.primary),
          //   home: StreamProvider<UserinApp>.value(
          //     value: AuthServices().userInApp,
          //     initialData: null,
          //     child: MainPage(
          //       child: Wrapper(),
          //     ),
          //   ),
          // );
        }
        return MaterialApp(
          title: 'Legal Suites',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: LoadingPage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("hello there"),
      ),
    );
  }
}
