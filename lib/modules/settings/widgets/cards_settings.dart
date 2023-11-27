import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../layout/doc_app/cubit/cubit.dart';

// ignore: must_be_immutable
class CardsSettings extends StatefulWidget {
  CardsSettings({
    Key? key,
    required this.text,
     this.icon = Icons.arrow_forward_ios,
     this.isRed = false,
     this.isDarkMode = false,
    required this.onTap,
  }) : super(key: key);

  GestureTapCallback? onTap;
  dynamic icon;
  String text;
  bool isRed;
  bool isDarkMode;

  @override
  State<CardsSettings> createState() => _CardsSettingsState();
}

class _CardsSettingsState extends State<CardsSettings> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool _lights = DocCubit
        .get(context)
        .isDark;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 44,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: DocCubit.get(context).isDark
              ? HexColor('#434343')
              : HexColor('#FFFFFF'),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
            horizontal: size.width * 0.02,
          ),
          child: Row(
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.isRed ? HexColor('#FF5858')
                      :DocCubit.get(context).isDark
                      ? HexColor('#FFFFFF').withOpacity(1)
                      : HexColor('#292826'),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              widget.isDarkMode ? Switch.adaptive(
                value: _lights,
                onChanged: (bool value) {
                  DocCubit
                      .get(context)
                      .isDark = !DocCubit
                      .get(context)
                      .isDark;
                  DocCubit.get(context).changeAppMode();
                  setState(() {
                    _lights = value;
                  });
                },)
              :Icon(
                widget.icon,
                size: 12,
                color: widget.isRed ? HexColor('#FF5858') : HexColor('#A5A5A5'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
