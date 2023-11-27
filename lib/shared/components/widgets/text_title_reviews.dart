import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

class TextTitleReviews extends StatelessWidget {
  const TextTitleReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Reviews',
      style: TextStyle(
        color: DocCubit.get(context).isDark ? HexColor('#FFFFFF') :HexColor('#707070'),
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
