import 'dart:async';
import 'package:apihandle/reuseables.dart';
import 'api_db.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Album>> futureAlbums;
  bool showErrorToast = true;
  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Album>>(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.sizeOf(context).width * 1.3,
                      //   width: MediaQuery.sizeOf(context).width,
                      //   child: Image.network(snapshot.data![1].image),
                      // ),
                      Container(
                        height: MediaQuery.sizeOf(context).width * 1.4,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(snapshot.data![1].image),
                          fit: BoxFit.fill,
                        )),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(184, 0, 0, 0),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 0.0, 0.0, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Fashion\nsale",
                              softWrap: false,
                              style: TextStyle(
                                  letterSpacing: 1.2,
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.w900,
                                  height: 0.9,
                                  color: Colors.white),
                            ),
                            sbv(20),
                            SizedBox(
                              height: 40,
                              width: 160,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 252, 64, 43),
                                ),
                                child: const Text(
                                  "Check",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  sbv(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' NEW',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Cardview(
                            img: snapshot.data![index].image,
                            title: snapshot.data![index].title,
                            description: snapshot.data![index].description,
                            price:
                                snapshot.data![index].price.toStringAsFixed(2),
                            category: snapshot.data![index].category,
                            tag: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'NEW',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Summer Sale',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Cardview(
                            img: snapshot.data![index + 5].image,
                            title: snapshot.data![index + 5].title,
                            description: snapshot.data![index + 5].description,
                            price: snapshot.data![index + 5].price
                                .toStringAsFixed(2),
                            category: snapshot.data![index + 5].category,
                            tag: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                '-25%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        ' Winter Sale',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 210,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Cardview(
                            img: snapshot.data![index + 10].image,
                            title: snapshot.data![index + 10].title,
                            description: snapshot.data![index + 10].description,
                            price: snapshot.data![index + 10].price
                                .toStringAsFixed(2),
                            category: snapshot.data![index + 10].category,
                            tag: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                '-10%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Failed to Load, Connection Error',
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            futureAlbums = fetchAlbums();
                          });
                        },
                        child: const Text('Refresh'))
                  ]),
            );
          }

          return const Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Loading Items',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(
                color: Colors.red,
              )
            ]),
          );
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(2.0), topRight: Radius.circular(4.0)),
        child: BottomNavigationBar(
            iconSize: 40,
            selectedItemColor: Colors.red,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart',
                backgroundColor: Colors.pink,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded),
                label: 'Bag',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourites',
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.black,
              ),
            ]),
      ),
    );
  }
}
