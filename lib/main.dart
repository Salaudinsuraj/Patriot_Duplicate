import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {

  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: 'Tetrazurry Manaseppppppp PendulumP',
    theme: ThemeData(
            primarySwatch: Colors.cyan,
    ),
      home: HomePage(),
  )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patriot Duplicate"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                ),
            ),

            Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Enter your password",
                  ),
                ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                );
                if (kDebugMode) {
                  print(userCredential);
                }
              },
              child: Text("Register"),
            ),
        ],
        ),
      ),

    );
  }
}
