import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

// ignore: must_be_immutable
class TextTitleAvailable extends StatelessWidget {
   TextTitleAvailable({Key? key , required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: DocCubit.get(context).isDark
              ? HexColor('#FFFFFF')
              : HexColor('#707070'),
          fontSize: 15,
          fontWeight: FontWeight.bold),
    );
  }
}
