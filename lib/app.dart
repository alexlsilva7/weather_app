import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/controller/autocomplete_controller.dart';
import 'package:weather_app/src/model/repository/autocomplete_repository.dart';
import 'package:weather_app/src/view/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final autoRepository = AutoCompleteRepository();
    final providers = [
      ChangeNotifierProvider(
        create: (_) => AutoCompleteController(autoRepository),
      ),
    ];

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
