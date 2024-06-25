import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/fav_provider.dart';
import 'package:provider_practice/screen/fav_screen.dart';

class SelectedFavScreen extends StatefulWidget {
  const SelectedFavScreen({super.key});

  @override
  State<SelectedFavScreen> createState() => _SelectedFavScreenState();
}

class _SelectedFavScreenState extends State<SelectedFavScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.favorite)),
        ],
        backgroundColor: Colors.amber.shade200,
        title: const Text("Fav. App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItems.length,
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
