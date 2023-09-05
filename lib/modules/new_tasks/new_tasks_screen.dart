import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/shared/components/component.dart';
import 'package:test1/shared/components/consists.dart';
import 'package:test1/shared/cubit/cubit.dart';
import 'package:test1/shared/cubit/states.dart';



class NewTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks= AppCubit.get(context).newTasks;
        return (tasks.length>0?ListView.separated(
            itemBuilder: (context, index) => builtTaskItem(tasks[index],context),
            separatorBuilder: (context, index) =>Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                width:double.infinity,
                height: 1,
                color: Colors.grey[200],
              ),
            ),
            itemCount: tasks.length):
        tasksBuilder( Data:tasks));
      },
    );
  }
}
