import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import 'box_chatboot.dart';
import 'boxes_home_details.dart';
import 'grid_view_specialty.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ConditionalBuilder(
      condition: DocCubit.get(context).allCategoriesModel != null &&DocCubit.get(context).allDoctorsModel != null && DocCubit.get(context).allNursesModel != null ,
      builder: (context) => SingleChildScrollView(

        //physics: BouncingScrollPhysics(),
        child: Column(

          children: [

            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: size.height*0.028,
                horizontal: size.width*0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxesHomeDetails(),
                  ChatBootItem(),
                  SizedBox(height: size.height *0.03,),
                  GridViewSpecialty(),
                ],
              ),
            ),
          ],
        ),
      ),
      fallback: (context)=>Center(child: CircularProgressIndicator()),
    );
  }
}
