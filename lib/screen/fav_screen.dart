import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/fav_provider.dart';
import 'package:provider_practice/screen/selected_fav_screen.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

List<int> selectedItems = [];

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    print("BBB");
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectedFavScreen()));
              },
              child: Icon(Icons.favorite)),
        ],
        backgroundColor: Colors.amber.shade200,
        title: const Text("Fav. App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItems.contains(index)) {
                            value.selectedItems.remove(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text("Item No. $index"),
                        trailing: Icon(value.selectedItems.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
