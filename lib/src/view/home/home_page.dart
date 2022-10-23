import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/controller/autocomplete_controller.dart';
import 'package:weather_app/src/model/autocomplete_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
                print(suggestion.localizedName);
              },
            ),
            // Consumer<AutoCompleteController>(
            //   builder: (context, controller, child) {
            //     return Expanded(
            //       child: ListView.builder(
            //         itemCount: controller.results.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(controller.results[index].localizedName!),
            //           );
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
