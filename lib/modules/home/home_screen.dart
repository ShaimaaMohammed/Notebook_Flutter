import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.teal,
        leading:const Icon(
            Icons.menu,),
        title: const Text(
          'First App',
      ),
        actions: [
          IconButton(onPressed: (){
            print('notifcation');
          }
            , icon: Icon(Icons.notification_important
          ),
          ),
          IconButton(onPressed: (){
            print('search');
          }, icon: Icon(Icons.search
          ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              child: Text('First Text',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              color:Colors.amberAccent,
              child: Text('Second Text',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              color: Colors.cyanAccent,
              child: Text('Third Text',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              color: Colors.lightGreen,
              child: Text('Forth Text',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20.0
                  ),
                  // borderRadius:BorderRadiusDirectional.only(
                  //                   topStart: Radius.circular(20.0)
                  //                   )
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                          image: NetworkImage('https://cdn2.stylecraze.com/wp-content/uploads/2013/07/25-Most-Beautiful-Blue-Flowers.jpg'
                          ),
                          height: 200.0,
                          width: 200.0,
                          fit: BoxFit.cover,
                      ),
                      Container(
                        width: 200.0,
                        color:Colors.lightBlueAccent.withOpacity(0.6),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),

                        child: Text(
                          'Flower',
                          textAlign:TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),

    );
  }

}