import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/shared/cubit/cubit.dart';

Widget defaultButton({
  double redius = 0.0,
  required double width,
  required Color background,
  required String text,
  required function,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(redius),
        color: background,
      ),
    );

Widget defaultFormFieled({
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  onChange,
  onTap,
  bool isPassword = false,
  bool isClickable = true,
  required validator,
  required String label,
  required IconData prefix,
  IconData? suffix,
  suffixPrassed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      //@ make
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPrassed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );

Widget builtTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDate(
          id: model['id'],
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${model['date']}',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '${model['time']}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
              onPressed: () {
                AppCubit.get(context).update(
                  status: 'done',
                  id: model['id'],
                );
              },
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context).update(
                    status: 'archive',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );

Widget tasksBuilder({
  required List<Map> Data,
}) =>
    Data.length > 0
        ? ListView.separated(
            itemBuilder: (context, index) =>
                builtTaskItem(Data[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: Data.length,
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  size: 100,
                  color: Colors.grey,
                ),
                Text(
                  'NO Tasks yet, please Add Some Tasks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );
