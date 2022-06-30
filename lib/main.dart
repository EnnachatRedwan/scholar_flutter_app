import 'package:flutter/material.dart';

import './screens/login.dart';
import './screens/home.dart';
import './screens/register.dart';
import './screens/search_screen.dart';
import './screens/add_post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat_Alternates'
      ),
      home: const LoginScreen(),
      routes: {
        LoginScreen.routeName:(context) => const LoginScreen(),
        RegisterScreen.routeName:(context) => const RegisterScreen(),
        HomeScreen.routeName:(context) => const HomeScreen(),
        SearchScreen.routeName:(context) => const SearchScreen(),
        AddPostScreen.routeName:(context) => const AddPostScreen()
      },
    );
  }
}