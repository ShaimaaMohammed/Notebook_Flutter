import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/counter/cubit/cubit.dart';
import 'package:test1/modules/counter/cubit/states.dart';



class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // blocconsumer هو ده بيخلينى اراقب حالات وتغيرات بتحصل
    return  BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context, state) {
          if(state is CounterInitialState) print('InitialState');
          if(state is CounterMinusState) print('MinusState ${state.counter}');
          if(state is CounterPlusState) print('PlusState ${state.counter}');
        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                    CounterCubit.get(context).Minus();
                  },
                      child:Text(
                        'Menus',
                      ) ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  TextButton(onPressed: () {
                    CounterCubit.get(context).Plus();
                  },
                      child:Text(
                        'Plus',
                      ) ),




                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
