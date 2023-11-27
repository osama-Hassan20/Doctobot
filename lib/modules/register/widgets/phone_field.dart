import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import 'controller.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultFormField(
        context: context,
        controller: phoneController,
        type: TextInputType.phone,
        label: 'phone number',
        prefix: Icons.phone,
        validate: (String? value){
          if(value!.isEmpty){
            return'please enter your phone';
          }
        }
    );
  }
}
