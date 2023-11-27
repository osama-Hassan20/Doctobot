import 'package:doctobot_app_project/modules/settings/widgets/title_in_setting.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constant.dart';
import '../terms_of_service.dart';
import 'build_alert_dialog.dart';
import 'cards_settings.dart';

class GeneralCards extends StatelessWidget {
  const GeneralCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleInSetting(text: 'General'),


        const SizedBox(height: 17,),
        CardsSettings(
          text: 'DarkMode',
          onTap: () {},
          isDarkMode: true,
        ),
        const SizedBox(height: 17,),
        CardsSettings(
          text: 'Support',
          onTap: () {},
        ),
        const SizedBox(height: 17,),
        CardsSettings(
          text: 'Share App',
          onTap: () {
            Share.share('com.example.doctobot_app_project');
          },
        ),
        const SizedBox(height: 17,),
        CardsSettings(
          text: 'Privacy Policy',
          onTap: () {
            navigateTo(context, TermsOfService());

          },
        ),
        const SizedBox(height: 17,),
        CardsSettings(
          text: 'LogOut',
          isRed: true,
          onTap: () {
            buildAlertDialog(context: context,
              title: 'Log out of your account?',
              textButton: 'LogOut',
              onPressed: (){
                DocCubit
                    .get(context)
                    .currentIndex = 0;
                signOut(context);
              },
            );
          },
        ),
      ],
    );
  }
}
