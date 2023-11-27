import 'package:doctobot_app_project/modules/nurses/widgets/nurses_screen_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/doc_app/cubit/cubit.dart';
import '../../layout/doc_app/cubit/states.dart';

class NursesScreen extends StatelessWidget {
  const NursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocCubit, DocStates>(
      listener: (context, state){},
      builder: (context , state){
        return NursesScreenDetails();
      },
    );
  }



}
