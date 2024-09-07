import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pulloverCount = 1;
  int tShirtCount = 1;
  int sportDressCount = 1;

  int getTotalAmount() {
    return (pulloverCount * 51) + (tShirtCount * 30) + (sportDressCount * 43);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("My Bag")),
        ),
        body: Column(
          children: [
            // Pullover Item
            CartItem(
              title: "Pullover",
              price: 51,
              count: pulloverCount,
              onIncrease: () {
                setState(() {
                  pulloverCount++;
                });
              },
              onDecrease: () {
                if (pulloverCount > 1) {
                  setState(() {
                    pulloverCount--;
                  });
                }
              },
            ),
            // T-Shirt Item
            CartItem(
              title: "T-Shirt",
              price: 30,
              count: tShirtCount,
              onIncrease: () {
                setState(() {
                  tShirtCount++;
                });
              },
              onDecrease: () {
                if (tShirtCount > 1) {
                  setState(() {
                    tShirtCount--;
                  });
                }
              },
            ),
            // Sport Dress Item
            CartItem(
              title: "Sport Dress",
              price: 43,
              count: sportDressCount,
              onIncrease: () {
                setState(() {
                  sportDressCount++;
                });
              },
              onDecrease: () {
                if (sportDressCount > 1) {
                  setState(() {
                    sportDressCount--;
                  });
                }
              },
            ),
            // Total Amount
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Total amount: \$${getTotalAmount()}",
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Checkout Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Congratulations! Checkout Successful.'),
                ));
              },
              child: Text('CHECK OUT',style: TextStyle(fontSize: 22,color: Colors.blue),),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Cart Item
class CartItem extends StatelessWidget {
  final String title;
  final int price;
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CartItem({
    required this.title,
    required this.price,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title (\$$price)"),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: onDecrease,
              ),
              Text("$count"),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onIncrease,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
