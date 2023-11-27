import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

// ignore: must_be_immutable
class BoxDetails extends StatelessWidget {
  BoxDetails({required this.title,required this.body,this.width=0.45});
  String title;
  String body;
  var width ;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width *width,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: DocCubit.get(context).isDark ? HexColor('#434343').withOpacity(1) : HexColor('#FFFFFF'),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height*0.022,
          horizontal: size.width*0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: DocCubit.get(context).isDark ? HexColor('#FFFFFF').withOpacity(1) : HexColor('#707070'),
                ),
              ),
            ),
            Spacer(),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                body,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: DocCubit.get(context).isDark ? HexColor('#FFFFFF').withOpacity(1) :HexColor('#292826'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
