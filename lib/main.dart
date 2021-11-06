import 'package:flutter/material.dart';
import 'package:news_app/providers/auth_provider.dart';
import 'package:news_app/providers/user_provider.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/screens/sign_in.dart';
import 'package:news_app/screens/sign_up.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider (create: (_)=> AuthProvider()),
    ChangeNotifierProvider(create: (_)=>UserProvider())
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),

    )
    );
  }
}
