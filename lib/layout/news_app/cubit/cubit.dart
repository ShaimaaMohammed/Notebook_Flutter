import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/news_app/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() :super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);

}