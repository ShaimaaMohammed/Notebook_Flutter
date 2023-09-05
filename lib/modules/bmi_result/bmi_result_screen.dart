import 'package:flutter/material.dart';


class BmiResultScreen extends StatelessWidget {

  final int result;
  final bool isMale;
  final int age;

  BmiResultScreen({
    required this.result,
    required this.isMale,
    required this.age,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'BMI RESULT',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ) ,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gander : ${isMale?'MALE':'FEMALE'}',style:
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            ),
            Text(
              'Result : $result',style:
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            ),
            Text(
              'Age : $age',style:
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            ),


          ],
        ),
      ),
    );
  }
}
