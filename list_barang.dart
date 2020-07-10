import 'package:flutter/material.dart';
import 'cart.dart';

class ProductList extends StatelessWidget {
  final List<Cart> carts;

  ProductList(this.carts);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: carts.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "Tidak Ada Data Barang",
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                double total_harga = carts[index].harga * carts[index].qty;
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        child: Text(
                          carts[index].qty.toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            carts[index].nama + ' | ' + carts[index].title,
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            'Harga: Rp.' +
                                carts[index].harga.toStringAsFixed(0) +
                                ' | ' +
                                'Total: Rp.' +
                                total_harga.toStringAsFixed(0),
                            style: TextStyle(
                                fontSize: 15, color: Colors.lightBlue),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: carts.length,
            ),
    );
  }
}
