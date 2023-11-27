import 'package:doctobot_app_project/modules/doctors/widgets/doctors_screen_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/doc_app/cubit/cubit.dart';
import '../../layout/doc_app/cubit/states.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocCubit, DocStates>(
      builder: (context, state) {
        return DoctorsScreenDetails();
      },
    );
  }
}
