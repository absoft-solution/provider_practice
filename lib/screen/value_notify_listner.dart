import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  ValueNotifier _count = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("AppBar"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
        },
        child: Icon(
          Icons.add,
          color: const Color.fromRGBO(33, 150, 243, 1),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: _count,
          builder: (context, value, child) {
            return Center(
              child: Text(
                _count.value.toString(),
                style: TextStyle(fontSize: 50),
              ),
            );
          }),
    );
  }
}
