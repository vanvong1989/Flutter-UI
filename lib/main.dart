import 'package:flutter/material.dart';
import 'ProductInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/productInfo': (context) => ProductInfo(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/logo.png',
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 0,
                right: 3,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      '9',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
          children: List.generate(6, createItem),
        ),
      ),
    );
  }

  Container createItem(int id) {
    List<String> itemNames = [
      'Spinach',
      'Avacado',
      'Sweet Corn',
      'Kiwi',
      'Orange',
      'Apple'
    ];
    List<double> itemPrice = [1.22, 3.63, 4.82, 8.30, 3.5, 4.2];
    List<String> itemQuantity = [
      '1 lbs',
      'each',
      'each',
      '3 Nos',
      '3 Nos',
      '3 Nos',
      '2 Nos'
    ];
    var newNum = id + 1;
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          openProductInfo(newNum, itemPrice[id].toString(),
              itemNames[id].toString(), itemQuantity[id].toString());
        },
        child: Column(
          children: [
            Hero(
              tag: 'img$newNum',
              child: Container(
                height: 150,
                child: Image.asset('assets/img$newNum.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                '\$' + itemPrice[id].toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                itemNames[id],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                itemQuantity[id],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 20,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Add to cart",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void openProductInfo(int id, String price, String name, String quantity) {
    Navigator.pushNamed(
      context,
      '/productInfor',
      arguments: {
        'img': 'img$id',
        'name': name,
        'quantity': quantity,
        'price': price
      },
    );
  }
}
