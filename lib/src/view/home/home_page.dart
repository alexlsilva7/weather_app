import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/controller/autocomplete_controller.dart';
import 'package:weather_app/src/model/autocomplete_model.dart';
import 'package:weather_app/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wather App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.brightness_6,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadField<AutoCompleteModel>(
              suggestionsCallback: (string) async {
                if (string.isNotEmpty) {
                  final controller = Provider.of<AutoCompleteController>(
                      context,
                      listen: false);
                  await controller.searchCity(string);
                  return controller.results;
                }
                return [];
              },
              itemBuilder: (context, AutoCompleteModel suggestion) {
                return ListTile(
                  title: Text(suggestion.localizedName!),
                );
              },
              onSuggestionSelected: (AutoCompleteModel suggestion) {
                debugPrint(suggestion.localizedName);
              },
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
