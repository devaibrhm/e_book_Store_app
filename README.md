# e_book_Store 🏙️

**e_book_Store** is a modern and minimal e-commerce mobile application built with Flutter. This project is based on the tutorial by Mitch Koko ([YouTube](https://youtu.be/x9RtO_1mrMc?feature=shared)) and extended to suit a more dynamic shopping experience like Adidas or Nike mobile apps.

## ✨ Features

- 🏠 *Home Page* displaying curated shoe products.
- 🛒 *Shopping Cart* with add/remove item capability.
- 💬 *Checkout via WhatsApp* with auto-generated message.
- 📱 *Mobile-optimized UI* with sleek design.
- 🔧 *Provider* for efficient state management.
- 🚀 *Intro Page* for first-time launch.

## 📦 Folder Structure


lib/
├── components/
│   └── CartItem.dart
├── models/
│   ├── cart.dart
│   └── shoe.dart
├── pages/
│   ├── home_page.dart
│   ├── cart_page.dart
│   └── intro_page.dart
├── main.dart


## 🚀 Getting Started

1. *Clone the repository:*
   bash
   git https://github.com/devaibrhm/e_book_Store_app.git
   cd kaky
   

2. *Install dependencies:*
   bash
   flutter pub get
   

3. *Run the app:*
   bash
   flutter run
   

## 📲 WhatsApp Checkout

This feature creates a pre-filled WhatsApp message containing cart item names and total price:
```
Halo, saya ingin membeli buku berikut:

- The Great Gatsby (F. Scott Fitzgerald)
  Jumlah: 2
  Harga: Rp 75000
  Subtotal: Rp 150000

- Atomic Habits (James Clear)
  Jumlah: 1
  Harga: Rp 85000
  Subtotal: Rp 85000

- 1984 (George Orwell)
  Jumlah: 1
  Harga: Rp 65000
  Subtotal: Rp 65000

Total Pembayaran: Rp 270000
Diskon: Rp 30000

Mohon informasi untuk pembayaran selanjutnya. Terima kasih!


## 🙌 Credits

- 🧠 UI and structure inspired by Mitch Koko’s Flutter tutorial:  
  [🖥️ YouTube Video](https://youtu.be/x9RtO_1mrMc?feature=shared)

## 🖼️ Screenshots

| Home Page | Save Ebook | Kart Page |
|------------|-----------|-----------|
| <img src="https://kknunfari.com/images/deva/beranda.jpg" width="250"/> | <img src="https://kknunfari.com/images/deva/Save_ebook.jpg" width="250"/> | <img src="https://kknunfari.com/images/deva/kart_page.jpg" width="250"/> |

| Detail Page | Profile Page | Payment Whatsapp
|--------------|------------|--------------|
| <img src="https://kknunfari.com/images/deva/detail%20_produk.jpg" width="250"/> | <img src="https://kknunfari.com/images/deva/profile_page.jpg" width="250"/> | <img src="https://kknunfari.com/images/06.App%20Drawer.jpg" width="250"/> |


## 🔮 To-Do

- [ ] Home page
- [ ] Product detail page
- [ ] Save Page   
- [ ] Kart Page  
- [ ] Payment Whatsapp  
- [ ] Profile  

## 👨‍💻 Author

- *Name:* Ihsan Surya Jamil, M Fisal Ramdan, dan Hanifah  
- *GitHub:* [https://github.com/devaibrhm/e_book_Store_app](https://github.com/devaibrhm/e_book_Store_app)

## 📄 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).