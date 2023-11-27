import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../layout/doc_app/cubit/cubit.dart';
import 'account_cards.dart';
import 'general_cards.dart';

class SettingsDetails extends StatelessWidget {
  const SettingsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ConditionalBuilder(
      condition: DocCubit
          .get(context)
          .getProfileModel!
          .data != null && DocCubit
          .get(context)
          .allCategoriesModel != null && DocCubit
          .get(context)
          .allDoctorsModel != null && DocCubit
          .get(context)
          .allNursesModel != null,
      builder: (context) =>

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.045,
                horizontal: size.width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountCards(),
                  GeneralCards(),
                ],
              ),
            ),
          ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  }
}
