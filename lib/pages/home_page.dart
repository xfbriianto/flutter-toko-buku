import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [ 
    Item('Iphone 11', 750000, 'assets/11.jpg'),
    Item('Iphone 12', 800000, 'assets/12.jpg'),
    Item('Iphone 13', 600000, 'assets/13.jpg'),
    Item('Iphone 14', 650000, 'assets/14.jpeg'),
    Item('Iphone 15', 700000, 'assets/15.jpg'),
    Item('Iphone 16', 700000, 'assets/16.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang Belanja'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/item',
                  arguments: items[index],
                );
              },
              child: ListTile(
                title: Text(items[index].name),
                subtitle: Text('Rp ${items[index].price}'),
              ),
            ),
          );
        },
      ),
    );
  }
}