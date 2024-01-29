import 'package:flutter/material.dart';
import 'package:sho_app_flutter/pages/cart_page.dart';
import 'package:sho_app_flutter/pages/products_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageindex = 0;
  List<Widget> pages = const [
    ProductsPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentPageindex == 1
          ? AppBar(
              title: const Text('Cart'),
            )
          : null,
      body: IndexedStack(
        index: currentPageindex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        currentIndex: currentPageindex,
        onTap: (value) {
          setState(() {
            currentPageindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '')
        ],
      ),
    );
  }
}
