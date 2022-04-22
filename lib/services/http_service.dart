import 'dart:convert';
import 'package:cashaam/models/joke_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String jokesURL = "https://v2.jokeapi.dev/joke/Any";

  Future<JokeModel> getJoke() async {
    Response res = await get(
      Uri.parse(jokesURL),
    );

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      JokeModel joke = JokeModel.fromMap(body);
      return joke;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
