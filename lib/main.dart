import 'package:flutter/material.dart';
import 'package:profilmodulu/profil_modulu.dart';


//SALİHA GÖÇERGİ 18010011071
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilModulu(
        title: 'Profil Modülü',
      ),
    );
  }
}
