import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import 'controller.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultFormField(
        context: context,
        controller: emailController,
        type: TextInputType.emailAddress,
        label: 'Email',
        prefix: Icons.email_outlined,
        validate: (String? value){
          if(value!.isEmpty){
            return'please enter your email address';
          }
        }
    );
  }
}
