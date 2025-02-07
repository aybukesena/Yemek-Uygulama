import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Map<String, dynamic>> orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  // Veritabanından siparişleri çek
  Future<void> fetchOrders() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'orders.db');

    final db = await openDatabase(path);
    final List<Map<String, dynamic>> result = await db.query('orders');

    setState(() {
      orders = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siparişler'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Sipariş Tarihi: ${order['date']}'),
              subtitle: Text(
                  'Pizza: ${order['pizzaCount']}, Hamburger: ${order['hamburgerCount']}, İçecek: ${order['icecekCount']}'),
              trailing: Text('\$${order['total'].toStringAsFixed(2)}'),
            ),
          );
        },
      ),
    );
  }
}