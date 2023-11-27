import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';
import '../cubit/cubit.dart';
import 'controller.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultFormField(
        context: context,
        controller: passwordController,
        type: TextInputType.emailAddress,
        label: 'Password',
        prefix: Icons.lock_outline,
        suffix: RegisterCubit.get(context).suffix,
        onSubmit: (value){},
        isPassword: RegisterCubit.get(context).isPassword,
        suffixPressed: (){
          RegisterCubit.get(context).changePasswordVisibility();
        },
        validate: (String? value){
          if(value!.isEmpty){
            return'password is too short';
          }
        }
    );
  }
}
