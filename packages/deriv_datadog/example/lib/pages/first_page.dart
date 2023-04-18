import 'package:deriv_datadog/datadog.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {


  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text("DataDog Test App 1"),
            TextButton(
                onPressed: (){
            
                  DatadogSdkWrapper().tapEvent("Test Button 1",);
            
                  // Navigator.pushNamed(context, "/second");
                },
                child: Text("Test Button 1"),
              ),
          ],
        ),
      ),
    );
  }
}
