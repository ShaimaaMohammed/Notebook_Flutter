import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test1/modules/home/home_screen.dart';
import 'package:test1/modules/login/login.dart';
import 'package:test1/modules/messenger/messenger_Screen.dart';
import 'package:test1/modules/list_login/list_login.dart';
import 'package:test1/modules/login/login.dart';
import 'package:test1/modules/user/user_screen.dart';
import 'package:test1/modules/counter/counter_screen.dart';
import 'package:test1/modules/Bmi/BMI_screen.dart';
import 'package:test1/modules/Bmi_result/bmi_result_screen.dart';
import 'package:test1/shared/bloc_observar.dart';
import 'layout/todo_app/todo_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver(); // تفاصيل كل بلوك
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreenNew(),

    );
  }

}

