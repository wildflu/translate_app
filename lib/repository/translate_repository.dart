

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:translateapp/constants/consts.dart';


class Translate {

  final String apiKey = Consts.apiKey;
  final String url =  'https://text-translator2.p.rapidapi.com/translate';

  Future<String> translateText(String text, String sourceLang, String targetLang) async {
    final Map<String, String> requestBody = {
      'source_language': sourceLang,
      'target_language': targetLang,
      'text': text,
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


  Future<String> fetchLanguages() async {
    final String key = apiKey;
    final Uri url = Uri.parse('https://text-translator2.p.rapidapi.com/getLanguages');
    final Map<String, String> headers = {
      'X-RapidAPI-Key': key,
      'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com',
    };
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return 'error';
      }
    } catch (error) {
      print('Error: $error');
      return 'error';
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