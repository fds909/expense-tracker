import 'package:expense_tracker/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        final routes = {
          HomePage.routeName: (_) => HomePage(),
        };

        return MaterialPageRoute(
          builder: routes[settings.name]!,
        );
      },
    );
  }
}
