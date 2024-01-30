import 'package:flutter/material.dart';
import 'package:sho_app_flutter/global_variables.dart';
import 'package:sho_app_flutter/widgets/products_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final Set<String> companies = {'All'};
  void getCompanies() {
    for (int i = 0; i < products.length; i++) {
      companies.add((products[i]['company']).toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCompanies();
  }

  int selectedCompanyIndex = 0;
  String selectedCompanyName = 'All';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> filteredProducts =
        (products.where((element) => element['company'] == selectedCompanyName))
            .toList();

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      child: Column(
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCompanyIndex = index;
                        selectedCompanyName =
                            companies.elementAt(selectedCompanyIndex);
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedCompanyIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        style: BorderStyle.none,
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      label: Text(companies.elementAt(index)),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                if (constraint.maxWidth > 850) {
                  return GridView.builder(
                      itemCount: selectedCompanyName == 'All'
                          ? products.length
                          : filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.70,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                            title: selectedCompanyName == 'All'
                                ? (products[index]['title'].toString())
                                : (filteredProducts[index]['title']).toString(),
                            price: selectedCompanyName == 'All'
                                ? double.parse(
                                    products[index]['price'].toString())
                                : double.parse(filteredProducts[index]['price']
                                    .toString()),
                            image: selectedCompanyName == 'All'
                                ? (products[index]['imageUrl'].toString())
                                : (filteredProducts[index]['imageUrl'])
                                    .toString(),
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                            index: index);
                      });
                } else {
                  return ListView.builder(
                    itemCount: selectedCompanyName == 'All'
                        ? products.length
                        : filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          title: selectedCompanyName == 'All'
                              ? (products[index]['title'].toString())
                              : (filteredProducts[index]['title']).toString(),
                          price: selectedCompanyName == 'All'
                              ? double.parse(
                                  products[index]['price'].toString())
                              : double.parse(
                                  filteredProducts[index]['price'].toString()),
                          image: selectedCompanyName == 'All'
                              ? (products[index]['imageUrl'].toString())
                              : (filteredProducts[index]['imageUrl'])
                                  .toString(),
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                          index: index);
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
