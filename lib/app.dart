import 'package:flutter/material.dart';
import 'screens/help.dart';
import 'screens/web_view_container.dart';
import 'screens/settings.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fn Browser',
      routes: {
        '/settings': (content) => SettingsPage(),
        '/help': (content) => HelpScreen(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: "Arial",
          textTheme: TextTheme(
              button: TextStyle(color: Colors.white, fontSize: 18.0),
              headline6: TextStyle(color: Colors.red))),
      home: MyApp(),
    );
  }
}
