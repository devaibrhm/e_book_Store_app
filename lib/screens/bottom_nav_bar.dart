import 'package:e_book_app/screens/home/home_page.dart';
import 'package:e_book_app/screens/kart/kart_page.dart';
import 'package:e_book_app/screens/save/save_page.dart';
import 'package:e_book_app/screens/user/user_page.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final _screens = [
    HomePage(),
    SavePage(),
    KartPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (i) {
        setState((){
          _selectedIndex = i;
        });
      },
      items: [

          //ICON HOME
        BottomNavigationBarItem(icon: Container (
          margin: EdgeInsets.only(top: 15,),
          child: Image.asset('assets/icons/icon_home.png', 
          width: 20,
          color: _selectedIndex == 0 ? greenColor : greyColor,),
          ),

          //ICON SAVE
           label: '',
           ),
           BottomNavigationBarItem(icon: Container (
           margin: EdgeInsets.only(top: 15,),
          child: Image.asset('assets/icons/icon_save.png', 
          width: 20, 
          color: _selectedIndex == 1 ? greenColor : greyColor,
          ),
          ),

          //ICON KART
           label: '',
           ),
           BottomNavigationBarItem(icon: Container (
           margin: EdgeInsets.only(top: 15,),
          child: Image.asset('assets/icons/icon_kart.png', 
          width: 20,
          color: _selectedIndex == 2 ? greenColor : greyColor,
          ),
          ),

          //ICON USER
           label: '',
           ),
           BottomNavigationBarItem(icon: Container (
           margin: EdgeInsets.only(top: 15,),
          child: Image.asset('assets/icons/icon_user.png', 
          width: 20,
          color: _selectedIndex == 3 ? greenColor : greyColor,
          ),
          ),
           label: '',
           ),
      ],
    );
  }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
        children: _screens.asMap().map((i, screens) => MapEntry(i, Offstage
        (offstage: _selectedIndex != i, child: screens,)))
        .values
        .toList(),
        ),
    );
  }
}