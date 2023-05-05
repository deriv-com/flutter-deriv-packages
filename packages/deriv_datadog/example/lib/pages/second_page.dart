import 'package:flutter/material.dart';

import 'package:deriv_datadog/deriv_datadog.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          setState(() => count = 0);

          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
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
                const Text("DataDog Test App 2"),
                if (count > 0 && count < 5)
                  const Text("This button doesn't do anything."),
                if (count >= 5 && count < 10)
                  const Text(
                      "STOP CLICKING THE BUTTON IT DOESN'T DO ANYTHING!"),
                if (count >= 10)
                  const Text(
                    "There is an error! Happy now?!",
                    style: TextStyle(color: Colors.red),
                  ),
                TextButton(
                  onPressed: () {
                    DerivDatadog().onTapEvent("Test Button 2");

                    setState(() => count++);

                    if (count >= 10) {
                      DerivDatadog().onSourceError("Error because QA wants to find one!");
                    }
                  },
                  child: const Text("Test Button 2"),
                ),
              ],
            ),
          ),
        ),
      );
}
