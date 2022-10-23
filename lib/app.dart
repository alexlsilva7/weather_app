import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/controller/autocomplete_controller.dart';
import 'package:weather_app/src/model/repository/autocomplete_repository.dart';
import 'package:weather_app/src/view/home/home_page.dart';
import 'package:weather_app/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final autoRepository = AutoCompleteRepository();
    final providers = [
      ChangeNotifierProvider(
        create: (_) => AutoCompleteController(autoRepository),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
    ];

    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const HomePage(),
        ),
      ),
    );
  }
}
