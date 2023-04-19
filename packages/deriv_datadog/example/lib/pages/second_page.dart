import 'package:deriv_datadog/datadog.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {


  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        setState(() {
          count = 0;
        });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
              if(count > 0 && count < 5)
                const Text("This button doesn't do anything."),
              if(count >= 5 && count < 10)
                const Text("STOP CLICKING THE BUTTON IT DOESN'T DO ANYTHING!"),
              if(count >= 10)
                const Text("There is an error! Happy now?!", style: TextStyle(color: Colors.red),),
              TextButton(
                onPressed: (){

                  DerivDatadogSDK().tapEvent("Test Button 2",);


                  setState(() {
                    count++;
                  });


                  if(count >= 10){

                    DerivDatadogSDK().sourceError(
                        "Error because QA wants to find one!"
                    );

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
}
