import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNaviationBarCubit extends Cubit<int>{
BottomNaviationBarCubit():super(0);
 int currentIndex = 0;

 changeIndex(int index){
   
    currentIndex=index;
    emit(index);
}

  static get(context) {}

}