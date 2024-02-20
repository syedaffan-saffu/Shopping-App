import 'package:flutter/material.dart';
import 'reuseables.dart';

class FrgtPassPage extends StatefulWidget {
  const FrgtPassPage({super.key, required this.title});

  final String title;

  @override
  State<FrgtPassPage> createState() => _FrgtPassPageState();
}

class _FrgtPassPageState extends State<FrgtPassPage> {
  TextEditingController otp = TextEditingController();
  final String uname = "affan.syed001@gmail.com";
  bool _otpvalid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            sbv(70),
            const Text(
              "The OTP to Reset Password has been Sent to ",
            ),
            Text(
              uname,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                controller: otp,
                onChanged: (value) {
                  if (otp.text.length == 5) {
                    setState(() {
                      _otpvalid = true;
                    });
                  } else {
                    setState(() {
                      _otpvalid = false;
                    });
                  }
                },
                decoration: myinputdec1(!_otpvalid, "OTP")),
            sbv(30),
            myelevatedbutton(button, "VERIFY"),
            sbv(20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color.fromARGB(255, 252, 64, 43),
                  minimumSize: const Size.fromHeight(40)),
              child: const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 158, 158), fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void button() {
    if (otp.text == '12345') {
      setState(() {
        otp.clear();
      });
      // Show dialog for incorrect username or password
      showAlert(
        context,
        "",
        "Verified",
        false,
        [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/rstpass');
            },
            child: const Text('Reset Password'),
          ),
        ],
      );
    } else {
      showAlert(
        context,
        "Incorrect OTP",
        "the entered OTP is Incorrect",
        false,
        [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    }
  }
}
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////

/////// NEW  CLASS ///////////////////////

class RstPassPage extends StatefulWidget {
  const RstPassPage({super.key, required this.title});
  final String title;
  @override
  State<RstPassPage> createState() => _RstPassPageState();
}

class _RstPassPageState extends State<RstPassPage> {
  late bool cnfrmpass;
  String updatedpass = '';
  TextEditingController newpasscont = TextEditingController();
  TextEditingController confrmpasscont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: Text(widget.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  TextField(
                    obscureText: true,
                    controller: newpasscont,
                    decoration: myinputdecw('New Password'),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                      obscureText: true,
                      controller: confrmpasscont,
                      decoration: myinputdecw('Confirm Password')),
                  sbv(30),
                  myelevatedbutton(chkpass, "RESET")
                ]))));
  }

  void chkpass() {
    if (newpasscont.text == confrmpasscont.text &&
        confrmpasscont.text.toString().length >= 5) {
      updatedpass = confrmpasscont.text;
      showAlert(
        context,
        "Password Updated",
        "Password has been Updated Successfully!",
        false,
        [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Login Again'),
          ),
        ],
      );
    } else {
      showAlert(
        context,
        "Password Format",
        "Password did not Match or either less then 5 characters",
        false,
        [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    }
  }
}
