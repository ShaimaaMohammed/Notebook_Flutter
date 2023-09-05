import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';



 class UserSreen extends StatelessWidget {
  List<UserModel> user=[
    UserModel(id: 1, name: 'shaimaa mohamed' , phone: '010196545'),
    UserModel(id: 2, name: 'khaled mohamed', phone: '21525656'),
    UserModel(id: 3, name: 'Ahmed Mohamed', phone: '5255555555'),
    UserModel(id: 4, name: 'sayed Anwar', phone: '54515151515'),
    UserModel(id: 5, name: 'sama Mohamed', phone: '525788855'),
    UserModel(id: 6, name: 'noor Anwar', phone: '54596366565'),

  ];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
         title: Text(
             'Users',
         ),

       ),
       body:ListView.separated(
           itemBuilder: (context, index) => builtUserItem(user[index]),
           separatorBuilder: (context, index) => Padding(
             padding: const EdgeInsetsDirectional.only(
               start: 20.0,
             ),
             child: Container(
               width: double.infinity,
               height: 1.0,
               color: Colors.grey[300],
             ),
           ),
           itemCount: user.length)
     );
   }
   Widget builtUserItem(UserModel user) =>Padding(
     padding: const EdgeInsets.all(20.0),
     child: Row(
       children: [
         CircleAvatar(
           radius: 25.0,
           child: Text(
             '${user.id}',style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 25.0,
             color: Colors.white,
           ),
           ),
         ),
         SizedBox(
           width: 20.0,
         ),
         Column(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               '${user.name}',style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25.0,
               color: Colors.black,
             ),
             ),
             Text(
               '${user.phone}',
             ),

           ],
         )
       ],
     ),
   );
 }
