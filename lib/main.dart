import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goat_ai/shared/network/local/cache_helper.dart';
import 'package:goat_ai/shared/styles/themes.dart';


import 'firebase_options.dart';
import 'layout/cubit/cubit.dart';
import 'layout/layout.dart';
import 'main_cubit/cubit.dart';
import 'main_cubit/states.dart';
import 'modules/chat_screen/cubit/cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool? IsDark= false  ;
  if(CacheHelper.getData('isDark')!=null) {
    IsDark= CacheHelper.getData('isDark');
  }



  runApp(MyApp(IsDark!));
}

class MyApp extends StatelessWidget {
  late final bool IsDark;

  MyApp(this.IsDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>MainCubit()..toggleMode(fromShared: IsDark),),
        BlocProvider(create: (BuildContext context) =>AppCubit()),
        BlocProvider(create: (BuildContext context) =>ChatCubit()),
      ],
      child: BlocConsumer<MainCubit,MainStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            title: 'GOAT AI',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme:darkTheme,
            themeMode:MainCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: Layout(),
          );
        },
      ),

    );
  }
}

