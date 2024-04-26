import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("DataDog Test App 1"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second");
                },
                child: const Text("Test Button 1"),
              ),
            ],
          ),
        ),
      );
}
