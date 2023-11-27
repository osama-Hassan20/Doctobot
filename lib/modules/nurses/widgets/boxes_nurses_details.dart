import 'package:flutter/material.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../shared/components/widgets/box_details.dart';

class BoxesNursesDetails extends StatelessWidget {
  const BoxesNursesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var busy = DocCubit.get(context)
        .allNursesModel!
        .paginationResult!
        .limit!
        .toInt() -
        DocCubit.get(context).allNursesModel!.results!.toInt();
    return Column(
      children: [
        BoxDetails(
          title: 'All Nurses',
          body:
          '${DocCubit.get(context).allNursesModel!.paginationResult!.limit}',
          width: .94,
        ),
        SizedBox(
          height: size.height * 0.028,
        ),
        Row(
          children: [
            BoxDetails(
              title: 'Available Nurses',
              body:
              '${DocCubit.get(context).allNursesModel!.results}',
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            BoxDetails(
              title: 'Busy Nurses',
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
