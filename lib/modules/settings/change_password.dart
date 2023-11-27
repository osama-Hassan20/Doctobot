import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/layout/doc_app/cubit/states.dart';
import 'package:doctobot_app_project/modules/login/login_screen.dart';
import 'package:doctobot_app_project/shared/components/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
void SignOut(context) {
  CacheHelper.removeDate(key: 'token',).then((value) {
    if(value!){
      navigateAndFinish(context, LoginScreen());

    }
  });
}

// ignore: must_be_immutable
class ChangePassword extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocCubit , DocStates>(

      listener: (BuildContext context, Object? state) {
        if(state is ForgotPasswordSuccessState){

          ShowToast(
              text: 'password has been changed',
              state: ToastState.SUCCESS
          );
          navigateTo(context, LoginScreen());


        }


      },
      builder: (BuildContext context, state)
      {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        ImageLogo(),
                        Text('Change Password',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Enter your New Password',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20,),
                        defaultFormField(

                            context: context,
                            controller: passwordController,
                            type: TextInputType.emailAddress,
                            label: 'New Password',
                            prefix: Icons.lock_outline,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return'please enter your email address';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 50,),


                        Center(
                          child: ConditionalBuilder(
                            condition: state is! ForgotPasswordLoadingState,
                            builder:(context) => defaultButton(
                              function:(){
                                if(formKey.currentState!.validate()){
                                  DocCubit.get(context).ChangePassword(
                                      password: passwordController.text
                                  );
                                  DocCubit.get(context).currentIndex=0;
                                  SignOut(context);
                                }
                              },

                              text: 'send',
                              isUpperCase: true,


                            ),
                            fallback:(context) => Center(child: CircularProgressIndicator()) ,
                          ),
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

    );

  }
}
