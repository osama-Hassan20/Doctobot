

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

void signOut(context) {
  CacheHelper.removeDate(key: 'token',).then((value) {
    if(value!){
      navigateAndFinish(context, LoginScreen());

    }
  });
}

void printFullText(String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token ;


// var myTheme = DocCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light;

