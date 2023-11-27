import 'package:doctobot_app_project/layout/doc_app/cubit/cubit.dart';
import 'package:doctobot_app_project/layout/doc_app/cubit/states.dart';
import 'package:doctobot_app_project/modules/home/widgets/home_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import '../../models/get_all_doctors_model.dart';
import '../../models/get_all_nurses_model.dart';
import '../../shared/components/components.dart';
import '../doctors/doctor_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocCubit, DocStates>(
      builder: (context, state) {
        return HomeDetails();
      },
    );
  }
}

