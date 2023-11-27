import 'package:doctobot_app_project/layout/doc_app/cubit/states.dart';
import 'package:doctobot_app_project/shared/blocobserver.dart';
import 'package:doctobot_app_project/shared/components/constant.dart';
import 'package:doctobot_app_project/shared/network/local/cache_helper.dart';
import 'package:doctobot_app_project/shared/network/remote/dio_helper.dart';
import 'package:doctobot_app_project/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/doc_app/cubit/cubit.dart';
import 'layout/doc_app/doc_layout.dart';
import 'modules/login/login_screen.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key:'isDark');
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key:'onBoarding');
  token = CacheHelper.getData(key:'token');
  print('token ==   ${token}');
  if(onBoarding != null)
  {
    if(token != null)
    {
      widget = DocLayout();
    }else
    {
      widget = LoginScreen();
    }
  }else
  {
    widget = OnBoardingScreen();
  }

  runApp (MyApp(
    isDark: isDark,
    startWidget: widget ,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;
  MyApp( {
    required this.isDark,
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DocCubit()..changeAppMode(fromShared: isDark,)..getAllCategoriesData()..getAllDoctorData()..getAllNursesData()..getProfileData(),
      child: BlocConsumer <DocCubit , DocStates>(
        listener: (context , state) {},
        builder: (context , state)
        {
          return  MaterialApp(
                debugShowCheckedModeBanner:false ,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: DocCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                home:startWidget,
              );
        },
      ),
    );
  }
}
