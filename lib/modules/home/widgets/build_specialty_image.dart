import 'package:flutter/material.dart';

import '../../../models/get_all_category_model.dart';

// ignore: must_be_immutable
class SpecialtyImage extends StatelessWidget {
  SpecialtyImage({required this.model,});
  DataCategories model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height: 180,
      decoration: BoxDecoration(

        image:DecorationImage(
          image:  NetworkImage('${model.image}',

          ),
        ) ,
      ),

    );
  }
}
