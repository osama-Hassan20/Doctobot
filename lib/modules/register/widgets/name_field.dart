import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import 'controller.dart';

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultFormField(
        context: context,
        controller: nameController,
        type: TextInputType.name,
        label: 'Name',
        prefix: Icons.person,
        validate: (String? value){
          if(value!.isEmpty){
            return'please enter your name';
          }
        }
    );
  }
}
