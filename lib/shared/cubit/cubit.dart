import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/shared/cubit/states.dart';

import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';


class AppCubit extends Cubit<AppStates>{
  AppCubit()  : super(AppInitialState());


  static AppCubit get(context) =>BlocProvider.of(context);
  int currentIndex = 0;
  late Database database;
  List<Map> newTasks=[];
  List<Map> doneTasks=[];
  List<Map> archivedTasks=[];
  List<Widget> screens = [
    NewTasksScreen(),
    doneTasksScreen(),
    archivedTasksScreen(),
  ];
  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changeIndex (int index){
    currentIndex =index;
    emit(AppChangeButtomNavBarState());
  }

  void createDatabase()  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('create table');
        }).catchError((error) {
          print('error when create table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database=value;
      emit(AppCreateDatabaseState());
     });
  }


  insertToDatabase({
    required String title,
    required String time,
    required String date,

  }) async{
    await database.transaction((txn) async
    {
      await txn.rawInsert(
          'INSERT INTO tasks (title,date,time,status) VALUES("$title","$time","$date","new")')
          .then((value) {
        print('$value insert sucessfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('error when inserting new record ${error.toString()}');
      });
    });
  }


  void getDataFromDatabase(database) {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];

    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
          {
            if(element['status']=='new'){
              newTasks.add(element);
            }else if(element['status']=='done'){
              doneTasks.add(element);
            }else{
              archivedTasks.add(element);
            }
           });

      emit(AppGetDatabaseState());
    });
  }

  void update({
    required String status,
    required int id,
})async{
    await database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }


  void deleteDate({
    required int id,
  })async{
    await database.rawDelete(
      'DELETE FROM tasks WHERE  id = ?',
      [id]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }


  bool isButtomSheetShown = false;
  IconData febIcon = Icons.edit;

  void changeButtomSheetShown(
  {
    required bool isShow,
    required IconData icon,
  }){
    isButtomSheetShown= isShow;
    febIcon =icon ;
    emit(AppchangeButtomSheetShownState());
  }
}