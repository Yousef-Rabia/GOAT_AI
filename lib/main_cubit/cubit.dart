import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goat_ai/main_cubit/states.dart';
import '../shared/network/local/cache_helper.dart';

class MainCubit extends Cubit<MainStates>
{
  MainCubit():super(MainInitialState());

  static MainCubit get (context) => BlocProvider.of(context);
  bool isDark=false;

  void toggleMode({bool? fromShared})
  {
    if(fromShared==null) {
      isDark = !isDark;
      CacheHelper.putBoolData('isDark', isDark).then((value) {
        emit(MainChangeMode());
      });

    }
    else
    {
      isDark=fromShared;
      emit(MainChangeMode());
    }
  }
}