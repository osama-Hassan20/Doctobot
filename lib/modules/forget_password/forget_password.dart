import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctobot_app_project/layout/doc_app/cubit/states.dart';
import 'package:doctobot_app_project/modules/forget_password/receive_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../shared/components/components.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<DocCubit, DocStates>(
      listener: (BuildContext context, Object? state) {
        if (state is ForgotPasswordSuccessState) {
          ShowToast(
              text: state.forgotPasswordModel.message!,
              state: ToastState.SUCCESS);
          navigateTo(
              context,
              ReceiveCode(
                email: emailController.text,
              ));
        }
        if (state is ForgotPasswordErrorState) {
          ShowToast(
              text: "There is no user with that email ${emailController.text}",
              state: ToastState.ERROR);
        }
      },
      builder: (BuildContext context, state) {
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
                        Image(
                          image: AssetImage(
                            'assets/images/doctobot_logo.png',
                          ),
                          height: size.height * 0.3,
                        ),
                        Text(
                          'Forget Password',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Enter your Email Address below to receive a reset code.',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
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
                            }),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: ConditionalBuilder(
                            condition: state is! ForgotPasswordLoadingState,
                            builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  DocCubit.get(context).forgetPassword(
                                    email: emailController.text,
                                  );
                                }
                              },
                              text: 'send',
                              isUpperCase: true,
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
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
