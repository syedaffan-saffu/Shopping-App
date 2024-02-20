import 'package:apihandle/itemview.dart';
import 'package:flutter/material.dart';

class Cardview extends StatefulWidget {
  final String img;
  final String title;
  final String price;
  final String description;
  final String category;
  final Widget tag;

  const Cardview({
    super.key,
    required this.img,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.tag,
  });

  @override
  State<Cardview> createState() => _CardviewState();
}

////////////////// Cards ////////////////////////////////

class _CardviewState extends State<Cardview> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ItemPage(
                image: widget.img,
                title: widget.title,
                description: widget.description,
                price: widget.price,
                category: widget.category,
              ),
            ),
          );
        },
        hoverColor: Colors.black,
        child: SizedBox(
          width: 140,
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Stack(children: [
                      SizedBox(
                          height: 130,
                          width: 130,
                          child: Image.network(
                            widget.img,
                            fit: BoxFit.fill,
                          )),
                      widget.tag,
                    ]),
                  ),
                  const SizedBox(
                      height: 10,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      )),
                  Text(
                    '${widget.title.substring(0, 7)}...',
                  ),
                  Text(
                    "${widget.price}\$",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Text(description!),
                  Text(
                    widget.category,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

//////////////Sized Box////////////////
///
///

Widget sbv(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sbvw(double width) {
  return SizedBox(
    width: width,
  );
}

//////////// Costum Decoration /////////////
InputDecoration myinputdec1(bool condition, String hint) {
  return InputDecoration(
      alignLabelWithHint: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide.none),
      labelStyle: const TextStyle(color: Colors.black),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      fillColor: Colors.white,
      filled: true,
      suffixIcon: condition
          ? const Icon(
              Icons.error,
              color: Color.fromARGB(255, 249, 247, 222),
            )
          : const Icon(
              Icons.check,
              color: Colors.green,
            ),
      // border: const OutlineInputBorder(),
      hintText: hint);
}

InputDecoration myinputdecw(String hint) {
  return InputDecoration(
      alignLabelWithHint: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide.none),
      labelStyle: const TextStyle(color: Colors.black),
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      fillColor: Colors.white,
      filled: true,
      hintText: hint);
}

//////////////Alert Box///////////////////
class AlertBox {
  List<Widget>? myactions;
  String mycontent;
  BuildContext mycontext;
  String mytitle;
  bool barrier = true;
  AlertBox(
      {required this.mycontext,
      required this.mytitle,
      required this.mycontent,
      this.myactions,
      required this.barrier}) {
    showDialog(
      context: mycontext,
      barrierDismissible: barrier,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registered!'),
          content: Text(mycontent),
          actions: myactions,
        );
      },
    );
  }
}

void showAlert(BuildContext mycontext, String mytitle, String mycontent,
    bool barrier, List<Widget>? myactions) {
  showDialog(
    context: mycontext,
    barrierDismissible: barrier,
    builder: (mycontext) {
      return AlertDialog(
        title: Text(mytitle),
        content: Text(mycontent),
        actions: myactions,
      );
    },
  );
}

class Validity {
  static bool isEmailValid(String email) {
    // Regular expression for a simple email validation
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPassValid(String pass) {
    return pass.length < 8;
  }

  static bool isfieldEmpty(String field) {
    return field.isEmpty;
  }
}

ElevatedButton myelevatedbutton(void Function() onpressed, String text) {
  return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 252, 64, 43),
          minimumSize: const Size.fromHeight(40)),
      child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )));
}
