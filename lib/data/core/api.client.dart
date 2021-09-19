import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/data/core/api.constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  // Dynamic as return type, because this can return any type of model.
  dynamic get(String path) async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.TMDB_BASE_URL}$path?api_key=${ApiConstants.TMDB_API_KEY}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
