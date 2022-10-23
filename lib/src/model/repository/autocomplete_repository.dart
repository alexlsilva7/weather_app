import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/src/model/autocomplete_model.dart';
import 'package:weather_app/src/model/repository/interfaces/i_autocomplete_repository.dart';

class AutoCompleteRepository implements IAutoCompleteRepository {
  @override
  Future<List<AutoCompleteModel>> search(String query) async {
    final response = await http.get(
      Uri.http(
        'dataservice.accuweather.com',
        '/locations/v1/cities/autocomplete',
        {
          'apikey': 'DrEGZduaBOtzp2r3zcFsQBtzNJLaYrps',
          'q': query,
          'language': 'pt-br',
        },
      ),
    );
    if (response.statusCode == 200) {
      final List responseMap = jsonDecode(response.body);
      final models = responseMap
          .map<AutoCompleteModel>((city) => AutoCompleteModel.fromMap(city))
          .toList();

      return models;
    } else {
      throw Exception('Failed to load cities ${response.body}');
    }
  }
}
