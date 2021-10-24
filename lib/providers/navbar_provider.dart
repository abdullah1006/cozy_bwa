import 'package:flutter/widgets.dart';

class NavbarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
