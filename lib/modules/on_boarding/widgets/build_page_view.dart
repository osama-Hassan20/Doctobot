import 'package:flutter/material.dart';

import 'build_boarding_item.dart';
import 'const.dart';
import 'list_of_boarding.dart';

class BuildPageView extends StatefulWidget {
   BuildPageView({Key? key}) : super(key: key);

  @override
  State<BuildPageView> createState() => _BuildPageViewState();
}

class _BuildPageViewState extends State<BuildPageView> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller:  boardController ,
        onPageChanged: (int index){
          if(index == boarding.length-1)
          {
            setState(() {
              isLast = true;
            });
          }else{
            setState(() {
              isLast = false;
            });
          }
        },
        itemBuilder: (context , index) => BuildBoardingItem(model: boarding[index]),
        itemCount:boarding.length ,
      ),
    );
  }
}
