import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  String _userName = '';
  String _userImage = '';

  String get userName => _userName;
  String get userImage => _userImage;

  void setUser(String name, String image) {
    _userName = name;
    _userImage = image;
    notifyListeners();
  }
}