import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      Book(
        id: '1',
        title: 'Principles of Programming Languages',
        author: 'John Doe',
        price: 150000,
        description: 'A comprehensive guide to basic Java.',
        imageUrl: 'https://m.media-amazon.com/images/I/61lC0rGl-HL._AC_UF1000,1000_QL80_.jpg',
      ),
      Book(
        id: '2',
        title: 'JAVA Programming Simplified',
        author: 'Jane Smith',
        price: 120000,
        description: 'Java Programming.',
        imageUrl: 'https://bpbonline.com/cdn/shop/products/9789389845143.jpg?v=1623762437',
      ),
      // Tambahkan buku lainnya...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Buku'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Keranjang'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookListItem(book: books[index]);
        },
      ),
    );
  }
}
