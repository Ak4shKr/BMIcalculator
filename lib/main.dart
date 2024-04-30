// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('yourBMI')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your weight'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Enter your height in feet'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your height in inches'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      // foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        color: Colors.white, // Set text color to white
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        // Border shape
                        borderRadius: BorderRadius.circular(8), // Border radius
                      ),
                    ),
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        // Perform BMI calculation here

                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);

                        var msg = "";

                        if (bmi > 25) {
                          msg = "you're overweight!!";
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "you're underweight!!";
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = "you're underControl!!!";
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              '$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required fields!";
                        });
                      }
                    },
                    child: Text("Calculate BMI"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(result,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
