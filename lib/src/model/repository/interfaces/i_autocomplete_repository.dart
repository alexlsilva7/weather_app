import 'package:weather_app/src/model/autocomplete_model.dart';

abstract class IAutoCompleteRepository {
  Future<List<AutoCompleteModel>> search(String query);
}
