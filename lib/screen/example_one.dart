import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    final exampleOneProvider =
        Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Slider with Provider"),
          centerTitle: true,
        ),
        body: Center(
          child: Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Slider(
                      min: 0,
                      max: 1,
                      value: value.value,
                      onChanged: (val) {
                        exampleOneProvider.setValue(val);
                      }),
                  Text(value.value.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          color: Colors.red.withOpacity(value.value),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 300,
                          color: Colors.green.withOpacity(value.value),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 300,
                          color: Colors.blue.withOpacity(value.value),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ));
  }
}
