import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,  // Atur lebar gambar
                height: 200, // Atur tinggi gambar
                child: Image.network(item.imageUrl, fit: BoxFit.cover),  // Menyesuaikan gambar dalam container
              ),
            ),
            SizedBox(height: 16),
            Text(
              item.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),  // Memperbesar ukuran teks
            ),
            SizedBox(height: 8),
            Text(
              'Rp ${item.price}',
              style: TextStyle(fontSize: 18),  // Memperbesar ukuran teks harga
            ),
          ],
        ),
      ),
    );
  }
}
