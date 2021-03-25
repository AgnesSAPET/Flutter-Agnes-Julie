import 'package:validationdwm14/constants/firebase.dart';
import 'package:validationdwm14/routes.dart';
import 'package:validationdwm14/screens/error.dart';
import 'package:validationdwm14/screens/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              darkTheme: ThemeData(
                accentColor: Colors.blue,
                brightness: Brightness.dark,
                primaryColor: Colors.teal,
                scaffoldBackgroundColor: const Color(0xFF1F1E23),
              ),
              routes: routes,
              initialRoute: isLogged() != null ? '/home' : '/login',
            );
          }

          return LoadingScreen();
        });
  }
}
