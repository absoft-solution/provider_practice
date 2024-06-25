import 'package:flutter/foundation.dart';

List<int> _selectedItems = [];

class FavProvider with ChangeNotifier {
  List<int> get selectedItems => _selectedItems;

  addItem(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  removeItem(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
