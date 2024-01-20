import 'package:flutter/material.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/profile_page.dart';
import 'package:ecommerce/components/navbar.dart';

class AboutUsPage extends StatefulWidget {
  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement search action here
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              // Implement cart action here
            },
            icon: Icon(Icons.shopping_cart),
          ),
          GestureDetector(
            onTap: () {
              showProfilePopupMenu(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCard('lib/images/about-1.jpg', 'Foods'),
              buildDescription(
                'Lorem ipsum dolor sit amet consectetur\n'
                'adipisicing elit. Aperiam accusantium perspiciatis,\n'
                'sapientemagni eos dolorum ex quos dolores odio',
              ),
              buildCard('lib/images/about-2.jpg', 'Drinks'),
              buildDescription(
                'Lorem ipsum dolor sit amet consectetur\n'
                'adipisicing elit. Aperiam accusantium perspiciatis,\n'
                'sapientemagni eos dolorum ex quos dolores odio',
              ),
              buildCard('lib/images/about-3.jpg', 'Snacks'),
              buildDescription(
                'Lorem ipsum dolor sit amet consectetur\n'
                'adipisicing elit. Aperiam accusantium perspiciatis,\n'
                'sapientemagni eos dolorum ex quos dolores odio',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildCard(String imagePath, String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescription(String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        description,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
    );
  }

  void showProfilePopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 0, 0),
      items: [
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Text('Profile'),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Logout'),
          ),
        ),
      ],
    );
  }
}
