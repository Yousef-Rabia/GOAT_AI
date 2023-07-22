import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goat_ai/layout/cubit/states.dart';


import '../../modules/chat_screen/chat_screen.dart';
import '../../modules/screen_2/screen_2.dart';
import '../../modules/screen_3/screen_3.dart';
import '../../modules/screen_4/screen_4.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens=[
    ChatScreen(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  void changeIndex(index)
  {
    currentIndex=index;
    emit(AppChangeBottomNavBar());
  }

}