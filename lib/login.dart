import 'package:apihandle/reuseables.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mycont1 = TextEditingController();
  TextEditingController mycont2 = TextEditingController();
  String testuname = "";
  String testPass = "";
  final String uname = "affan.syed001@gmail.com";
  final String password = "saffu";
  bool _isemailvalid = false;
  String _txtfields = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              icon: const Icon(Icons.arrow_back_ios)),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              sbv(80),
              TextField(
                  onChanged: (value) {
                    setState(() {
                      _isemailvalid = Validity.isEmailValid(value);
                    });
                  },
                  controller: mycont1,
                  decoration: myinputdec1(!_isemailvalid, 'Email')),
              const SizedBox(height: 30),
              TextField(
                  onChanged: (value) {
                    setState(() {
                      _txtfields = mycont2.text;
                    });
                  },
                  obscureText: true,
                  controller: mycont2,
                  decoration: myinputdec1(_txtfields.length < 8, 'Password')),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Forgot your Password?"),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/frgtpass');
                    },
                    icon: const Icon(
                      Icons.arrow_right_alt,
                      color: Color.fromARGB(255, 252, 64, 43),
                      size: 40,
                    ),
                  )
                ],
              ),
              sbv(30),
              ElevatedButton(
                onPressed: button,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 252, 64, 43),
                    minimumSize: const Size.fromHeight(40)),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              sbv(150),
              const Text(
                'Or Login with Social Account',
                //style: TextStyle(color: Color.fromARGB(255, 252, 64, 43)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(2.0)),
                    child: IconButton(
                        iconSize: 50,
                        onPressed: () {},
                        icon: const Icon(Icons.g_mobiledata)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(2.0)),
                    child: IconButton(
                        iconSize: 50,
                        onPressed: () {},
                        icon: const Icon(Icons.facebook)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void button() {
    if (mycont1.text != uname && mycont2.text != password) {
      showAlert(context, "Invalid Credentials",
          'Username and Password are Invalid', true, [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('Ok'))
      ]);
    } else {
      Navigator.pushNamed(context, '/hmscreen');
    }
  }
}
