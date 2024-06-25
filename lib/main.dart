import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';
import 'package:provider_practice/provider/fav_provider.dart';
import 'package:provider_practice/provider/theme_provider.dart';

import 'package:provider_practice/screen/theme_changer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
          ),
          darkTheme: ThemeData(
              brightness: Brightness.light, primarySwatch: Colors.blue),
          home: const ThemeChangerScreen(),
        );
      }),
    );
  }
}
