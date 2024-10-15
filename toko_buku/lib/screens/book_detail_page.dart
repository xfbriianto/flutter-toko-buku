import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../models/cart.dart';
import 'dart:async';
import 'dart:developer' as developer;


class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: precacheImage(NetworkImage(book.imageUrl), context).timeout(
                const Duration(seconds: 10),
                onTimeout: () {
                  throw TimeoutException('Image loading timed out');
                },
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    developer.log('Error precaching image: ${snapshot.error}');
                    return Container(
                      height: 300,
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, size: 50, color: Colors.red),
                          const SizedBox(height: 10),
                          Text('Error: ${snapshot.error}', textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  }
                  return Image.network(
                    book.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Container(
                    height: 300,
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: Theme.of(context).textTheme.titleLarge),
                  Text(book.author, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Rp${book.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  Text(book.description),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      cart.addItem(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Buku ditambahkan ke keranjang')),
                      );
                    },
                    child: const Text('Tambahkan ke Keranjang'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
