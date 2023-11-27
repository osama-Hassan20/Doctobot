import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import '../../../chatboot/chat_boot.dart';
import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/components.dart';

class ChatBootItem extends StatelessWidget {
  const ChatBootItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/download.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor('#292826').withOpacity(0.30),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.028,
            horizontal: size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Need an assistance?',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: DocCubit.get(context).isDark
                      ? HexColor('#FCFCFC').withOpacity(.8)
                      : HexColor('#FCFCFC'),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Chat with Us, Solve Problems Faster.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: DocCubit.get(context).isDark
                      ? HexColor('#FCFCFC').withOpacity(.8)
                      : HexColor('#FCFCFC'),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              defaultButton(
                function: () {
                  navigateTo(context, ChatBoot());
                },
                text: 'Chat with Us',
                width: size.width * 0.31,
                height: 28,
                background: HexColor('#595CFF'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
