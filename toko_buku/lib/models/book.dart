class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  final String description;
  final String imageUrl; // Gunakan imageUrl untuk menyimpan URL gambar

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

List<Book> books = [
  Book(
    id: '1',
    title: 'Flutter in Action',
    author: 'Eric Windmill',
    price: 39.99,
    description: 'A practical guide to building high-performance applications with Flutter.',
    imageUrl: 'https://picsum.photos/200/300',
  ),
  Book(
    id: '2',
    title: 'Dart in Action',
    author: 'Chris Buckett',
    price: 44.99,
    description: 'A hands-on guide to building web and mobile applications with Dart.',
    imageUrl: 'https://picsum.photos/200/300',
  ),
  // Add more books here
];
