import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/kart/kart_page.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            // Header with back button
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: blackColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // TODO: Implement save functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Book saved successfully!'),
                          backgroundColor: greenColor,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.bookmark_border_rounded,
                        color: blackColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Book Image
            Container(
              height: 300,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(book.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            // Book Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: semiBoldText16,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'by ${book.author}',
                    style: regularText14.copyWith(color: greyColor),
                  ),
                  SizedBox(height: 16),
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
                      SizedBox(width: 4),
                      Text(
                        '(${book.rating} reviews)',
                        style: regularText12.copyWith(color: greyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Description',
                    style: semiBoldText16,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: regularText14.copyWith(color: greyColor),
                  ),
                  SizedBox(height: 30),
                  // Price and Add to Cart Button
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: regularText14.copyWith(color: greyColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${book.price.toStringAsFixed(2)}',
                            style: semiBoldText16.copyWith(color: greenColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          KartPage.addToCart(
                            context,
                            title: book.title,
                            author: book.author,
                            price: book.price.toInt(),
                            coverImage: book.coverImage,
                            size: book.size,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added to cart!'),
                              backgroundColor: greenColor,
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: semiBoldText16.copyWith(color: whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
} 