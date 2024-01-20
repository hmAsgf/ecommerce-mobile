import 'package:flutter/material.dart';
import 'package:ecommerce/views/about.dart';
import 'package:ecommerce/views/contact_us.dart';
import 'package:ecommerce/views/shop.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopPage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUsPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsPage()),
          );
        }
      },
      selectedItemColor: Colors.pink[400],
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About Us',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone),
          label: 'Contact Us',
        ),
      ],
    );
  }
}
