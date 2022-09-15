// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Pages/login_page.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // TODO: Handle this case.
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      TextField(
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "email",
                          labelText: "email",
                        ),
                        controller: _email,
                      ),
                      TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: "password",
                          labelText: "password",
                        ),
                        controller: _password,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;

                          final UserCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);
                          print(UserCredential);
                        },
                        child: const Text('Register'),
                      ),
                      TextButton(
                        onPressed: ()  {
                          //await Future.delayed(Duration(milliseconds: 10));
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: const Text('already a user?'),
                      )
                    ],
                  ),
                ),
              );
            default:
              return CircularProgressIndicator().centered().expand();
          }
        },
      ),
    );
  }
}
