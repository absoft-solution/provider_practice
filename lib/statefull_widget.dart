import 'package:flutter/material.dart';

class StatefullWidget extends StatefulWidget {
  const StatefullWidget({super.key});

  @override
  State<StatefullWidget> createState() => _StatefullWidgetState();
}

int x = 0;

class _StatefullWidgetState extends State<StatefullWidget> {
  @override
  Widget build(BuildContext context) {
    // print("Build Reload");
    // print(x);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple State Mgt"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(x.toString()),
          ),
        ],
      ),
    );
  }
}
