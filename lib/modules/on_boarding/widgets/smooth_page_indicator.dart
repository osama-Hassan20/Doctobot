import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../shared/styles/colors.dart';
import 'const.dart';
import 'list_of_boarding.dart';

class SmoothPageIndicatorItem extends StatefulWidget {
  const SmoothPageIndicatorItem({Key? key}) : super(key: key);

  @override
  State<SmoothPageIndicatorItem> createState() => _SmoothPageIndicatorItemState();
}

class _SmoothPageIndicatorItemState extends State<SmoothPageIndicatorItem> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: boardController,
      count: boarding.length,
      effect: ExpandingDotsEffect(
          activeDotColor: defaultColor,
          dotColor: Colors.grey,
          dotHeight: 10,
          expansionFactor: 3,
          dotWidth: 12,
          spacing: 6,
      ),
    );
  }
}
