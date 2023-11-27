import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../models/get_all_category_model.dart';

// ignore: must_be_immutable
class SpecialtyName extends StatelessWidget {
  SpecialtyName({required this.model,});
  DataCategories model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 12,left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model.name}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:DocCubit.get(context).isDark ? HexColor('#FFFFFF') : HexColor('#292826'),

            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,

          ),

        ],
      ),
    );
  }
}
