import 'package:doctobot_app_project/modules/on_boarding/widgets/build_page_view.dart';
import 'package:doctobot_app_project/modules/on_boarding/widgets/const.dart';
import 'package:doctobot_app_project/modules/on_boarding/widgets/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';


class OnBoardingScreen extends StatefulWidget
{

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  void submit(){
    CacheHelper.saveData(
        key: 'onBoarding',
        value: true
    ).then((value)
    {
      if(value!){

        navigateAndFinish(context, LoginScreen());


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            defaultTextButton(
                function:submit,
                text: 'skip',

            )

          ],
        ),
        body: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height /80) ,
          child: Column(
            children: [
              BuildPageView(),
              SizedBox(
                height: MediaQuery.of(context).size.height /48,
              ),
              Row(
                children: [
                  SmoothPageIndicatorItem(),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: ()
                    {
                      if(isLast){
                        submit();
                      }else{
                        boardController.nextPage(
                            duration: Duration(
                                milliseconds: 750
                            ),
                            curve: Curves.decelerate);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
    );
  }
}
