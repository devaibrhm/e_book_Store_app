class Book {
  final String title;
  final String author;
  final String category;
  final String coverImage;
  final double rating;
  final int price;
  final String size;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.category,
    required this.coverImage,
    required this.rating,
    required this.price,
    required this.size,
    required this.description,
  });
}

List<Book> bookList = [
  Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    category: 'Novel',
    coverImage: 'https://m.media-amazon.com/images/I/71FTb9X6wsL._AC_UF1000,1000_QL80_.jpg',
    rating: 4.5,
    price: 75000,
    size: '14 x 21 cm',
    description: 'The Great Gatsby adalah novel karya F. Scott Fitzgerald yang menceritakan tentang Jay Gatsby, seorang jutawan misterius yang jatuh cinta pada Daisy Buchanan. Novel ini menggambarkan kehidupan mewah di era Jazz Age dan mengeksplorasi tema-tema seperti cinta, ambisi, dan ilusi American Dream.',
  ),
  Book(
    title: 'Atomic Habits',
    author: 'James Clear',
    category: 'Novel',
    coverImage: 'assets/images/book_4.png',
    rating: 4.8,
    price: 85000,
    size: '13 x 20 cm',
    description: 'Atomic Habits adalah buku self-help yang membahas tentang bagaimana membangun kebiasaan baik dan menghilangkan kebiasaan buruk. Buku ini menjelaskan bahwa perubahan besar terjadi melalui perubahan kecil yang konsisten dalam kehidupan sehari-hari.',
  ),
  Book(
    title: '1984',
    author: 'George Orwell',
    category: 'Novel',
    coverImage: 'https://m.media-amazon.com/images/I/71kxa1-0mfL._AC_UF1000,1000_QL80_.jpg',
    rating: 4.7,
    price: 65000,
    size: '15 x 23 cm',
    description: '1984 adalah novel distopia karya George Orwell yang menggambarkan masyarakat totaliter di bawah pengawasan ketat Big Brother. Novel ini mengeksplorasi tema-tema seperti pengawasan massal, kontrol pikiran, dan manipulasi sejarah.',
  ),
  Book(
    title: 'One Piece',
    author: 'Eiichiro Oda',
    category: 'Manga',
    coverImage: 'assets/images/book_1.png',
    rating: 4.9,
    price: 45000,
    size: '11 x 17 cm',
    description: 'One Piece adalah manga populer yang mengisahkan petualangan Monkey D. Luffy dan kru bajak lautnya dalam mencari harta karun legendaris One Piece. Cerita ini penuh dengan petualangan, persahabatan, dan mimpi untuk menjadi Raja Bajak Laut.',
  ),
  Book(
    title: 'Batman: The Dark Knight',
    author: 'Frank Miller',
    category: 'Comic',
    coverImage: 'assets/images/book_2.png',
    rating: 4.6,
    price: 55000,
    size: '17 x 26 cm',
    description: 'Batman: The Dark Knight adalah komik ikonik yang menceritakan kisah Batman dalam versi yang lebih gelap dan dewasa. Komik ini mengeksplorasi sisi psikologis Bruce Wayne dan perjuangannya melawan kejahatan di Gotham City.',
  ),
];