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
    final _item = await ApiClient.getRecommendedSpaces();
    _spaceList.addAll(_item);
    if (_spaceList.isEmpty) {
      _message = 'Error Saat Mendapatkan Data';
    }
    _onLoadData = false;
    notifyListeners();
  }

  void init() {
    _onLoadData = false;
    _message = "";
    _spaceList = [];
  }
}
