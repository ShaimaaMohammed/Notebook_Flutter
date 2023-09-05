import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/shared/components/component.dart';
import 'package:test1/shared/cubit/cubit.dart';
import 'package:test1/shared/cubit/states.dart';
import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';
import '../../shared/components/consists.dart';




class HomeScreenNew extends StatelessWidget {

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, Object? state) {
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, Object? state) {
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(

            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.title[cubit.currentIndex],
              ),
            ),
            body: (state is! AppGetDatabaseLoadingState)
                ? cubit.screens[cubit.currentIndex]
                :  Center(child: CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton(onPressed: () async
            {

              if (cubit.isButtomSheetShown) {
                if (formKey.currentState!.validate()) {
                  cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text);
                }
                titleController = TextEditingController();
                timeController = TextEditingController();
                dateController = TextEditingController();
              }
              else {
                scaffoldKey.currentState
                    ?.showBottomSheet(
                      (context) =>
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0,),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormFieled(
                                controller: titleController,
                                type: TextInputType.text,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'title must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task Title',
                                prefix: Icons.title,

                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormFieled(
                                controller: timeController,
                                type: TextInputType.datetime,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'time must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task Time',
                                prefix: Icons.access_time,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text =
                                        value!.format(context).toString();
                                    print(value!.format(context));
                                  });
                                },
                                //isClickable: false,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormFieled(
                                  controller: dateController,
                                  //isClickable: false,
                                  type: TextInputType.datetime,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Date',
                                  prefix: Icons.calendar_today,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-05-03'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMMd().format(value!);
                                    });
                                  }
                              ),

                            ],
                          ),
                        ),
                      ),
                  elevation: 15.0,)
                    .closed
                    .then((value) {
                      cubit.changeButtomSheetShown(
                          isShow: false,
                          icon:Icons.edit );
                });
                cubit.changeButtomSheetShown(
                    isShow: true,
                    icon:Icons.add );
              }
            },
              child: Icon(
                cubit.febIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              elevation: 50.0,
              onTap: (index) {
                 cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(
                  Icons.menu,
                ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(icon: Icon(
                  Icons.check_circle_outline,
                ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(icon: Icon(
                  Icons.archive_outlined,
                ),
                  label: 'Archived',
                ),

              ],),

          );
        },
      ),
    );
  }

  Future<String> getNme() async {
    return 'Shaimaa Mohamed';
  }







}


//try{
//var name =await getNme();
//print(name);
//}catch(error){
//print('error ${error.toString()}');
//}
