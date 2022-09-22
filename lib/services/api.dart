import 'package:http/http.dart' as http;
import 'package:reddit_clone_test/model/welcome.dart';

class RedditApiServices {
  Future<Welcome> getApiData() async {
    final response = await http.get(
      Uri.parse('https://www.reddit.com/r/flutterdev/top.json?count=20'),
    );
    return welcomeFromJson(response.body);
  }
}
