import 'package:doctobot_app_project/modules/home/widgets/build_specialty_image.dart';
import 'package:doctobot_app_project/modules/home/widgets/build_specialty_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../models/get_all_category_model.dart';
import '../../../shared/components/components.dart';
import '../../doctors/doctor_category.dart';

// ignore: must_be_immutable
class BuildSpecialtyItem extends StatelessWidget {
  BuildSpecialtyItem({required this.model,required this.context,required this.index,});
  DataCategories model;
  BuildContext context;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context, DoctorsCategoryScreen(i_ndex:index,infoDataCategories: model,));
      },
      child: Container(
        color: DocCubit.get(context).isDark ? Colors.black.withOpacity(.1) : HexColor('#FFFFFF'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpecialtyImage(model: model),
            SpecialtyName(model: model),
          ],
        ),
      ),
    );
  }
}
