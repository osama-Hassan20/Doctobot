import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage(
          'assets/images/doctobot_logo.png',
        ),
        // fit: BoxFit.contain,
        height: 200,
        // width: double.infinity,
      ),
    );
  }
}
