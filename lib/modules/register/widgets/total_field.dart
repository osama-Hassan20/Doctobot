import 'package:doctobot_app_project/modules/register/widgets/phone_field.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/widgets/text_title_of_page.dart';
import 'email_field.dart';
import 'name_field.dart';
import 'password_conf_field.dart';
import 'password_field.dart';

class TotalField extends StatelessWidget {
  const TotalField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        TextTitleOfPage(text: 'Create an Account'),
        SizedBox(
          height: size.height *0.01,
        ),
        NameField(),
        SizedBox(
          height: size.height *0.01,
        ),
        PhoneField(),
        SizedBox(
          height: size.height *0.01,
        ),
        EmailField(),
        SizedBox(
          height: size.height *0.01,
        ),
        PasswordField(),
        SizedBox(
          height: size.height *0.01,
        ),
        PasswordConfirmField(),
        SizedBox(
          height: size.height *0.025,
        ),
      ],
    );
  }
}
