import 'package:apihandle/frgtpass.dart';
import 'package:apihandle/homescreen.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:apihandle/reuseables.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(0, 255, 255, 255)),
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: const Color.fromARGB(246, 255, 255, 255)),
        useMaterial3: true,
      ),
      // initialRoute: '/signup', // Set initial route to signup page
      routes: {
        '/signup': (context) => const Signup(),
        '/login': (context) => const LoginPage(title: 'Login'),
        '/frgtpass': (context) => const FrgtPassPage(title: 'Forgot Password'),
        '/rstpass': (context) => const RstPassPage(
              title: 'Reset Pass',
            ),
        '/hmscreen': (context) => const Homescreen(),
      },
      home: const SignupPage(title: 'Sign Up'),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController mycont1 = TextEditingController();
  TextEditingController mycont2 = TextEditingController();
  TextEditingController mycont3 = TextEditingController();
  late TextField nametxtfield;
  bool _isemailvalid = false;
  //String _txtfields = "";
  bool _ispassvalid = true;
  bool _empty = true;
  String testname = "";
  String testemail = "";
  String testPass = "";

/////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              sbv(80),
              nametxtfield = TextField(
                  onChanged: (value) {
                    setState(() {
                      _empty = Validity.isfieldEmpty(mycont1.text);
                    });
                  },
                  controller: mycont1,
                  decoration: myinputdec1(_empty, 'Name')),
              const SizedBox(height: 30),
              TextField(
                  onChanged: (value) {
                    // Check email validity here and update isEmailValid accordingly
                    setState(() {
                      _isemailvalid = Validity.isEmailValid(mycont2.text);
                    });
                  },
                  controller: mycont2,
                  decoration: myinputdec1(!_isemailvalid, 'Email')),
              const SizedBox(height: 30),
              TextField(
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _ispassvalid = Validity.isPassValid(mycont3.text);
                    });
                  },
                  obscureText: true,
                  controller: mycont3,
                  decoration: myinputdec1(_ispassvalid, 'Password')),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Already have an Account,'),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage(
                                    title: 'Login',
                                  )));
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
              myelevatedbutton(validateEmail, 'SIGN UP'),
              sbv(80),
              const Text(
                'Or SignUp with Social Account',
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

  void validateEmail() {
    if (_isemailvalid && _empty && _ispassvalid) {
      testname = mycont1.text;
      testemail = mycont2.text;
      testPass = mycont3.text;

      showAlert(context, "Registered!",
          "User Registered Succesfully with Username: $testemail", true, [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
            setState(() {
              mycont1.clear();
              mycont2.clear();
              mycont3.clear();

              // Unfocus the text field
              FocusManager.instance.primaryFocus?.unfocus();
            }); // Close the dialog
          },
          child: const Text('OK'),
        ),
      ]);
    } else {
      BuildContext newcontext = context;
      showAlert(newcontext, "Invalid Credentials",
          "Check that All Fields are Correct!", true, [
        // ElevatedButton(
        //   onPressed: () {
        //     if (Navigator.canPop(context)) {
        //       Navigator.of(context).pop();
        //     }
        //   },
        //   child: const Text('OK'),
        // ),
      ]);
    }
  }
}
