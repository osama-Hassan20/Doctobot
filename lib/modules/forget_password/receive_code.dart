import 'package:doctobot_app_project/modules/forget_password/new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../shared/components/components.dart';

// ignore: must_be_immutable
class ReceiveCode extends StatelessWidget {
  String email;


  ReceiveCode({
    required this.email,

  });
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  String? codee;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/doctobot_logo.png',),
                      height: size.height *0.3,
                    ),
                    Text('Enter activation code',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Check your Phone to Verify your Account',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(height: 20,),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        codee = code;
                        //handle validation or checks here
                      },



                    ),
                    SizedBox(height: 20,),

                    Text('Did not receive the code?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(height: 20,),
                    defaultTextButton(
                      function: (){
                        DocCubit.get(context).forgetPassword(
                          email: email,
                        );
                        },
                      text: 'Resend Code',


                    ),
                    SizedBox(height: 50,),

                    defaultButton(
                      function:(){
                        if(codee!.isNotEmpty){

                          navigateTo(context, NewPassword());
                        }

                      },
                      text: 'verfiy',
                      isUpperCase: true,


                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


