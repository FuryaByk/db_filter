import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ogr_islemleri.dart';
import 'ogr_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC5MdoILltOr0YAj8nYK05IBEYOhPgLchY",
        appId: "flutter-fire-app-100c5",
        messagingSenderId: "581050975093",
        projectId: "flutter-fire-app-100c5"),
  );
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DB Filter'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OgrenciIslemleri()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Öğrenci İşlemleri',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                color: Colors.teal,
                elevation: 10,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OgrenciListele()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Öğrencileri Filtrele',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                color: Colors.teal,
                elevation: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
