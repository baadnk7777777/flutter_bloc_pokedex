import 'package:flutter/material.dart';
import 'package:flutter_pokemon_complete/router/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
