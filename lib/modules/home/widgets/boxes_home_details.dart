import 'package:flutter/material.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/widgets/box_details.dart';

class BoxesHomeDetails extends StatelessWidget {
  const BoxesHomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            BoxDetails(
              title: 'Today Appointments',
              body: '0',
            ),
            SizedBox(width: size.width *0.04,),
            BoxDetails(
              title: 'Available Doctors',
              body: '${DocCubit.get(context).allDoctorsModel!.results}',
            ),
          ],
        ),
        SizedBox(height: size.height *0.028,),
        Row(
          children: [
            BoxDetails(
              title: 'Available Nurses',
              body: '${DocCubit.get(context).allNursesModel!.results}',
            ),
            SizedBox(width: size.width *0.04,),
            BoxDetails(
              title: 'Medications',
              body: '150',
            ),
          ],
        ),
        SizedBox(height: size.height *0.03,),
      ],
    );
  }
}
