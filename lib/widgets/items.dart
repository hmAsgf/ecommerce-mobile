import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/widgets/ItemCard.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  @override
  _Items createState() => _Items(); 
}

class _Items extends State<Items> {
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
                "Recomended For You",
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
        FutureBuilder(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  shrinkWrap: true,
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
                  ]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
