import 'package:flutter/material.dart';
//import 'package:apihandle/main.dart';

class ItemPage extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String category;
  const ItemPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.category});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.network(widget.image),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.category),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\$ ${widget.price}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description: \n',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(widget.description),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
