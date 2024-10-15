import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/book_detail_page.dart';
import 'screens/cart_page.dart';
import 'screens/about_page.dart';
import 'models/book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Buku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => BookDetailPage(book: ModalRoute.of(context)!.settings.arguments as Book),
        '/cart': (context) => const CartPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
