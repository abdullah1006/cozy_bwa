import '../models/space.dart';
import 'package:flutter/widgets.dart';
import '../network/api_client.dart';

class SpaceProvider extends ChangeNotifier {
  bool _onLoadData = true;
  bool get onLoadData => _onLoadData;

  String _message = "";
  String get message => _message;

  List<Space> _spaceList = [];
  List<Space> get spaceList => _spaceList;
  void getSpaceList() async {
    if (_onLoadData) {
      _spaceList = await ApiClient.getRecommendedSpaces();
      if (_spaceList.isEmpty) {
        _message = 'Error Saat Mendapatkan Data';
      }
      _onLoadData = false;
      notifyListeners();
    }
  }

  void init() {
    _message = "";
    _spaceList = [];
  }

  void setFavorite(Space space) {
    space.isFavorite = !space.isFavorite;
    notifyListeners();
  }
}
