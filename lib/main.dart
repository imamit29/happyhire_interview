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
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(5, 42, 61, 1), // Primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(5, 42, 61, 1),
          secondary: const Color.fromRGBO(4, 46, 62, 0.10), // Secondary color
        ),
      ),
      home: NavigatorScreen(),
    );
  }
}


