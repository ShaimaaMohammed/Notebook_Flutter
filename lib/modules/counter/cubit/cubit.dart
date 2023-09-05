import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit ():super(CounterInitialState());


  static CounterCubit get(context) => BlocProvider.of(context);
  int counter=1;
  void Minus(){
    counter --;
    emit(CounterMinusState(counter));
  }
  void Plus(){
    counter ++;
    emit(CounterPlusState(counter));
  }
}
// emit بتساعدنى اغير حاله