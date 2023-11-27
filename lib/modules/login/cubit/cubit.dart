import 'package:bloc/bloc.dart';
import 'package:doctobot_app_project/modules/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);



  LoginModel? loginModel;
  void userLogin({
    required String email ,
    required String password ,

  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        },
    ).then((value) {
      print(value?.data);

      loginModel = LoginModel.fromJson(value?.data);
      print(loginModel!.data!.name);
      print(loginModel!.data!.email);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      print('error ====================');
      print(error.toString());
      print('error ====================');

      emit(LoginErrorState(error.toString()));

    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
      }
}