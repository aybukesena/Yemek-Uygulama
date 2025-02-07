import 'package:elif/Pages/HomePage.dart';
import 'package:elif/Pages/OrdersPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text(
                "Elif &Aybüke",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "elifaybuke@uludag.edu.tr",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
            ),
          ),

          // List Tile
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.red,
            ),
            title: Text(
              "AnaSayfa",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),

          // List Tile
          ListTile(
            leading: Icon(
              CupertinoIcons.person,
              color: Colors.red,
            ),
            title: Text(
              "Hesabım",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // List Tile
          ListTile(
            leading: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.red,
            ),
            title: Text(
              "Siparişlerim",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrdersPage()),
              );
            },
          ),

          // List Tile
          ListTile(
            leading: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
            ),
            title: Text(
              "Favorilerim",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // List Tile
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.red,
            ),
            title: Text(
              "Ayarlar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // List Tile
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              "Çıkış Yap",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
