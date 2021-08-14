import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

//
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
/*

*
*
*

*/
  var yourName = TextEditingController();
  var yourPartName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? lovepercentage;
  var loading = false;
  var isDark = true;

  // calculator event
  void calculateLove() {
    if (formKey.currentState!.validate()) {
      setState(() {
        loading = true;
        lovepercentage = null;
      });

      Timer(
          Duration(seconds: 3),
          () => {
                setState(() {
                  if (yourName.text.toLowerCase() == "rion") {
                    lovepercentage = Random().nextInt(10);
                    loading = false;
                    yourName = TextEditingController(text: "");
                    yourPartName = TextEditingController(text: "");
                  } else {
                    lovepercentage = Random().nextInt(100);
                    loading = false;
                    yourName = TextEditingController(text: "");
                    yourPartName = TextEditingController(text: "");
                  }
                })
              });
    } else {
      return;
    }
  }

  String? validate(text) {
    if (text!.isEmpty) return "Please Enter name ";
  }

  InputDecoration? myInputDecorator(text) {
    return InputDecoration(
      hintText: text,
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    print("build called");
    return MaterialApp(
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 30, color: Colors.redAccent)),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "JOKES App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            // backgroundColor: Colors.pink,
          ),
          body: Container(
            // color: Colors.purple,
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(20)),
                  TextFormField(
                    controller: yourName,
                    validator: (text) => validate(text),
                    decoration: myInputDecorator("Enter your Name"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: yourPartName,
                    validator: (text) => validate(text),
                    decoration: myInputDecorator("Enter your Partner Name"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: calculateLove,
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: Text(
                      "Calculate",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (loading)
                    CircularProgressIndicator(
                        // valueColor: AlwaysStoppedAnimation(Colors.pink),
                        ),
                  (lovepercentage != null)
                      ? Text(
                          "${yourName.text} and ${yourPartName.text} love Pargcentage is $lovepercentage%",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(""),
                  Switch(
                      value: isDark,
                      onChanged: (val) {
                        setState(() {
                          isDark = val;
                        });
                        print(val);
                      })
                ],
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
