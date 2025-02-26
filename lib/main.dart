import 'package:flutter/material.dart';
import 'package:happyhire_interview/provider/UserProvider.dart';
import 'package:happyhire_interview/screens/NavigatorScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorScreen(),
    );
  }
}


