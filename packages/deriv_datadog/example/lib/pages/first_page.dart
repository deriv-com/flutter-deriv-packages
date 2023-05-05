import 'package:deriv_datadog/deriv_datadog.dart';
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
              Hero(
                tag: "datadog_logo",
                child: Image.network(
                  "https://datadog-docs.imgix.net/img/dd_logo_n_70x75.png",
                ),
              ),
              const Text("DataDog Test App 1"),
              TextButton(
                onPressed: () {
                  DerivDatadog().onTapEvent("Test Button 1");

                  Navigator.pushNamed(context, "/second");
                },
                child: const Text("Test Button 1"),
              ),
            ],
          ),
        ),
      );
}
