import 'package:doctobot_app_project/modules/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

// ignore: must_be_immutable
class NewPassword extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                      image: AssetImage('assets/images/doctobot_logo.png',),
                      height: size.height *0.3,
                    ),
                    Text('New password',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Please Enter new Password',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(height: 20,),

                    defaultFormField(
                        context: context,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                        validate: (String? value){
                          if(value!.isEmpty){
                            return'please enter your email address';
                          }
                        }
                    ),
                    SizedBox(
                      height: size.height *0.01,
                    ),
                    defaultFormField(
                        context: context,
                        controller: passwordController,
                        type: TextInputType.emailAddress,
                        label: 'Password',
                        prefix: Icons.lock_outline,
                        onSubmit: (value){
                          if(formKey.currentState!.validate()){

                          }
                        },

                        validate: (String? value){
                          if(value!.isEmpty){
                            return'password is too short';
                          }
                        }
                    ),
                    SizedBox(height: 50,),

                    defaultButton(
                      function:(){
                        // if(formKey.currentState!.validate()){
                        //
                        // }
                        navigateTo(context, LoginScreen());

                      },
                      text: 'save',
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


