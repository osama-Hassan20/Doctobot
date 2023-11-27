import 'package:doctobot_app_project/layout/doc_app/cubit/cubit.dart';
import 'package:doctobot_app_project/layout/doc_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


class DocLayout extends StatelessWidget {
  const DocLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocCubit , DocStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = DocCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor:  DocCubit.get(context).isDark ? HexColor('#262626') : HexColor('#FFFFFF'),
            title: Text(
              'DoctoBot',
            ),
            actions: [
              Image(image: AssetImage('assets/images/doctobot_logo.png',),),
              SizedBox(width: 15,),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },

    );
  }
}
