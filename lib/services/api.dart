import 'package:http/http.dart' as http;

class RedditApiServices {
  Future<http.Response> getApiData() async {
    final response = await http.get(
      Uri.parse('https://www.reddit.com/r/flutterdev/top.json?count=20'),
    );
    return response;
  }
}
