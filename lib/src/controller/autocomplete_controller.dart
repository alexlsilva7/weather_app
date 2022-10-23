import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/model/autocomplete_model.dart';
import 'package:weather_app/src/model/repository/interfaces/i_autocomplete_repository.dart';

class AutoCompleteController extends ChangeNotifier {
  final IAutoCompleteRepository _autoCompleteRepository;

  AutoCompleteController(this._autoCompleteRepository);

  List<AutoCompleteModel> results = [];

  Future<void> searchCity(String search) async {
    try {
      results = await _autoCompleteRepository.search(search);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
