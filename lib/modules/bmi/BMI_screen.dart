import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test1/modules/Bmi_result/bmi_result_screen.dart';


class BmiScreen extends StatefulWidget {

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  //Color? color = Colors.grey[400];

  bool isMale = true;
  double height=120;
  double weight=40;
  int age=20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ) ,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child:GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/male.png'),
                            height: 90.0,
                            width: 90.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(borderRadius:
                        BorderRadius.circular(10.0),
                        color: isMale? Colors.blue: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/female.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(borderRadius:
                        BorderRadius.circular(10.0),
                          color: isMale? Colors.grey[400] :Colors.blue,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ),
          Expanded (
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 40.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value:height,
                        max: 220,
                        min: 80,
                        onChanged:(value) {
                          setState(() {
                            height=value;
                          });
                        },)


                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[400]),
              ),
            )
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 40.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },mini:true,
                                child: Icon(
                                Icons.remove
                              ),
                              ),
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },mini:true,
                                child: Icon(
                                    Icons.add,
                                ),
                              ),

                            ],
                          )

                        ],
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 40.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },mini:true,
                                child: Icon(
                                    Icons.remove
                                ),
                              ),
                              FloatingActionButton(onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },mini:true,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),

                            ],
                          )

                        ],
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400]),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(onPressed: () {
              double result =weight /pow(height/ 100,2);
              print(result.round());
              Navigator.push(context,
                  MaterialPageRoute(
                    builder:(context) => BmiResultScreen(
                      age: age,
                      isMale: isMale,
                      result: result.round(),
                    ),
                    ),);
            }, height: 50.0,
              child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ) ,
                ),
              ),
            ),),
          ),

        ],
      ),
    );
  }
}


