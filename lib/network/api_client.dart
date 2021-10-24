import 'package:cozy/models/space.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future getRecommendedSpaces() async {
    var url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      return spaceFromJson(result.body);
    } else {
      return <Space>[];
    }
  }
}
