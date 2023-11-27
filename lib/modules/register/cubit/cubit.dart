import 'package:bloc/bloc.dart';
import 'package:doctobot_app_project/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/login_model.dart';
import '../../../models/register_model.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  void userRegister({
    required String name ,
    required String email ,
    required String password ,
    required String passwordConfirm ,
    required String phone ,

  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'name':name,
          'email':email,
          'password':password,
          'passwordConfirm':passwordConfirm,
          'phone':phone,
        },
    ).then((value) {
      print(value?.data);
     registerModel = RegisterModel.fromJson(value?.data);
      // print(registerModel!.dataRegister!.name);
      // print(registerModel!.dataRegister!.email);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error){
      print('error ====================');
      print(error.toString());
      print('error ====================');

      emit(RegisterErrorState(error.toString()));

    });
  }

  IconData suffix = Icons.visibility_outlined;
  IconData suffixpasswordConfirm = Icons.visibility_outlined;
  bool isPassword = true;
  bool ispasswordConfirm = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegisterChangePasswordVisibilityState());
      }

  void changepasswordConfirmVisibility() {
    ispasswordConfirm = !ispasswordConfirm;
    suffixpasswordConfirm =
    ispasswordConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegisterChangeispasswordConfirmVisibilityState());
  }
}