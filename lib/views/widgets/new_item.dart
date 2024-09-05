import 'package:flutter/material.dart';
import 'package:shop/data/categories.dart';
import 'package:shop/models/grocery_item.dart';

import 'package:shop/views/widgets/custom_button.dart';
import 'package:shop/views/widgets/custom_text_field.dart';

import '../../models/category_models.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name;
  int? quantity;

  CategoryModels? selctedCategory = categories[Categories.meat];

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                onSaved: (value) {
                  name = value;
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'must be between 1 and 50 charctar';
                  } else {
                    return null;
                  }
                },
                hint: "name",
                //maxLines: 50,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField(
                      onSaved: (value) {
                        quantity = int.tryParse(value!);
                      },
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Field is required ';
                        } else {
                          return null;
                        }
                      },
                      hint: "Quantity",
                      // maxLines: 50,6
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: selctedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(category.value.title),
                                ],
                              ))
                      ],
                      onChanged: (CategoryModels? value) {
                        setState(() {
                          selctedCategory = value!;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    title: "Reset",
                    onPressed: () {
                      formKey.currentState!.reset();
                    },
                  ),
                  CustomButton(
                    title: "Add Item",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.of(context).pop(GroceryItem(
                            id: DateTime.now().toString(),
                            name: name!,
                            quantity: quantity!,
                            category: selctedCategory!));
                        setState(() {});
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
