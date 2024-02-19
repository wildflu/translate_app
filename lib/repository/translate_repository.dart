

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:translateapp/constants/consts.dart';


class Translate {

  final String apiKey = Consts.apiKey;
  final String url =  'https://text-translator2.p.rapidapi.com/translate';

  Future<String> translateText(String text) async {    
    final Map<String, String> requestBody = {
      'source_language': 'en',
      'target_language': 'id',
      'text': 'What is your name?',
    };

    final Uri uri = Uri.parse(url);

    final http.Response response = await http.post(
      uri,
      headers: {
        'content-type': 'application/x-www-form-urlencoded',
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com',
      },
      body: Uri(queryParameters: requestBody).query,
    );

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return decodedResponse['data']['translatedText'];
    } else {
      return "error";
    }
  }

  Future<List<String>> getLanges()async {
    await Future.delayed(const Duration(seconds: 2));
    return ['ar','fr','en','er','rt','em','gt','ht','en','er','rt','em'];
  }

  Future<void> fetchLanguages() async {
    final Uri uri = Uri.parse('$url/getLanguages');
    final Map<String, String> headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com',
    };

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
// const axios = require('axios');

// const options = {
//   method: 'GET',
//   url: 'https://text-translator2.p.rapidapi.com/getLanguages',
//   headers: {
//     'X-RapidAPI-Key': 'e43b430f96mshbe9c333c86b4565p187d56jsn8829ba3be17c',
//     'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com'
//   }
// };

// try {
// 	const response = await axios.request(options);
// 	console.log(response.data);
// } catch (error) {
// 	console.error(error);
// }