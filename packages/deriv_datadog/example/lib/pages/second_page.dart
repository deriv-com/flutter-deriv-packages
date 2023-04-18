import 'package:deriv_datadog/datadog.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {


  SecondPage({Key? key}) : super(key: key);

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
          iconTheme: IconThemeData(color: Colors.black),
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
              Text("DataDog Test App 2"),
              if(count > 0 && count < 5)
                Text("This button doesn't do anything."),
              if(count >= 5 && count < 10)
                Text("STOP CLICKING THE BUTTON IT DOESN'T DO ANYTHING!"),
              if(count >= 10)
                Text("There is an error! Happy now?!", style: TextStyle(color: Colors.red),),
              TextButton(
                onPressed: (){

                  DatadogSdkWrapper().tapEvent("Test Button 2",);


                  setState(() {
                    count++;
                  });


                  if(count >= 10){

                    DatadogSdkWrapper().sourceError(
                        "Error because QA wants to find one!"
                    );

                  }
                },
                child: Text("Test Button 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
