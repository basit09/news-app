import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants.dart';
import 'package:news_app/models/news_info.dart';

class Api_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var welcome = null;


      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        var welcome = Welcome.fromJson(jsonMap);
      }

      return welcome;

  }
}