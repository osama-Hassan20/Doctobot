import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/layout/doc_app/doc_layout.dart';
import 'package:doctobot_app_project/modules/forget_password/forget_password.dart';
import 'package:doctobot_app_project/shared/components/widgets/image_logo.dart';
import 'package:doctobot_app_project/shared/components/widgets/text_title_of_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../layout/doc_app/cubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, Object? state) {
          if (state is LoginSuccessState) {
            ShowToast(
                text: 'Login done successfully', state: ToastState.SUCCESS);

            CacheHelper.saveData(
              key: 'token',
              value: "Bearer ${state.loginModel.token}",
            ).then((value) {
              navigateAndFinish(context, DocLayout());
            });
          } else if (state is LoginErrorState) {
            ShowToast(
                text: 'Incorrect email or password', state: ToastState.ERROR);
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            //backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageLogo(),
                          TextTitleOfPage(text: 'Login'),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          defaultFormField(
                            context: context,
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          defaultFormField(
                            context: context,
                            controller: passwordController,
                            type: TextInputType.emailAddress,
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            suffix: LoginCubit.get(context).suffix,
                            isPassword: LoginCubit.get(context).isPassword,
                            suffixPressed: () {
                              LoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextButton(
                            function: () {
                              navigateTo(context, ForgetPassword());
                            },
                            text: 'Forget Password',
                          ),
                          Center(
                            child: ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                                isUpperCase: true,
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: DocCubit.get(context).isDark
                                      ? HexColor('#E2E2E2').withOpacity(.8)
                                      : HexColor('#292826'),
                                ),
                              ),
                              defaultTextButton(
                                function: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                text: 'Register Now',
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
