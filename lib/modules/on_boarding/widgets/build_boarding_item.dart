import 'package:flutter/material.dart';

import '../model/boarding_model.dart';


// ignore: must_be_immutable
class BuildBoardingItem extends StatelessWidget {
   BuildBoardingItem({Key? key , required this.model}) : super(key: key);
  BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height /28,
        ),
        Text(
          model.title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height /50,
        ),
        Text(
          model.body,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

