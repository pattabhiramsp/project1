import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'food.dart';

//import 'Food.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TextEditingController username = TextEditingController();
  //TextEditingController password = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'ONEMART',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid Password!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: InkWell(
                onTap: () async {
                  Map<String, dynamic> jsonMap = {
                    "login": username.text,
                    "password": password.text,
                  };
                  final response = await http.post(
                      Uri.parse('https://hrmsprime.com/session/auth/login'),
                      body: jsonEncode(jsonMap),
                      headers: {"Content-type": "application/json"});

                  print(jsonDecode(response.body));

                  // Map<String, dynamic> datas = {
                  //   "login": username.text,
                  //   "password": password.text
                  // };

                  //var uri =
                  // Uri.parse("https://hrmsprime.com/session/auth/login");
                  //print(uri);
                  //var res = await http.post(uri,
                  //headers: {"Content-type": "application/json"},
                  //body: jsonEncode(jsonMap));
                  //print(res);
                  //var r = jsonDecode(res.body);
                  //print(r);
                  login();
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    if (password.text.isNotEmpty && username.text.isNotEmpty) {
      print("hello");
      // var response = '';
      // await http.post(Uri.parse('https://hrmsprime.com/session/auth/login'),
      //     body: ({
      //       "login": username.text,
      //       "password": password.text,
      //     }));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Food()),
      );
      // if (response.statusCode == 200) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => Food()),
      //   );
      // } else {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text('Invalid Credentials.')));
      // }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('It should not be blank, please enter the details.')));
    }
  }
}
