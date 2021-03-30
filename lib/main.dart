import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController ageEDT = new TextEditingController();
  TextEditingController heightEDT = new TextEditingController();
  TextEditingController weightEDT = new TextEditingController();
  TextEditingController waistEDT = new TextEditingController();
  double absi = 0.0;
  int selectedRadio = 0;
  
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }
  
  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('A Body Shape In Calculator'),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sex"),
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 1, 
                              groupValue: selectedRadio, 
                              onChanged: (val){
                                setSelectedRadio(val);
                            }
                            ),
                            Text("Male      "),
                            

                            Radio(
                              value: 2, 
                              groupValue: selectedRadio, 
                              onChanged: (val){
                                setSelectedRadio(val);
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text("Female     "),
        
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("Age"),
                  Container(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: ageEDT,
                    ),
                  ),
                  Text("years"),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("Height"),
                  Container(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: heightEDT,
                    ),
                  ),
                  Text("cm"),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("Weight"),
                  Container(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: weightEDT,
                    ),
                  ),
                  Text("kg"),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("Waist"),
                  Container(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: waistEDT,
                    ),
                  ),
                  Text("cm"),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: Text("Calculate"),
                  onPressed: calculateMe,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Result"),
              SizedBox(
                height: 10,
              ),
              Text("Your ABSI value:  " + absi.toStringAsFixed(3)),
            ],
          )),
        ),
      ),
    );
  }

  void calculateMe() {
    setState(() {
      double height = double.parse(heightEDT.text);
      double weight = double.parse(weightEDT.text);
      double waist = double.parse(waistEDT.text);
      double wc = waist / 100;
      height = height / 100;
      double bmi = weight / height;
      double bmiP = pow(bmi, 2 / 3);
      double heightP = pow(height, 1 / 2);
      absi = wc / (bmiP / heightP);
    });
  }

  void calMale() {}

  void calFemale() {}
}
