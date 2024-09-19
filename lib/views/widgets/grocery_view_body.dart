import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop/data/categories.dart';
import 'package:shop/models/category_models.dart';

import 'package:shop/models/grocery_item.dart';
import 'package:shop/views/custom_snack_bar.dart';
import 'package:shop/views/widgets/custom_text.dart';
import 'package:shop/views/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryViewBody extends StatefulWidget {
  const GroceryViewBody({super.key});

  @override
  State<GroceryViewBody> createState() => _GroceryViewBodyState();
}

class _GroceryViewBodyState extends State<GroceryViewBody> {
  bool isLooding = true;
  List<GroceryItem> groceryItems = [];

  void lodData() async {
    final url = Uri.parse(
        "https://shop-test-1e694-default-rtdb.firebaseio.com/shopping-list.json");
    final http.Response response = await http.get(
      url,
    );
    log(" statusCode  BODY =================${response.body.toString()}");
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<GroceryItem> groceryList = [];
    for (var item in data.entries) {
      final CategoryModels category = categories.entries
          .firstWhere(
            (element) => element.value.title == item.value['category'],
          )
          .value;
      groceryList.add(
        GroceryItem(
            id: item.key,
            name: item.value["name"],
            quantity: item.value["quantity"],
            category: category),
      );
      setState(() {
        groceryList = groceryItems;
      });
    }
  }

  @override
  void initState() {
    lodData();
    isLooding = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Grocery'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: groceryItems.isNotEmpty ? groceryListView() : const CustomText(),
    );
  }

  ListView groceryListView() {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          removeItem(groceryItems[index]);
        },
        key: ValueKey(groceryItems[index].id),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: const Color.fromARGB(255, 100, 130, 155),
            child: ListTile(
              leading: Container(
                width: 24,
                height: 24,
                color: groceryItems[index].category.color,
              ),
              title: Text(groceryItems[index].name),
              trailing: Text(
                groceryItems[index].quantity.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void removeItem(GroceryItem item) async {
    final index = groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
    });
    final url = Uri.parse(
        "https://shop-test-1e694-default-rtdb.firebaseio.com/shopping-list/${item.id}.json");
    final http.Response respone = await http.delete(
      url,
    );

    if (respone.statusCode >= 400) {
      customSnackBar(context, "we could not  delete  this item");
      setState(() {
        groceryItems.insert(index, item);
      });
    }
  }

  _addItem() async {
    final newItem =
        await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));
    //lodData();
    //     .then(
    //   (GroceryItem? value) {
    //     if (value == null) return;
    //     setState(
    //       () {
    //         groceryItems.add(value);
    //       },
    //     );
    //   },
    // );
    if (newItem == null) {
      return;
    }
    setState(() {
      groceryItems.add(newItem);
    });
  }
}
