# kaky 🏙️👟

*kaky* is a modern and minimal e-commerce mobile application built with Flutter. This project is based on the tutorial by Mitch Koko ([YouTube](https://www.youtube.com/watch?v=UcwsuZP071Y)) and extended to suit a more dynamic shopping experience like Adidas or Nike mobile apps.

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
   git https://github.com/Ihsansuryajamil/Kaky.git
   cd kaky
   

2. *Install dependencies:*
   bash
   flutter pub get
   

3. *Run the app:*
   bash
   flutter run
   

## 📲 WhatsApp Checkout

This feature creates a pre-filled WhatsApp message containing cart item names and total price:

Hello! I want to order:
- Air Jordan 1 (low) ($140)
- Air Jordan 1 (low) ($140)

Total: $280.00


## 🙌 Credits

- 🧠 UI and structure inspired by Mitch Koko’s Flutter tutorial:  
  [🖥️ YouTube Video](https://www.youtube.com/watch?v=UcwsuZP071Y)

## 🖼️ Screenshots

| Intro Page | Home Page | Cart Page |
|------------|-----------|-----------|
| <img src="https://kknunfari.com/images/01.awal.jpg" width="250"/> | <img src="https://kknunfari.com/images/02.beranda.jpg" width="250"/> | <img src="https://kknunfari.com/images/03.Keranjang.jpg" width="250"/> |

| Product Page | Profile Page | App Drawer |
|--------------|------------|--------------|
| <img src="https://kknunfari.com/images/04.All%20Produk.jpg" width="250"/> | <img src="https://kknunfari.com/images/05.Profile.jpg" width="250"/> | <img src="https://kknunfari.com/images/06.App%20Drawer.jpg" width="250"/> |


## 🔮 To-Do

- [ ] Product detail page  
- [ ] Authentication (Login/Register)  
- [ ] Payment gateway integration  
- [ ] Wishlist functionality  

## 👨‍💻 Author

- *Name:* Ihsan Surya Jamil, M Fisal Ramdan, dan Hanifah  
- *GitHub:* [https://github.com/Ihsansuryajamil/Kaky](https://github.com/Ihsansuryajamil/Kaky)

## 📄 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).