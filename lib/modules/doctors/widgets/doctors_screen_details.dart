import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/widgets/search_text_field.dart';
import '../../../shared/components/widgets/text_title_available.dart';
import 'boxes_doctors_details.dart';
import 'list_of_all_doctors.dart';

class DoctorsScreenDetails extends StatelessWidget {
  const DoctorsScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ConditionalBuilder(
      condition: DocCubit.get(context).allCategoriesModel != null &&
          DocCubit.get(context).allDoctorsModel != null &&
          DocCubit.get(context).allNursesModel != null,
      builder: (context) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchTextField(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.028,
                horizontal: size.width * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxesDoctorsDetails(),
                  TextTitleAvailable(text: 'Available Doctors'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  ListOfAllDoctors(),
                ],
              ),
            ),
          ],
        ),
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  }
}
