import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/widgets/ItemCard.dart';
import 'package:flutter/material.dart';

class popular extends StatefulWidget {
  @override
  _popular createState() => _popular();
}

class _popular extends State<popular> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  _reloadData() {
    setState(() {
      products = getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    for (int i = 0; i < snapshot.data!.length; i++)
                      ItemCard(
                        product: Product(
                          id: snapshot.data![i].id,
                          name: snapshot.data![i].name,
                          category: snapshot.data![i].category,
                          price: snapshot.data![i].price,
                          image: 'lib/images/${snapshot.data![i].name}.png',
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset(
                              'lib/images/${snapshot.data![i].name}.png'),
                          height: 110,
                          width: 110,
                        ),
                      ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}
