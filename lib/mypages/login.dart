import 'package:final_flutterr/mypages/home.dart';
import 'package:final_flutterr/service/firebase_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 8, 58, 100),
              Colors.amberAccent.shade400,
              Colors.cyan
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                onPressed: () async {
                  await FirebaseService().signInWithGoogle();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                style: buttonstyle(),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login with Gmail",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )
                    ],
                  ),
                )),
          ))),
    );
  }

  ButtonStyle buttonstyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.black26;
      }
      return Colors.white;
    }));
  }
}
