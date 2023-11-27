import '../../../models/forget_password_model.dart';

abstract class DocStates{}

class DocInitialState extends DocStates{}

class DocChangeBottomNavState extends DocStates{}

class DocAppChangeModeState extends DocStates{}

class DocLoadingAllCategoriesDataState extends DocStates{}
class DocSuccessAllCategoriesDataState extends DocStates{}
class DocErrorAllCategoriesDataState extends DocStates{}

class DocLoadingAllDoctorsDataState extends DocStates{}
class DocSuccessAllDoctorsDataState extends DocStates{}
class DocErrorAllDoctorsDataState extends DocStates{}


class DocLoadingAllNursesDataState extends DocStates{}
class DocSuccessAllNursesDataState extends DocStates{}
class DocErrorAllNursesDataState extends DocStates{}


class DocLoadingProfileDataState extends DocStates{}
class DocSuccessProfileDataState extends DocStates{}
class DocErrorProfileDataState extends DocStates{}


class DocLoadingUpDateProfileDataState extends DocStates{}
class DocSuccessUpDateProfileDataState extends DocStates{}
class DocErrorUpDateProfileDataState extends DocStates{}


class DocLoadingChangeMyPasswordDataState extends DocStates{}
class DocSuccessChangeMyPasswordDataState extends DocStates{}
class DocErrorChangeMyPasswordDataState extends DocStates{}


//Doctors  Calender
class addNew_Doctors_CalenderLoadingState extends DocStates{}
class addNew_Doctors_CalenderSuccessState extends DocStates{}
class addNew_Doctors_CalenderErrorState extends DocStates{}

//Nurses  Calender
class addNew_Nurses_CalenderLoadingState extends DocStates{}
class addNew_Nurses_CalenderSuccessState extends DocStates{}
class addNew_Nurses_CalenderErrorState extends DocStates{}


//Doctors  Reservations

class addNew_Doctors_Reservations_LoadingState extends DocStates{}
class addNew_Doctors_Reservations_SuccessState extends DocStates{}
class addNew_Doctors_Reservations_ErrorState extends DocStates{}



//Nurses  Reservations
class addNew_Nurses_Reservations_LoadingState extends DocStates{}
class addNew_Nurses_Reservations_SuccessState extends DocStates{}
class addNew_Nurses_Reservations_ErrorState extends DocStates{}


class ForgotPasswordLoadingState extends DocStates{}
class ForgotPasswordSuccessState extends DocStates{
  final ForgotPasswordModel forgotPasswordModel;
  ForgotPasswordSuccessState(this.forgotPasswordModel);
}
class ForgotPasswordErrorState extends DocStates{}



class ForgotResetCodeLoadingState extends DocStates{}
class ForgotResetCodeSuccessState extends DocStates{}
class ForgotResetCodeErrorState extends DocStates{}
