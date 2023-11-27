import 'package:doctobot_app_project/layout/doc_app/cubit/states.dart';
import 'package:doctobot_app_project/models/get_all_doctors_model.dart';
import 'package:doctobot_app_project/models/get_all_nurses_model.dart';
import 'package:doctobot_app_project/modules/doctors/doctors_screen.dart';
import 'package:doctobot_app_project/modules/home/home_screen.dart';
import 'package:doctobot_app_project/modules/nurses/nurses_screen.dart';
import 'package:doctobot_app_project/modules/settings/settings_screen.dart';
import 'package:doctobot_app_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/add_new_doctors_calender_model.dart';
import '../../../models/add_new_doctors_reservation_model.dart';
import '../../../models/add_new_nurses_reservation_model.dart';
import '../../../models/add_new_nursess_calender_model.dart';
import '../../../models/change_password.dart';
import '../../../models/forget_password_model.dart';
import '../../../models/get_all_category_model.dart';
import '../../../models/profile_model.dart';
import '../../../models/update_profile_model.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/local/cache_helper.dart';

class DocCubit extends Cubit <DocStates>
{
  DocCubit(): super(DocInitialState());

  static DocCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(
      icon:Icon(
        Icons.home_filled,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.people_alt,
      ),
      label: 'Doctors',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.local_hospital,
      ),
      label: 'Nurses',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens=
  [
    HomeScreen(),
    DoctorsScreen(),
    NursesScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    emit(DocChangeBottomNavState());
  }




  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    isDark = ! isDark;
    emit(DocAppChangeModeState());
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(DocAppChangeModeState());
    });
  }


  GetAllCategoriesModel? allCategoriesModel;

  void getAllCategoriesData(){
    emit(DocLoadingAllCategoriesDataState());

    DioHelper.getData(url: ALL_CATEGORIES).then((value) {

      allCategoriesModel =  GetAllCategoriesModel.fromJson(value.data);

      emit(DocSuccessAllCategoriesDataState());
    }).catchError((error){
      print('error ==allCategories==================');
      print(error.toString());
      print('error ====================');
      emit(DocErrorAllCategoriesDataState());
    });
  }
  
  GetAllDoctorsModel? allDoctorsModel;

  void getAllDoctorData(){
    emit(DocLoadingAllDoctorsDataState());

    DioHelper.getData(url: ALL_DOCTORS).then((value) {

      allDoctorsModel =  GetAllDoctorsModel.fromJson(value.data);

      print(allDoctorsModel!.data![0].name);
      print(allDoctorsModel!.data![0].email);
      print(allDoctorsModel!.results);

      emit(DocSuccessAllDoctorsDataState());
    }).catchError((error){
      print('error ==allDoctorsModel==================');
      print(error.toString());
      print('error ====================');
      emit(DocErrorAllDoctorsDataState());
    });
  }


  GetAllNursesModel? allNursesModel;

  void getAllNursesData(){
    emit(DocLoadingAllNursesDataState());

    DioHelper.getData(url: ALL_NURSES).then((value) {

      allNursesModel =  GetAllNursesModel.fromJson(value.data);

      print(allNursesModel!.data![0].name);
      print(allNursesModel!.data![0].email);
      print(allNursesModel!.results);

      emit(DocSuccessAllNursesDataState());
    }).catchError((error){
      print('error =allNursesModel ===================');
      print(error.toString());
      print('error ====================');
      emit(DocErrorAllNursesDataState());
    });
  }


  GetProfileModel? getProfileModel;

  void getProfileData(){
    print('token getProfile Data= ${token}');
    emit(DocLoadingProfileDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {

      getProfileModel =   GetProfileModel.fromJson(value.data);

      emit(DocSuccessProfileDataState());
    }).catchError((error){
      print('error dataProfile ====================');
      print(error.toString());
      print('error ====================');
      emit(DocErrorProfileDataState());
    });
  }

  var token = CacheHelper.getData(key: 'token');

  var Sid = '';


  UpdateProfileModel? updateProfileModel;
  void upDateProfileData({
  required String name,
  required String email,
  required String phone,
  }){
    print('token getProfile Data= ${token}');
    emit(DocLoadingUpDateProfileDataState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name':name,
        'email':email,
        'phone':phone,
      }

    ).then((value) {
      getProfileData();
      updateProfileModel =   UpdateProfileModel.fromJson(value?.data);
      // getProfileData();
      emit(DocSuccessUpDateProfileDataState());
    }).catchError((error){
      print('error UpDateProfileData ====================');
      print(error.toString());
      print('error ====================');
      emit(DocErrorUpDateProfileDataState());
    });
  }

String age = "18 Years";
String gender = "Mall";
String blood_type = "A+";
String address = "altall";
String bio ="You do not have any chronic diseases";

//Doctors_CalenderModel
  AddNew_Doctors_CalenderModel? addNew_Doctors_CalenderModel;
  void addDoctorsCalender({
    required String weekday ,
    required String month ,
    required int day ,
    required String startAt ,
    required String endAt ,
    required String status ,
    required String doctor ,

  })
  {
    emit(addNew_Doctors_CalenderLoadingState());
    DioHelper.postData(
      url: ADD_DR_CALENDER,
      data: {
        'weekday':weekday,
        'month':month,
        'day':day,
        'startAt':startAt,
        'endAt':endAt,
        'status':status,
        'doctor':doctor,

      },

    ).then((value) {
      print(value?.data);
      addNew_Doctors_CalenderModel = AddNew_Doctors_CalenderModel.fromJson(value?.data);
      // print(loginModel!.data!.name);
      // print(loginModel!.data!.email);
      emit(addNew_Doctors_CalenderSuccessState());
    }).catchError((error){
      print('error =======addNew_Doctors_Calender=============');
      print(error.toString());
      print('error ====================');

      emit(addNew_Doctors_CalenderErrorState());

    });
  }

//Doctors_ReservationsModel
  AddNew_Doctors_ReservationsModel? addNew_Doctors_ReservationsModel;
  void addDoctorsReservations({
    required String doctor ,
    required String start ,
    required String end ,
    required String time ,
    required String phone ,
    required String reservationPlace ,
    required String totalPaid ,
    required String paidAt ,

  })
  {
    emit(addNew_Doctors_Reservations_LoadingState());
    DioHelper.postData(
      url: ADD_DR_RESERVATION,
      data: {
        'doctor':doctor,
        'start':start,
        'end':end,
        'time':time,
        'phone':phone,
        'reservationPlace':reservationPlace,
        'totalPaid':totalPaid,
        'paidAt':paidAt,
      },
    ).then((value) {
      print(value?.data);
      addNew_Doctors_ReservationsModel = AddNew_Doctors_ReservationsModel.fromJson(value?.data);
      // print(loginModel!.data!.name);
      // print(loginModel!.data!.email);
      emit(addNew_Doctors_Reservations_SuccessState());
    }).catchError((error){
      print('error =======Doctors_Reservations=============');
      print(error.toString());
      print('error ====================');

      emit(addNew_Doctors_Reservations_ErrorState());

    });
  }


  //Nurses_CalenderModel
  AddNew_Nurses_CalenderModel? addNew_Nurses_CalenderModel;
  void addNursesCalender({
    required String weekday ,
    required String month ,
    required int day ,
    required String startAt ,
    required String endAt ,
    required String status ,
    required String nurse ,

  })
  {
    emit(addNew_Nurses_CalenderLoadingState());
    DioHelper.postData(
      url: ADD_NURSES_CALENDER,
      data: {
        'weekday':weekday,
        'month':month,
        'day':day,
        'startAt':startAt,
        'endAt':endAt,
        'status':status,
        'nurse':nurse,
      },
    ).then((value) {
      print(value?.data);
      addNew_Nurses_CalenderModel = AddNew_Nurses_CalenderModel.fromJson(value?.data);
      // print(loginModel!.data!.name);
      // print(loginModel!.data!.email);
      emit(addNew_Nurses_CalenderSuccessState());
    }).catchError((error){
      print('error =======addNew_Nurses_Calender=============');
      print(error.toString());
      print('error ====================');

      emit(addNew_Nurses_CalenderErrorState());

    });
  }




  //Nurses_ReservationsModel
  AddNew_Nurses_ReservationsModel? addNew_Nurses_ReservationsModel;
  void addNursesReservations({
    required String doctor ,
    required String start ,
    required String end ,
    required String time ,
    required String phone ,
    required String reservationPlace ,
    required var totalPaid ,
    required String paidAt ,

  })
  {
    emit(addNew_Nurses_Reservations_LoadingState());
    DioHelper.postData(
      url: ADD_NURSES_RESERVATION,
      data: {
        'doctor':doctor,
        'start':start,
        'end':end,
        'time':time,
        'phone':phone,
        'reservationPlace':reservationPlace,
        'totalPaid':totalPaid,
        'paidAt':paidAt,
      },
    ).then((value) {
      print(value?.data);
      addNew_Nurses_ReservationsModel = AddNew_Nurses_ReservationsModel.fromJson(value?.data);
      // print(loginModel!.data!.name);
      // print(loginModel!.data!.email);
      emit(addNew_Nurses_Reservations_SuccessState());
    }).catchError((error){
      print('error =======Nurses_Reservations=============');
      print(error.toString());
      print('error ====================');

      emit(addNew_Nurses_Reservations_ErrorState());

    });
  }


  // Forget_Password
  ForgotPasswordModel? forgotPasswordModel;
  void forgetPassword({
    required String email ,


  })
  {
    emit(ForgotPasswordLoadingState());
    DioHelper.postData(
      url: FORGETpASSWORD,
      data: {
        'email':email,
      },
    ).then((value) {
      print(value?.data);
      forgotPasswordModel = ForgotPasswordModel.fromJson(value?.data);
      // print(loginModel!.data!.name);
      // print(loginModel!.data!.email);
      emit(ForgotPasswordSuccessState(forgotPasswordModel!));
    }).catchError((error){
      print('error =======ForgotPassword=============');
      print(error.toString());
      print('error ====================');

      emit(ForgotPasswordErrorState());

    });
  }


  // resetCode

  ForgotPasswordModel? forgotPasswordM;
  void resetCode({
    required String resetCode ,


  })
  {
    emit(ForgotResetCodeLoadingState());
    DioHelper.postData(
      url: RESETCODE,
      data: {
        'resetCode':resetCode,
      },
    ).then((value) {
      print(value?.data);
      forgotPasswordM = ForgotPasswordModel.fromJson(value?.data);
      // print(loginModel!.data!.name);
      // print(loginModel!.data!.email);
      emit(ForgotResetCodeSuccessState());
    }).catchError((error){
      print('error =======resetCode=============');
      print(error.toString());
      print('error ====================');

      emit(ForgotResetCodeErrorState());

    });
  }



  ChangeMyPassword? changeMyPassword;
  void ChangePassword({
    required String password,

  }){
    print('token getProfile Data= ${token}');
    emit(DocLoadingChangeMyPasswordDataState());

    DioHelper.putData(
        url: CHANGEP_ASSWORD,
        token: token,
        data: {
          'password':password,

        }

    ).then((value) {
      changeMyPassword =   ChangeMyPassword.fromJson(value?.data);
      // getProfileData();
      emit(DocSuccessChangeMyPasswordDataState());
    }).catchError((error){
      print('error ChangeMyPassword ====================');
      print(error.toString());
      print('error ====================');
      emit(DocErrorChangeMyPasswordDataState());
    });
  }
}