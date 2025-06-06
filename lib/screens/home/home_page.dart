import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/home/components/recent_book.dart';
import 'package:e_book_app/screens/home/components/trending_book.dart' show TrendingBook;
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:e_book_app/screens/kart/kart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categories = [
    'All Books',
    'Comic',
    'Novel',
    'Manga',
    'Fairy Tales',
  ];

  int _isSelected = 0;
  String _searchQuery = '';
  List<Book> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _filteredBooks = bookList;
  }

  void _filterBooks(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredBooks = bookList;
      } else {
        _filteredBooks = bookList.where((book) {
          return book.title.toLowerCase().contains(query.toLowerCase()) ||
                 book.author.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _filterByCategory(int index) {
    setState(() {
      _isSelected = index;
      if (index == 0) {
        // Show all books
        _filteredBooks = bookList;
      } else {
        // Filter by category
        _filteredBooks = bookList.where((book) {
          return book.category.toLowerCase() == _categories[index].toLowerCase();
        }).toList();
      }
    });
  }

  void _showBookDetail(Book book) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      book.coverImage,
                      width: 100,
                      height: 150,
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
                            color: Colors.purple[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'by ${book.author}',
                          style: semiBoldText14.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text(
                              book.rating.toString(),
                              style: semiBoldText14,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ukuran: ${book.size}',
                          style: semiBoldText14.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Rp ${book.price.toStringAsFixed(0)}',
                          style: semiBoldText16.copyWith(
                            color: Colors.purple[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Deskripsi',
                style: semiBoldText16.copyWith(
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                book.description,
                style: semiBoldText14.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Tutup',
                      style: semiBoldText14.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Buku berhasil ditambahkan ke keranjang'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Tambah ke Keranjang',
                      style: semiBoldText14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_pic.png'),
                ),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Deva Ibrahim',
                  style: semiBoldText16.copyWith(fontSize: 15),
                ),
                Text(
                  'Good Morning',
                  style: regularText12.copyWith(color: greyColor, fontSize: 11),
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/icons/icon_menu.png',
              width: 16,
            ),
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          onChanged: _filterBooks,
          decoration: InputDecoration(
            hintText: 'Find Your Favorite Book',
            hintStyle: mediumText12.copyWith(color: greyColor, fontSize: 11),
            fillColor: greyColorSearchField,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            isCollapsed: true,
            contentPadding: EdgeInsets.all(16),
            suffixIcon: InkWell(
              onTap: () {
                _filterBooks('');
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  Icons.search_rounded,
                  color: whiteColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget recentBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            RecentBook(
              image: 'assets/images/book_4.png',
              title: 'Atomic Habits',
            ),
            SizedBox(width: 16),
            RecentBook(
              image: 'assets/images/book_1.png',
              title: 'Sofi Oksanen',
            ),
          ],
        ),
      );
    }

    Widget categories(int index) {
      return InkWell(
        onTap: () => _filterByCategory(index),
        child: Container(
          margin: EdgeInsets.only(top: 24, right: 10),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _isSelected == index ? greenColor : transparentColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _categories[index],
            style: semiBoldText14.copyWith(
              color: _isSelected == index ? whiteColor : greyColor,
              fontSize: 13,
            ),
          ),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 24),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories
              .asMap()
              .entries
              .map((MapEntry map) => categories(map.key))
              .toList(),
        ),
      );
    }

    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: _filteredBooks
              .asMap()
              .entries
              .map((MapEntry map) => GestureDetector(
                    onTap: () {
                      _showBookDetail(_filteredBooks[map.key]);
                    },
                    child: TrendingBook(
                      info: _filteredBooks[map.key],
                    ),
                  ))
              .toList(),
        ),
      );
    }

    Widget noResultsFound() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 70,
              color: greyColor,
            ),
            SizedBox(height: 12),
            Text(
              'Tidak ada buku yang ditemukan',
              style: semiBoldText16.copyWith(color: greyColor, fontSize: 15),
            ),
            SizedBox(height: 6),
            Text(
              'Coba kata kunci lain atau kategori berbeda',
              style: regularText12.copyWith(color: greyColor, fontSize: 11),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: 24),
                searchField(),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Recent Book',
                    style: semiBoldText16.copyWith(color: blackColor, fontSize: 15),
                  ),
                ),
                SizedBox(height: 12),
                recentBook(),
              ],
            ),
          ),
          listCategories(),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 24),
            child: Text(
              'Trending Now',
              style: semiBoldText16.copyWith(color: blackColor, fontSize: 15),
            ),
          ),
          _filteredBooks.isEmpty
              ? Container(
                  height: 250,
                  child: noResultsFound(),
                )
              : trendingBook(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

