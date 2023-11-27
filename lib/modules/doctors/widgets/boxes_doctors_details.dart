import 'package:flutter/material.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/widgets/box_details.dart';

class BoxesDoctorsDetails extends StatelessWidget {
  const BoxesDoctorsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var busy = DocCubit.get(context)
        .allDoctorsModel!
        .paginationResult!
        .limit!
        .toInt() -
        DocCubit.get(context).allDoctorsModel!.results!.toInt();
    return Column(
      children: [
        BoxDetails(
          title: 'All Doctors',
          body:
          '${DocCubit.get(context).allDoctorsModel!.paginationResult!.limit}',
          width: .94,
        ),
        SizedBox(
          height: size.height * 0.028,
        ),
        Row(
          children: [
            BoxDetails(
              title: 'Available Doctors',
              body:
              '${DocCubit.get(context).allDoctorsModel!.results}',
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            BoxDetails(
              title: 'Busy Doctors',
              body: '${busy}',
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
      ],
    );
  }
}
