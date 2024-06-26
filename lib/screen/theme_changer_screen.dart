import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/theme_provider.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({super.key});

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {
  @override
  Widget build(BuildContext context) {
    print("BBBB");
    final themeChanger = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade200,
          centerTitle: true,
          title: const Text("Theme Changer App"),
        ),
        body: Center(
          child: Consumer<ThemeProvider>(builder: (context, value, child) {
            return Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: Text("Light Mode"),
                  value: ThemeMode.light,
                  groupValue: value.themeMode,
                  onChanged:
                      value.setTheme, // Ensure proper calling of setTheme
                ),
                RadioListTile<ThemeMode>(
                  title: Text("Dark Theme"),
                  value: ThemeMode.dark,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: Text("System Default"),
                  value: ThemeMode.system,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme,
                ),
              ],
            );
          }),
        ));
  }
}
