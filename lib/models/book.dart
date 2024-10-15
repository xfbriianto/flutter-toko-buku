class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  final String imageUrl;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

// Contoh data buku
List<Book> sampleBooks = [
  Book(
    id: '1',
    title: 'Flutter for Beginners',
    author: 'John Doe',
    price: 150000,
    imageUrl: 'https://example.com/flutter_book.jpg',
    description: 'Buku panduan lengkap untuk memulai Flutter development.',
  ),
  // Tambahkan buku lainnya di sini
];
