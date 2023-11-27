import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

// ignore: must_be_immutable
class CardInfo extends StatelessWidget {
  CardInfo({Key? key, required this.text,required this.icon,}) : super(key: key);

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 16,
            backgroundColor: DocCubit.get(context).isDark
                ? HexColor('#E2E2E2').withOpacity(.5)
                : HexColor('#595CFF').withOpacity(0.10),
            child: Icon(
              icon,
              size: 24,
              color: HexColor('#595CFF'),
            )),
        SizedBox(
          height: 6,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: DocCubit.get(context).isDark
                ? HexColor('#FFFFFF').withOpacity(.9)
                : HexColor('#292826'),
          ),
        ),
        SizedBox(
          height: 11,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: DocCubit.get(context).isDark
              ? HexColor('#E2E2E2').withOpacity(.2)
              : HexColor('#E2E2E2').withOpacity(1),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
