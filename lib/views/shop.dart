import 'package:flutter/material.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/profile_page.dart';
import 'package:ecommerce/components/navbar.dart';

class Product {
  final String name;
  final String image;
  final double price;
  int quantity;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      this.quantity = 0});
}

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Product> products = [
    Product(
        name: 'Nasi Goreng Jancuk',
        image: 'lib/images/nasgor_jancuk.jpg',
        price: 15.000),
    Product(
        name: 'Nasi Goreng Kambing',
        image: 'lib/images/nasgor_kambing.jpeg',
        price: 17.000),
    Product(
        name: 'Nasi Goreng Sosis',
        image: 'lib/images/nasgor_sosis.jpeg',
        price: 17.000),
    Product(
        name: 'Nasi Goreng Jawa',
        image: 'lib/images/nasgor_jawa.jpeg',
        price: 15.000),
    Product(
        name: 'Nasi Goreng Seafood',
        image: 'lib/images/nasgor_seafood.jpg',
        price: 17.000),
    Product(
        name: 'Nasi Goreng Merah',
        image: 'lib/images/nasgor_merah.png',
        price: 15.000),
    Product(name: 'Es Teh', image: 'lib/images/esteh.jpeg', price: 7.000),
    Product(name: 'Es Jeruk', image: 'lib/images/esjeruk.jpeg', price: 15.000),
    Product(
        name: 'Kentang Goreng',
        image: 'lib/images/kentang.jpeg',
        price: 10.000),
    Product(name: 'Tahu Crispy', image: 'lib/images/tahu.jpeg', price: 10.000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Colors.green,
        elevation: 0,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    products[index].image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  products[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${products[index].price.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (products[index].quantity > 0) {
                            products[index].quantity--;
                          }
                        });
                      },
                    ),
                    Text(products[index].quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          products[index].quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation if needed
        },
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
