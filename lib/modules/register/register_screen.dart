import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/modules/register/widgets/controller.dart';
import 'package:doctobot_app_project/modules/register/widgets/total_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../layout/doc_app/doc_layout.dart';
import '../../shared/components/widgets/image_logo.dart';
import '../login/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create:(BuildContext context) => RegisterCubit() ,
      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (BuildContext context, Object? state) {
          if (state is RegisterSuccessState) {
            ShowToast(
                text: 'Login done successfully',
                state: ToastState.SUCCESS
            );
            CacheHelper.saveData(
              key: 'token',
              value: "Bearer ${state.registerModel.token}",
            ).then((value) {
              navigateAndFinish(context, DocLayout());
            });


          }else if (state is RegisterErrorState){

            ShowToast(
                text:'Incorrect email or password' ,
                state: ToastState.ERROR
            );
          }

        },
        builder: (context , state)
        {
          return Scaffold(

            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding:EdgeInsets.symmetric(

                      horizontal: size.width*0.05,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageLogo(),
                          TotalField(),
                          Center(
                            child: ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder:(context) => defaultButton(
                                function:(){
                                  CacheHelper.removeDate(key: 'token');
                                  if(formKey.currentState!.validate()){
                                    RegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      passwordConfirm: passwordConfirmController.text,
                                      phone: phoneController.text,
                                    );
                                  }

                                },
                                text: 'Create Account',
                                isUpperCase: false,

                              ),
                              fallback:(context) => CircularProgressIndicator() ,
                            ),
                          ),

                          if (size.height>520)
                            SizedBox(
                            height: size.height *0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              ),
                              defaultTextButton(
                                function: (){

                                  navigateTo(context, LoginScreen());
                                },
                                text: 'Login',

                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

