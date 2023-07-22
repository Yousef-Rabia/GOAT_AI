import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:switcher_button/switcher_button.dart';

import '../main_cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Image.asset('assets/images/logo1.png'),
            ),
            title: const Text('GOAT AI'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Center(
                  child: SwitcherButton(
                    value:  !MainCubit.get(context).isDark,
                    onColor: Colors.grey[200]!,
                    onChange: (value) {
                      MainCubit.get(context).toggleMode();
                    },
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar:  Container(
            decoration: BoxDecoration(
              color: MainCubit.get(context).isDark?Colors.black:Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: MainCubit.get(context).isDark?Colors.white.withOpacity(.1):Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[900]!,
                  haptic: true, // haptic feedback
                  gap: 8,
                  tabActiveBorder: Border.all(color: Colors.black, width: 1),
                  activeColor: MainCubit.get(context).isDark?Colors.white:Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: MainCubit.get(context).isDark?HexColor('333739'):Colors.white,
                  color: Colors.grey,
                  tabs: const [
                    GButton(
                      icon: CupertinoIcons.chat_bubble_text,
                      text: 'Chat',
                    ),
                    GButton(
                      icon: Icons.summarize,
                      text: 'Summarization',
                    ),
                    GButton(
                      icon: CupertinoIcons.photo,
                      text: 'Image',
                    ),
                    GButton(
                      icon: CupertinoIcons.info,
                      text: 'Info',
                    ),
                  ],
                  onTabChange: (index) {
                    AppCubit.get(context).changeIndex(index);
                  },
                ),
              ),
            ),
          ),

          body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
        );
      },);
  }
}
