import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

// ignore: must_be_immutable
class TextTitleOfPage extends StatelessWidget {

  TextTitleOfPage({required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            color: DocCubit.get(context).isDark
                ? HexColor('#FFFFFF')
                : HexColor('#2B343D'),
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
