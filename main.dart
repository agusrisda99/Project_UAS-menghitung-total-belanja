import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'dashboard.dart';
import 'list_barang.dart';
import 'new_item.dart';
import 'cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dewata Store",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.redAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/Halsatu': (BuildContext context) => new Home(),
        '/Haldua': (BuildContext context) => new Biodata(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts = [
    Cart(id: 'DW1', title: 'Baju', nama: 'Jack', harga: 2000, qty: 5),
  ];

  void _openModal(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return AddNewItem(_addNewItem);
        });
  }

  void _addNewItem(String title, String nama, double harga, int qty) {
    final newItem = Cart(
        id: DateTime.now().toString(),
        title: title,
        nama: nama,
        harga: harga,
        qty: qty);
    setState(() {
      _carts.add(newItem);
    });
  }

  void _resetCarts() {
    setState(() {
      _carts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => _openModal(context)),
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(
            Icons.person_outline,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/Haldua');
          },
        ),
        title: Text("Dewata Store"),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () => _resetCarts(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts),
          ],
        ),
      ),
    );
  }
}

                
