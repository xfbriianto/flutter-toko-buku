import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/book_detail_page.dart';
import 'screens/cart_page.dart';
import 'screens/about_page.dart';
import 'models/book.dart';
import 'models/cart.dart';
import 'screens/error.page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => Cart(),
      child: const MyApp(),
    ),
  );
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
        '/cart': (context) => const CartPage(),
        '/about': (context) => const AboutPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final book = settings.arguments as Book?;
          return MaterialPageRoute(
            builder: (context) => book != null
                ? BookDetailPage(book: book)
                : const ErrorPage(message: 'Book not found'),
          );
        }
        return null;
      },
    );
  }
}