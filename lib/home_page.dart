import 'package:flutter/material.dart';
import 'package:sho_app_flutter/global_variables.dart';
import 'package:sho_app_flutter/products_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> companies = const [
    'All',
    'Addidas',
    'Nike',
    'Puma',
  ];

  late String selectedCompany;

  @override
  void initState() {
    super.initState();
    selectedCompany = companies[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: border,
                      focusedBorder: border,
                      enabledBorder: border),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: companies.length,
              itemBuilder: (context, index) {
                final filter = companies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCompany = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedCompany == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        style: BorderStyle.none,
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  image: products[index]['imageUrl'] as String,
                  title: products[index]['title'] as String,
                  price: products[index]['price'] as double,
                  index: index,
                  backgroundColor: index.isEven
                      ? const Color.fromRGBO(216, 240, 253, 1)
                      : const Color.fromRGBO(245, 247, 249, 1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
