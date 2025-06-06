import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:e_book_app/screens/kart/kart_page.dart';

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  List<SavedBook> savedBooks = [
    SavedBook(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      coverImage: 'https://m.media-amazon.com/images/I/71FTb9X6wsL._AC_UF1000,1000_QL80_.jpg',
      progress: 0.75,
      price: 75000,
      size: '14 x 21 cm',
    ),
    SavedBook(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      coverImage: 'https://m.media-amazon.com/images/I/71FxgtFKcQL._AC_UF1000,1000_QL80_.jpg',
      progress: 0.45,
      price: 85000,
      size: '13 x 20 cm',
    ),
    SavedBook(
      title: '1984',
      author: 'George Orwell',
      coverImage: 'https://m.media-amazon.com/images/I/71kxa1-0mfL._AC_UF1000,1000_QL80_.jpg',
      progress: 0.30,
      price: 65000,
      size: '15 x 23 cm',
    ),
  ];

  void _showAddToCartDialog(SavedBook book) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Tambahkan ke Keranjang',
          style: semiBoldText16.copyWith(
            color: Colors.purple[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apakah Anda ingin menambahkan buku ini ke keranjang?',
              style: semiBoldText14,
            ),
            SizedBox(height: 10),
            Text(
              book.title,
              style: semiBoldText14.copyWith(
                color: Colors.purple[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              book.author,
              style: semiBoldText14.copyWith(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Harga: Rp ${book.price.toStringAsFixed(0)}',
              style: semiBoldText14.copyWith(
                color: Colors.purple[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Batal',
              style: semiBoldText14.copyWith(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              KartPage.addToCart(
                context,
                title: book.title,
                author: book.author,
                price: book.price,
                coverImage: book.coverImage,
                size: book.size,
              );
              _showSuccessSnackBar(book.title);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Tambahkan',
              style: semiBoldText14.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessSnackBar(String bookTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$bookTitle berhasil ditambahkan ke keranjang',
          style: semiBoldText14.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Lihat Keranjang',
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Buku Tersimpan',
          style: semiBoldText16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple[600],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buku yang Anda Simpan',
                style: semiBoldText12.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              SizedBox(height: 20),
              ...savedBooks.map((book) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _buildSavedBookCard(book),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSavedBookCard(SavedBook book) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                book.coverImage,
                width: 80,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: semiBoldText16.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    book.author,
                    style: semiBoldText14.copyWith(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: book.progress,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 67, 184, 0)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${(book.progress * 100).toInt()}% selesai',
                    style: semiBoldText12.copyWith(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.purple[600]),
                  onPressed: () => _showAddToCartDialog(book),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SavedBook {
  final String title;
  final String author;
  final String coverImage;
  final double progress;
  final int price;
  final String size;

  SavedBook({
    required this.title,
    required this.author,
    required this.coverImage,
    required this.progress,
    required this.price,
    required this.size,
  });
}