import 'package:doctobot_app_project/modules/settings/widgets/title_in_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/components.dart';
import '../../profile/profile.dart';
import '../change_password.dart';
import 'build_alert_dialog.dart';
import 'cards_settings.dart';

class AccountCards extends StatelessWidget {
  const AccountCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleInSetting(text: 'Account'),

        const SizedBox(height: 17,),

        GestureDetector(
          onTap: () {
            navigateTo(context, Profile());
          },
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: DocCubit
                  .get(context)
                  .isDark
                  ? HexColor('#434343').withOpacity(1)
                  : HexColor('#FFFFFF'),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(
                          'assets/images/people.png',),
                      ),
                      SizedBox(width: 5,),
                      // if (DocCubit.get(context).getProfileModel!.data!.name != null)
                      Text(
                        // 'osama',
                        '${DocCubit
                            .get(context)
                            .getProfileModel!
                            .data!
                            .name}',

                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: DocCubit
                              .get(context)
                              .isDark ? HexColor('#FFFFFF')
                              .withOpacity(1) : HexColor(
                              '#292826').withOpacity(1),


                        ),
                      ),


                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 17,),
        CardsSettings(
          text: 'Change Password',
          onTap: () {
            navigateTo(context, ChangePassword());
          },
        ),
        const SizedBox(height: 17,),
        CardsSettings(
          text: 'Notification Settings',
          onTap: () {},
        ),
        const SizedBox(height: 17,),
        CardsSettings(
          text: 'Delete my Account',
          isRed: true,
          onTap: () {
            buildAlertDialog(context: context,
              title: 'Delete of your account?',
              textButton: 'DELETE',
              onPressed: (){},
            );
          },
        ),
        SizedBox(height: 29,),
      ],
    );
  }
}
