import 'package:e_book_app/models/book.dart';
import 'package:flutter/material.dart';
import 'package:e_book_app/themes.dart';

class TrendingBook extends StatelessWidget {
  const TrendingBook({
    Key? key,
    required this.info,
  }) : super(key: key);

  final Book info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 140,
          margin: EdgeInsets.only(top: 12, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              info.coverImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  info.coverImage,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.author,
                style: mediumText12.copyWith(color: greyColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                info.title,
                style: semiBoldText14.copyWith(color: blackColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  SizedBox(width: 4),
                  Text(
                    info.rating.toString(),
                    style: mediumText12.copyWith(color: greyColor),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'Rp ${info.price.toStringAsFixed(0)}',
                style: semiBoldText14.copyWith(
                  color: greenColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}