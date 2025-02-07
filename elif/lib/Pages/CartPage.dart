import 'package:elif/Pages/Widgets/AppBarWidgets.dart';
import 'package:elif/Pages/Widgets/DrawerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widgets/CartBottomNavbar.dart';
import 'package:sqflite/sqflite.dart'; // Veritabanı işlemleri için
import 'package:path/path.dart'; // Veritabanı yolu için

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int pizzaCount = 2;
  int hamburgerCount = 2;
  int icecekCount = 2;

  double calculateTotal() {
    double total = 0;
    double teslimatUcreti = 20.99; // Teslimat ücreti sabit 20.99 TL
    total += pizzaCount * 180; // Pizza sabit fiyatlı 180 TL
    total += hamburgerCount * 180; // Hamburger 180 TL
    total += icecekCount * 180; // İçecek 180 TL
    return total + teslimatUcreti;
  }

  Future<void> saveOrder() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'orders.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE orders(id INTEGER PRIMARY KEY, pizzaCount INTEGER, hamburgerCount INTEGER, icecekCount INTEGER, total REAL, date TEXT)',
        );
      },
      version: 1,
    );

    // Tarih bilgisini al
    String date = DateTime.now().toString();

    // Kaydedilecek veri
    Map<String, dynamic> order = {
      'pizzaCount': pizzaCount,
      'hamburgerCount': hamburgerCount,
      'icecekCount': icecekCount,
      'total': calculateTotal(),
      'date': date,
    };

    // Veritabanına kaydet
    await db.insert('orders', order, conflictAlgorithm: ConflictAlgorithm.replace);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Sipariş Listesi",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Item: Pizza
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "images/pizza.png",
                              height: 80,
                              width: 150,
                            ),
                          ),
                          Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Pizza",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Pizzanın Tadına Bakın",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "\180TL",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        pizzaCount++; // Pizza adetini artır
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "$pizzaCount", // Pizza adeti
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (pizzaCount > 0) {
                                          pizzaCount--; // Pizza adetini azalt
                                        }
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Item: Hamburger
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "images/hamburger.png",
                              height: 80,
                              width: 150,
                            ),
                          ),
                          Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Hamburger",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Hamburgerin Tadına Bakın",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "\180TL",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        hamburgerCount++; // Hamburger adetini artır
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "$hamburgerCount", // Hamburger adeti
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (hamburgerCount > 0) {
                                          hamburgerCount--; // Hamburger adetini azalt
                                        }
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Item: İçecek
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "images/icecek.png",
                              height: 80,
                              width: 150,
                            ),
                          ),
                          Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "İçecek",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Yemeğin Yanında İyi Gider",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "\180TL",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        icecekCount++; // İçecek adetini artır
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "$icecekCount", // İçecek adeti
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (icecekCount > 0) {
                                          icecekCount--; // İçecek adetini azalt
                                        }
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Toplam Fiyat
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Öğeler:",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "${pizzaCount + hamburgerCount + icecekCount}", // Toplam öğe sayısı
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ara Toplam",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "\$${(pizzaCount * 180 + hamburgerCount * 180 + icecekCount * 180).toStringAsFixed(2)}", // Ara toplam
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Teslimat Ücreti",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "\20.99TL", // Teslimat ücreti
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Toplam:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${calculateTotal().toStringAsFixed(2)}", // Toplam fiyat
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: saveOrder,
          icon: Icon(Icons.bar_chart), // Chart simgesi
          label: Text('Siparişi Kaydet'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}