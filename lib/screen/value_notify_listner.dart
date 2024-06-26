import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _isObscure,
                builder: (context, value, child) {
                  return TextField(
                    obscureText: _isObscure.value,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffix: InkWell(
                          onTap: () {
                            if (_isObscure.value == true) {
                              _isObscure.value = false;
                            } else {
                              _isObscure.value = true;
                            }
                          },
                          child: Icon(_isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: _count,
                builder: (context, value, child) {
                  return Text(
                    _count.value.toString(),
                    style: TextStyle(fontSize: 50),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
