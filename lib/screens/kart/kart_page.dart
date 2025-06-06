import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KartPage extends StatefulWidget {
  const KartPage({Key? key}) : super(key: key);

  static void addToCart(BuildContext context, {
    required String title,
    required String author,
    required int price,
    required String coverImage,
    required String size,
  }) {
    final state = context.findAncestorStateOfType<_KartPageState>();
    if (state != null) {
      state._addItemToCart(
        title: title,
        author: author,
        price: price,
        coverImage: coverImage,
        size: size,
      );
    }
  }

  @override
  State<KartPage> createState() => _KartPageState();
}

class _KartPageState extends State<KartPage> {
  List<CartItem> cartItems = [
    CartItem(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      price: 75000,
      coverImage: 'https://m.media-amazon.com/images/I/71FTb9X6wsL._AC_UF1000,1000_QL80_.jpg',
      size: '14 x 21 cm',
      quantity: 1,
    ),
    CartItem(
      title: 'Atomic Habits',
      author: 'James Clear',
      price: 85000,
      coverImage: 'assets/images/book_4.png',
      size: '13 x 20 cm',
      quantity: 1,
    ),
    CartItem(
      title: '1984',
      author: 'George Orwell',
      price: 65000,
      coverImage: 'https://m.media-amazon.com/images/I/71kxa1-0mfL._AC_UF1000,1000_QL80_.jpg',
      size: '15 x 23 cm',
      quantity: 1,
    ),
  ];

  void _addItemToCart({
    required String title,
    required String author,
    required int price,
    required String coverImage,
    required String size,
  }) {
    setState(() {
      // Check if item already exists in cart
      final existingItemIndex = cartItems.indexWhere(
        (item) => item.title == title && item.author == author,
      );

      if (existingItemIndex != -1) {
        // If item exists, increment quantity
        cartItems[existingItemIndex].quantity++;
      } else {
        // If item doesn't exist, add new item
        cartItems.add(
          CartItem(
            title: title,
            author: author,
            price: price,
            coverImage: coverImage,
            size: size,
            quantity: 1,
          ),
        );
      }
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  int get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  int get discount {
    return (totalPrice * 0.1).toInt(); // 10% discount
  }

  Future<void> _launchWhatsApp() async {
    final String phoneNumber = '6283121406619'; // Ganti dengan nomor WhatsApp admin
    final String message = _generateWhatsAppMessage();
    final Uri whatsappUrl = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}',
    );

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tidak dapat membuka WhatsApp'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _generateWhatsAppMessage() {
    String message = 'Halo, saya ingin membeli buku berikut:\n\n';
    
    for (var item in cartItems) {
      message += '- ${item.title} (${item.author})\n';
      message += '  Jumlah: ${item.quantity}\n';
      message += '  Harga: Rp ${item.price.toStringAsFixed(0)}\n';
      message += '  Subtotal: Rp ${(item.price * item.quantity).toStringAsFixed(0)}\n\n';
    }
    
    message += 'Total Pembayaran: Rp ${(totalPrice - discount).toStringAsFixed(0)}\n';
    message += 'Diskon: Rp ${discount.toStringAsFixed(0)}\n\n';
    message += 'Mohon informasi untuk pembayaran selanjutnya. Terima kasih!';
    
    return message;
  }

  void _showPaymentConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Konfirmasi Pembayaran',
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
              'Detail Pembelian:',
              style: semiBoldText14.copyWith(
                color: Colors.purple[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ...cartItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.title} (${item.author})',
                    style: semiBoldText14,
                  ),
                  Text(
                    'Jumlah: ${item.quantity} x Rp ${item.price.toStringAsFixed(0)}',
                    style: semiBoldText14.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            )).toList(),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: semiBoldText16.copyWith(
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp ${(totalPrice - discount).toStringAsFixed(0)}',
                  style: semiBoldText16.copyWith(
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
              _launchWhatsApp();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Lanjutkan ke WhatsApp',
              style: semiBoldText14.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Keranjang Belanja',
          style: semiBoldText16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple[600],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  if (cartItems.isEmpty)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 100,
                            color: Colors.grey[400],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Keranjang Anda Kosong',
                            style: semiBoldText16.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    ...List.generate(
                      cartItems.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: _buildCartItem(
                          item: cartItems[index],
                          index: index,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (cartItems.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: semiBoldText14.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Rp ${totalPrice.toStringAsFixed(0)}',
                        style: semiBoldText16.copyWith(
                          color: Colors.purple[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Diskon',
                        style: semiBoldText14.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Rp ${discount.toStringAsFixed(0)}',
                        style: semiBoldText16.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: semiBoldText16.copyWith(
                          color: Colors.purple[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp ${(totalPrice - discount).toStringAsFixed(0)}',
                        style: semiBoldText16.copyWith(
                          color: Colors.purple[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _showPaymentConfirmation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[600],
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lanjutkan Pembayaran',
                        style: semiBoldText16.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCartItem({
    required CartItem item,
    required int index,
  }) {
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
                item.coverImage,
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
                    item.title,
                    style: semiBoldText16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item.author,
                    style: semiBoldText14.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Ukuran: ${item.size}',
                    style: semiBoldText14.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rp ${item.price.toStringAsFixed(0)}',
                    style: semiBoldText16.copyWith(
                      color: Colors.purple[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Colors.purple[600]),
                  onPressed: () => _incrementQuantity(index),
                ),
                Text(
                  item.quantity.toString(),
                  style: semiBoldText16.copyWith(
                    color: Colors.purple[900],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove_circle_outline, color: Colors.purple[600]),
                  onPressed: () => _decrementQuantity(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red[300]),
                  onPressed: () => _removeItem(index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String title;
  final String author;
  final int price;
  final String coverImage;
  final String size;
  int quantity;

  CartItem({
    required this.title,
    required this.author,
    required this.price,
    required this.coverImage,
    required this.size,
    required this.quantity,
  });
}