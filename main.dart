import 'package:assignment/api.dart';
import 'package:assignment/event_page.dart';
import 'package:assignment/food.dart';
import 'package:assignment/locator.dart';
import 'package:assignment/login_screen.dart';
import 'package:assignment/calendar.dart';
import 'package:flutter/material.dart';

import 'downloader.dart';

void main() => runApp(login());

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login UI",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login Screen",
          ),
        ),
        body: LoginScreen(),
      ),
    );
  }
}
