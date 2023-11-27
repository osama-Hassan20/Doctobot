import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

Future buildAlertDialog({
  required BuildContext context,
  required String title,
  required String textButton,
  required VoidCallback? onPressed,
})=>showDialog(
  context: context,
  builder: (context) =>
      AlertDialog(
        backgroundColor: DocCubit
            .get(context)
            .isDark ? HexColor('#434343').withOpacity(
            1) : HexColor('#FFFFFF'),
        actions: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('CANCEL',
                    style: TextStyle(
                      color: DocCubit
                          .get(context)
                          .isDark ? HexColor(
                          '#FFFFFF') : HexColor(
                          '#292826'),
                    ),
                  )),
              Spacer(),
              TextButton(
                  onPressed: onPressed,
                  child: Text(textButton,
                    style: TextStyle(
                      color: HexColor('#FF5858'),
                    ),
                  )),
            ],
          )
        ],
        contentPadding: EdgeInsets.all(20),
        content: Text(title,
          style: TextStyle(
            color: DocCubit
                .get(context)
                .isDark
                ? HexColor('#FFFFFF')
                : HexColor('#292826'),
          ),),
      ),
);