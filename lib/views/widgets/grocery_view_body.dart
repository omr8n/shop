import 'package:flutter/material.dart';

import 'package:shop/models/grocery_item.dart';
import 'package:shop/views/widgets/custom_text.dart';
import 'package:shop/views/widgets/new_item.dart';

class GroceryViewBody extends StatefulWidget {
  const GroceryViewBody({super.key});

  @override
  State<GroceryViewBody> createState() => _GroceryViewBodyState();
}

class _GroceryViewBodyState extends State<GroceryViewBody>
    with SingleTickerProviderStateMixin {
  final List<GroceryItem> groceryItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Grocery'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push<GroceryItem>(MaterialPageRoute(
                  builder: (context) => const NewItem(),
                ))
                    .then(
                  (GroceryItem? value) {
                    if (value == null) return;
                    setState(() {
                      groceryItems.add(value);
                    });
                  },
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: groceryItems.isNotEmpty
          ? ListView.builder(
              itemCount: groceryItems.length,
              itemBuilder: (context, index) => Dismissible(
                onDismissed: (direction) {
                  setState(() {
                    groceryItems.remove(groceryItems[index]);
                  });
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
            )
          : const CustomText(),
    );
  }
}

// ListView.builder(
//         itemCount: groceryItems.length,
//         itemBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Card(
//             color: const Color.fromARGB(255, 100, 130, 155),
//             child: ListTile(
//               leading: Container(
//                 width: 24,
//                 height: 24,
//                 color: groceryItems[index].category.color,
//               ),
//               title: Text(groceryItems[index].name),
//               trailing: Text(
//                 groceryItems[index].quantity.toString(),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),